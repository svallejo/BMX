/**
*   @description Clone document controller. Main functionality is seeting lookup to prior version of a document
*	@author Jon Astemborski
*/
public without Sharing class SapInterfaceHandler {
    private static final String PRODUCT_PARAM_PREFIX = '?productID=';
    private static final String ESCAPED_SINGLE_QUOTE = '\'';
    private static final String GET_METHOD = 'GET';
    private static final String ID = 'Id';
    private static final String SAP_PRODUCT = 'Product';
    private static final String SAP_PRODUCT_RANGE = 'ProductRange';
    private static final String SAP_PRODUCT_STANDARD_ID = 'ProductStandardID';
    private static final String SAP_CHARACTERISTICS = 'Characteristics';
    private static final String SAP_RESULTS = 'results';
    private static final String SAP_VALUATION = 'Valuation';
    private static final String SAP_ELEMENT = 'element';

    private static String createProductUrlParam(String productItemNumber){
        return PRODUCT_PARAM_PREFIX + ESCAPED_SINGLE_QUOTE + productItemNumber + ESCAPED_SINGLE_QUOTE;
    }
    @AuraEnabled
    public static List<SapProductInformation> retrieveSapProductInformation(String productItemNumber){
        HttpRequest request = createHttpRequest(productItemNumber);
        String sapResponse = sapCallout(request);
        List<SapProductInformation> productInformationList = transformSapInterfaceResponse(sapResponse);
        return productInformationList;
    }
    
    private static List<SapProductInformation> transformSapInterfaceResponse(String sapResponse){
        if (sapResponse.equals('\"\"')){
            return new List<SapProductInformation>();
        }
        List<SapProductInformation> prodInfoList = new List<SapProductInformation>();
        Map<String, Object> response = (Map<String, Object>) JSON.deserializeUntyped(sapResponse);
        List<Map<String, Object>> productMapList = new List<Map<String, Object>>();
        List<Object> productList = new List<Object>();

        if ( response.get(SAP_Product) instanceof List<Object>){
            productList = (List<Object>)response.get(SAP_PRODUCT);
        }
        else {
            productList.add((Object)response.get(SAP_PRODUCT));
        }        
       for (Object product : productList) {
            SapProductInformation prodInfo = new SapProductInformation();
            productMapList.add((Map<String, Object>)product);
            List<Map<String, Object>> characteristicMapList = new List<Map<String, Object>>();
            Map<String, Object> prodObjMap = (Map<String, Object>) product;
            prodInfo.productItemNumber = (String) prodObjMap.get(SAP_PRODUCT);
            prodInfo.productRange = (String) prodObjMap.get(SAP_PRODUCT_RANGE);
            prodInfo.gtin = (String) prodObjMap.get(SAP_PRODUCT_STANDARD_ID);
            Map<String, Object> descriptionMap = (Map<String, Object>) prodObjMap.get('Descriptions');
            Map<String, Object> descriptionResultsMap = (Map<String, Object>) descriptionMap.get('results');
            Map<String, Object> descriptionElementMap = (Map<String, Object>) descriptionResultsMap.get('element');
            prodInfo.productDescription = (String)descriptionElementMap.get('ProductDescription');
            for ( Map<String, Object> characteristic :  productMapList ){
                if ( !(characteristic.get('Characteristics') instanceof String)){
                    Map<String, Object> characteristicMap = (Map<String, Object>) characteristic.get('Characteristics');
                    if (!(characteristicMap.get('results') instanceof String)) {
                        Map<String, Object> resultsMap = (Map<String, Object>) characteristicMap.get('results');
                            if (!(resultsMap.get('element') instanceof String)) {
                            List<Object> elementList = (List<Object>) resultsMap.get('element');
                            List<Map<String, Object>> elementMapList = new List<Map<String, Object>>();
                            for (Object element : elementList) {
                                Map<String, Object> elementsMap = (Map<String, Object>) element;
                                String fieldName = (String) elementsMap.get('CharcInternalID');
                                elementMapList.add((Map<String, Object>)element);
                                if (!(elementsMap.get('Valuation') instanceof String)) {
                                    Map<String, Object> valuationMap = (Map<String, Object>) elementsMap.get('Valuation');
                                    if (!(valuationMap.get('results') instanceof String)) {
                                        Map<String, Object> results2Map = (Map<String, Object>) valuationMap.get('results');
                                        if (!(results2Map.get('element') instanceof String)) {
                                            Map<String, Object> elements2Map = (Map<String, Object>) results2Map.get('element');
                                            String fieldValue = (String) elements2Map.get('CharcValue');
                                            prodInfo.buildFromString(fieldName, fieldValue);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            System.debug('Prod info: ' + prodInfo);
            prodInfoList.add(prodInfo);
        }
        System.debug('prod list: ' + prodInfoList);
        return prodInfoList;
    }

    private static String sapCallout(HttpRequest request){
        try {
            Http http = new Http();
            HttpResponse httpResponse = http.send(request);
            return httpResponse.getBody();
        } 
        catch (Exception e) {
            throw new AuraHandledException('Unable to retrieve response from SAP. Please contact your System Administrator. \n'+e.getMessage());          
        }
    }

    private static HttpRequest createHttpRequest(String productItemNumber){
        SAP_Product_Interface__c productInterface = SAP_Product_Interface__c.getInstance();
        HttpRequest req = new HttpRequest();
        req.setHeader(productInterface.auth_header_name__c, productInterface.auth_token__c);
        req.setEndpoint(productInterface.endpoint__c + createProductUrlParam(productItemNumber));
        req.setMethod(GET_METHOD);
        return req;
    }

    @AuraEnabled
    public static void updateChangeControlWithProductInformation(SapProductInformation selectedProduct, Id recordId){
        try { 
            CMPL123QMS__Change_Control__c currentCC = [SELECT Id, Name, Product_Item_Number__c, Product_Item_Description__c, Product_Range__c, Global_Trade_Identification_Number__c,
                                                    CE_Approved__c, Product_Type__c, Make_or_Buy__c, Trade_Type__c, Legal_Manufacturer__c, Site_Responsible__c,
                                                    Commercialization_Coverage__c, Origin__c FROM CMPL123QMS__Change_Control__c
                                                    WHERE Id = :recordId];
                                                    System.debug('sap ' + selectedProduct);
            CMPL123QMS__Change_Control__c updatedCC = transformSapProductInformation(currentCC, selectedProduct);
            System.debug('updated cc: ' + updatedCC);
            update updatedCC;
        }
        catch (DmlException dmlException){
            throw new AuraHandledException('Unable update Change Control.\n'+dmlException.getMessage());          
        }
    }
    
    /**
        Utility class which updates the existing Change Control with information parsed from the SAP Response. 
     */
    private static CMPL123QMS__Change_Control__c transformSapProductInformation(CMPL123QMS__Change_Control__c cc, SapProductInformation selectedProduct){
        CMPL123QMS__Change_Control__c updatedCC = cc.clone(true);
        updatedCC.Product_Item_Number__c = selectedProduct.productItemNumber;
        updatedCC.Product_Item_Description__c = selectedProduct.productDescription;
        updatedCC.Product_Range__c = selectedProduct.productRange;
        updatedCC.Global_Trade_Identification_Number__c = selectedProduct.gtin;
        updatedCC.CE_Approved__c = selectedProduct.ceApproved;
        updatedCC.Product_Type__c = selectedProduct.productType;
        updatedCC.Make_or_Buy__c = selectedProduct.makeOrBuy;
        updatedCC.Trade_Type__c = selectedProduct.tradeType;
        updatedCC.Legal_Manufacturer__c = selectedProduct.legalManufacturer;
        updatedCC.Site_Responsible__c = selectedProduct.siteResponsible;
        updatedCC.Commercialization_Coverage__c = selectedProduct.commercializationCoverage;
        updatedCC.Origin__c = selectedProduct.originAnimalHuman;
        return updatedCC;
    }
}