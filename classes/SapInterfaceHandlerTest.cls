/**
 * @File Name          : SapInterfaceHandlerTest.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 1/14/2020, 5:26:28 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    1/14/2020   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
@IsTest
public class SapInterfaceHandlerTest {
    private static final String PRODUCT_PARAM_PREFIX = '?productID=';
    private static final String ESCAPED_SINGLE_QUOTE = '\'';
    @IsTest
    public static void transformSapProductInformation_IdIsCloned(){
        CMPL123QMS__Change_Control__c cc = Testsetup.createChangeControl(true);
        SapProductInformation productInformation = new SapProductInformation();
        productInformation.productItemNumber = 'test123';
        CMPL123QMS__Change_Control__c updatedCC = SapInterfaceHandler.transformSapProductInformation(cc, productInformation);
        System.assertEquals(cc.id, updatedCC.id);
        System.assertEquals(productInformation.productItemNumber, updatedCC.Product_Item_Number__c);
    }

    @IsTest
    public static void updateChangeControlWithProductInformation_updatedCC(){
        CMPL123QMS__Change_Control__c cc = Testsetup.createChangeControl(false);
        cc.Product_Item_Number__c = 'test12345';
        insert cc;

        SapProductInformation productInformation = new SapProductInformation();
        productInformation.productItemNumber = 'test123';

        SapInterfaceHandler.updateChangeControlWithProductInformation(productInformation, cc.id);
        CMPL123QMS__Change_Control__c updatedCC = [select id, product_item_number__c from  CMPL123QMS__Change_Control__c where id=:cc.id];
        System.assertNotEquals('test12345', updatedCC.Product_Item_Number__c);
    }

    @IsTest(SeeAllData=true)
    public static void createHttpRequest_createdRequest(){
        String productItemNum = 'test123';
        String url = PRODUCT_PARAM_PREFIX + ESCAPED_SINGLE_QUOTE + productItemNum + ESCAPED_SINGLE_QUOTE;

        HttpRequest req = SapInterfaceHandler.createHttpRequest(productItemNum);
        SAP_Product_Interface__c productInterface = SAP_Product_Interface__c.getInstance();
        
        System.assertEquals(productInterface.Endpoint__c + url, req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
    }

    @IsTest
    public static void createProductUrlParam_createdUrl(){
        String productItemNum = 'test123';
        String url = PRODUCT_PARAM_PREFIX + ESCAPED_SINGLE_QUOTE + productItemNum + ESCAPED_SINGLE_QUOTE;
        String actualUrl = SapInterfaceHandler.createProductUrlParam(productItemNum);
        System.assertEquals(url, actualUrl);
    }

    @IsTest(SeeAllData=true)
    public static void sapCallout_validRequestResponse(){
        String productItemNum = '34*';
        String url = PRODUCT_PARAM_PREFIX + ESCAPED_SINGLE_QUOTE + productItemNum + ESCAPED_SINGLE_QUOTE;
        HttpRequest req = SapInterfaceHandler.createHttpRequest(productItemNum);
        Test.setMock(HttpCalloutMock.class, new SapCalloutMock());
        HttpResponse res = SapInterfaceHandler.sapCallout(req);
        String contentType = res.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = res.getBody();
        System.assert(!String.isEmpty(actualValue));
        System.assertEquals(200, res.getStatusCode());
    }

    @IsTest(SeeAllData=true) 
    public static void retrieveSapProductInformation_isValid(){
        String productItemNum = '34*';
        String url = PRODUCT_PARAM_PREFIX + ESCAPED_SINGLE_QUOTE + productItemNum + ESCAPED_SINGLE_QUOTE;
        HttpRequest req = SapInterfaceHandler.createHttpRequest(productItemNum);
        Test.setMock(HttpCalloutMock.class, new SapCalloutMock());
        List<SapProductInformation> prodItemNumberList = SapInterfaceHandler.retrieveSapProductInformation(productItemNum);
        System.assert(prodItemNumberList.size() > 0);
    }

    @IsTest
    public static void transformSapInterfaceResponse_nothingReturned(){
        List<SapProductInformation> prodList = SapInterfaceHandler.transformSapInterfaceResponse('');
        System.assert(prodList.isEmpty());
    }
}