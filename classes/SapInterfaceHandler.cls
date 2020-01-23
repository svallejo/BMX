/**
 * @File Name          : SapInterfaceHandler.cls
 * @Description        : 
 * @Author             : Jon Astemborski
 * @Group              : 
 * @Last Modified By   : Jon Astemborski
 * @Last Modified On   : 1/23/2020, 12:44:06 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    1/15/2020   Jon Astemborski     Initial Version
**/
public without Sharing class SapInterfaceHandler {
    public static final String PRODUCT_PARAM_PREFIX = '?productID=';
    public static final String ESCAPED_SINGLE_QUOTE = '\'';
    public static final String GET_METHOD = 'GET';
    public static final String ID = 'Id';
    public static final String SAP_PRODUCT = 'Product';
    public static final String SAP_PRODUCT_RANGE = 'ProductRange';
    public static final String SAP_PRODUCT_STANDARD_ID = 'ProductStandardID';
    public static final String SAP_PRODUCT_DESCRIPTION = 'ProductDescription';
    public static final String SAP_DESCRIPTIONS = 'Descriptions';
    public static final String SAP_CHARACTERISTICS = 'Characteristics';
    public static final String SAP_RESULTS = 'results';
    public static final String SAP_VALUATION = 'Valuation';
    public static final String SAP_ELEMENT = 'element';
    public static final String SAP_CODE = 'code';
    public static final String SAP_ERROR_CODE = '$';
    public static final String SAP_ERROR_MESSAGE = 'message';
    public static final String SAP_CHAR_VALUE = 'CharcValue';
    public static final String SAP_CHAR_ID = 'CharcInternalID';
    public static final String EMPTY_STRING_ESCAPED = '\"\"';

    @AuraEnabled
    public static List<SapProductInformation> productInformationList {get; set;} 

    @TestVisible
    private static String createProductUrlParam(String productItemNumber){
        return PRODUCT_PARAM_PREFIX + ESCAPED_SINGLE_QUOTE + productItemNumber + ESCAPED_SINGLE_QUOTE;
    }
    @AuraEnabled
    public static List<SapProductInformation> retrieveSapProductInformation(String productItemNumber){
        HttpRequest request = createHttpRequest(productItemNumber);
        HttpResponse sapResponse = sapCallout(request);
        List<SapProductInformation> productInformationList = transformSapInterfaceResponse(sapResponse.getBody());
        return productInformationList;
    }

    @TestVisible
    private static void checkForError(Map<String, Object> response){
        System.debug('error: ' + response);
        if ( response.containsKey(SAP_CODE)) {
            Map<String, Object> errorCodeMap = (Map<String, Object>) response.get(SAP_CODE);
            if (errorCodeMap.containsKey(SAP_ERROR_MESSAGE) && !(errorCodeMap.get(SAP_ERROR_MESSAGE) instanceof String)) {
                Map<String, Object> errorMessageMap = (Map<String, Object>) errorCodeMap.get(SAP_ERROR_MESSAGE);
                throw new AuraHandledException(errorMessageMap.get(SAP_ERROR_CODE).toString());
            }
        }
    }

    @TestVisible
    private static List<Object> buildProductObjectListFromResponse(Map<String, Object> response){
        checkForError(response);
       
        List<Object> productList = new List<Object>();
        if (hasMultipleProducts(response)) {
            productList = (List<Object>)response.get(SAP_PRODUCT);
        }
        else {
            productList.add((Object)response.get(SAP_PRODUCT));
        }
        return productList;
    }

    @TestVisible
    private static boolean hasMultipleProducts(Map<String, Object> response){
        return response.get(SAP_Product) instanceof List<Object>;
    }

    @TestVisible
    private static boolean hasResponse(String sapResponse){
        return !sapResponse.equals(EMPTY_STRING_ESCAPED);
    }
    
    /**
        Handles parsing of SAP Response. We have to deserialize untyped 
     */
     @TestVisible
    private static List<SapProductInformation> transformSapInterfaceResponse(String sapResponse){
        if (!hasResponse(sapResponse)){
            return new List<SapProductInformation>();
        }
        List<SapProductInformation> prodInfoList = new List<SapProductInformation>();
        Map<String, Object> response = (Map<String, Object>) JSON.deserializeUntyped(sapResponse);
        List<Object> productList = buildProductObjectListFromResponse(response);

       for (Object product : productList) {
            SapProductInformation prodInfo = new SapProductInformation();
            List<Map<String, Object>> characteristicMapList = new List<Map<String, Object>>();
            Map<String, Object> prodObjMap = (Map<String, Object>) product;
            prodInfo.productItemNumber = (String) prodObjMap.get(SAP_PRODUCT);
            prodInfo.productRange = (String) prodObjMap.get(SAP_PRODUCT_RANGE);
            prodInfo.gtin = (String) prodObjMap.get(SAP_PRODUCT_STANDARD_ID);
            SapProductInformation prodWithDescription = buildProductDescription(prodObjMap, prodInfo);
            SapProductInformation prodWithDescriptionAndCharacteristics =  buildProductCharacteristics(prodObjMap, prodWithDescription);
            prodInfoList.add(prodWithDescriptionAndCharacteristics);
        }
        return prodInfoList;
    }

    @TestVisible
    private static SapProductInformation buildProductDescription(Map<String, Object> prodObjMap,
                                                                 SapProductInformation prodInfo){
        SapProductInformation productInformation = new SapProductInformation.Builder(prodInfo).build();
        if (prodObjMap.containsKey(SAP_DESCRIPTIONS) && !(prodObjMap.get(SAP_DESCRIPTIONS) instanceof String)) {
            Map<String, Object> descriptionMap = (Map<String, Object>) prodObjMap.get(SAP_DESCRIPTIONS);
            if (descriptionMap.containsKey(SAP_RESULTS)  &&!(descriptionMap.get(SAP_RESULTS) instanceof String)) {
                Map<String, Object> descriptionResultsMap = (Map<String, Object>) descriptionMap.get(SAP_RESULTS);
                if (descriptionResultsMap.containsKey(SAP_ELEMENT)  && !(descriptionResultsMap.get(SAP_ELEMENT) instanceof String)) {
                    Map<String, Object> descriptionElementMap = (Map<String, Object>) descriptionResultsMap.get(SAP_ELEMENT);
                    productInformation.productDescription = (String)descriptionElementMap.get(SAP_PRODUCT_DESCRIPTION);
                }
            }
        }
        return productInformation;
    }

    @TestVisible
    private static SapProductInformation buildProductCharacteristics(Map<String, Object> prodObjMap,
                                                                     SapProductInformation currentProduct ){
        SapProductInformation productInformation = new SapProductInformation.Builder(currentProduct).build();
        if ( !(prodObjMap.get(SAP_CHARACTERISTICS) instanceof String)){
            Map<String, Object> characteristicMap = (Map<String, Object>) prodObjMap.get(SAP_CHARACTERISTICS);
            if (!(characteristicMap.get(SAP_RESULTS) instanceof String)) {
                Map<String, Object> resultsMap = (Map<String, Object>) characteristicMap.get(SAP_RESULTS);
                if (!(resultsMap.get(SAP_ELEMENT) instanceof String)) {
                    List<Object> elementList = new List<Object>();
                    if ( resultsMap.get(SAP_ELEMENT) instanceof List<Object>) {
                        elementList = (List<Object>) resultsMap.get(SAP_ELEMENT);
                    }
                    else if (!(resultsMap.get(SAP_ELEMENT) instanceof String)) 
                    {
                        elementList.add((Object) resultsMap.get(SAP_ELEMENT)); 
                    }
                    List<Map<String, Object>> elementMapList = new List<Map<String, Object>>();
                    for (Object element : elementList) {
                        Map<String, Object> elementsMap = (Map<String, Object>) element;
                        String fieldName = (String) elementsMap.get(SAP_CHAR_ID);
                        elementMapList.add((Map<String, Object>)element);
                        if (!(elementsMap.get(SAP_VALUATION) instanceof String)) {
                            Map<String, Object> valuationMap = (Map<String, Object>) elementsMap.get(SAP_VALUATION);
                            if (!(valuationMap.get(SAP_RESULTS) instanceof String)) {
                                Map<String, Object> results2Map = (Map<String, Object>) valuationMap.get(SAP_RESULTS);
                                if (!(results2Map.get(SAP_ELEMENT) instanceof String)) {
                                    Map<String, Object> elements2Map = (Map<String, Object>) results2Map.get(SAP_ELEMENT);
                                    String fieldValue = (String) elements2Map.get(SAP_CHAR_VALUE);
                                    productInformation.buildFromString(fieldName, fieldValue);
                                }
                            }
                        }
                    }
                }
            }
        }
        return productInformation;
    }

    @TestVisible
    private static HttpResponse sapCallout(HttpRequest request){
        try {
            Http http = new Http();
            HttpResponse httpResponse = http.send(request);
            return httpResponse;
        } 
        catch (Exception e) {
            throw new AuraHandledException('Unable to retrieve response from SAP. Please try again. If problem persists please contact your System Administrator. \n'+e.getMessage());          
        }
    }

    @TestVisible
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
            System.debug(currentCc);
            CMPL123QMS__Change_Control__c updatedCC = transformSapProductInformation(currentCC, selectedProduct);
            update updatedCC;
        }
        catch (DmlException dmlException){
            throw new AuraHandledException('Unable update Change Control.\n'+dmlException.getMessage());          
        }
    }
    
    /**
        Utility class which updates the existing Change Control with information parsed from the SAP Response. 
     */
     @TestVisible
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