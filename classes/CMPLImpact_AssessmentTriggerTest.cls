/**
 * @File Name          : CMPLImpact_AssessmentTriggerTest.cls
 * @Description        : 
 * @Author             : Jon Astemborski
 * @Group              : 
 * @Last Modified By   : Jon Astemborski
 * @Last Modified On   : 6/9/2020, 11:56:38 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    6/9/2020   Jon Astemborski     Initial Version
**/
@isTest
 public without sharing class CMPLImpact_AssessmentTriggerTest {
	@IsTest
	private static void testAutoGeneratedTrigger() {
		Id ccRecType = Schema.SObjectType.CMPL123QMS__Change_Control__c.getRecordTypeInfosByName().get('CC Custom').getRecordTypeId();
		CMPL123QMS__Change_Control__c cc = TestSetup.createCC(true, ccRecType);
		cc.CMPL123_WF_Status__c = 'Open';
		update cc;
		Impact_Assessment__c ia = TestSetup.createIA(true, cc.id);
		update ia;
		delete ia;
		undelete ia;
	}
}