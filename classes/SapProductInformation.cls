public without sharing class SapProductInformation {
    @AuraEnabled
    public String productItemNumber {get;set;}
    @AuraEnabled
    public String productDescription {get;set;}
    @AuraEnabled
    public String productRange {get;set;}
    @AuraEnabled
    public String productType {get;set;}
    @AuraEnabled
    public String makeOrBuy {get;set;}
    @AuraEnabled
    public String tradeType {get;set;}
    @AuraEnabled
    public String legalManufacturer {get;set;}
    @AuraEnabled
    public String siteResponsible {get;set;}
    @AuraEnabled
    public String gtin {get;set;}
    @AuraEnabled
    public String ceApproved {get;set;}
    @AuraEnabled
    public String commercializationCoverage {get;set;}
    @AuraEnabled
    public String originAnimalHuman {get;set;}

    private static final String SAP_PRODUCT_ITEM_NUM = 'Product';
    private static final String SAP_PRODUCT_ITEM_DESCRIPTION = 'ProductDescription';
    private static final String SAP_PRODUCT_RANGE = 'ProductRange';
    private static final String SAP_GTIN = 'ProductStandardID';

    private static final String SAP_CE_Approved = 'CE_MARKED';
    private static final String SAP_PRODUCT_TYPE = 'MARKET_TYPE'; 
    private static final String SAP_MAKE_OR_BUY = 'MAKE_BUY';
    private static final String SAP_TRADE_TYPE = 'TRADE_TYPE';
    private static final String SAP_LEGAL_MANUFACTURER = 'LEGAL_MANUFACTURER';
    private static final String SAP_SITE_RESPONSIBLE = 'SITE_RESPONSIBLE';
    private static final String SAP_COMMERCIALIZATION_CHANGE= 'LOCAL_MARKET'; 
    private static final String SAP_HUMAN_ANIMAL_ORIGIN = 'HA_ORIGIN';

    public SapProductInformation() {
        productItemNumber = '';
        productDescription = '';
        productRange = '';
        productType = '';
        makeOrBuy = '';
        tradeType = '';
        legalManufacturer = '';
        siteResponsible = '';
        gtin = '';
        ceApproved = '';
        commercializationCoverage = '';
        originAnimalHuman = '';
    }

    public override String toString(){
        return this.productItemNumber;
    }

    public void buildFromString(String fieldName, String value){
        switch on fieldName{
            when 'CE_MARKED'{
                this.ceApproved = value;
            }
            when 'MARKET_TYPE'{
                this.productType = value;
            }
            when 'MAKE_BUY'{
                this.makeOrBuy = value;
            }
            when 'TRADE_TYPE'{
                this.tradeType = value;
            }
            when 'LEGAL_MANUFACTURER'{
                this.legalManufacturer = value;
            }
            when 'SITE_RESPONSIBLE'{
                this.siteResponsible = value;
            }
            when 'LOCAL_MARKET'{
                this.commercializationCoverage = value;
            }
            when 'HA_ORIGIN'{
                this.originAnimalHuman = value;
            }
        }
       
    }
}