/**
 * @File Name          : SapCalloutMock.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 1/14/2020, 4:34:52 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    1/14/2020   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
@isTest(SeeAllData=true)
global class SapCalloutMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        SAP_Product_Interface__c productInterface = SAP_Product_Interface__c.getInstance();
        System.assert(req.getEndpoint().contains(productInterface.Endpoint__c));
        System.assertEquals('cNyfOZd1v3Oii6zKT4aoIfvjDClC2Vjr', req.getHeader('APIKey'));
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody(SapCalloutMockRequest.multiProduct);
        res.setStatusCode(200);
        return res;
    }
}