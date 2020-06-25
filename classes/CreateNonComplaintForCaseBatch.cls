/**
*  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
* @Who   : Copyright (c) 2020 - 2021  Cognizant Technologies Solutions Pvt Ltd.
* @What  : CreateNonComplaintForCaseBatch
* @Why   : Batch class to create Non Complaint records from the Cases which are of type "Non Technical Complaint" coming from CRM through External Data Source.
*          Also getting All open Records when User Modified or Create "Non Technical Complaint"Records from last Six Months data to upate the Complaints as Closed Cancel.
* @When  : 25-06-2020

*  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
*  Modification Log:  
*  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
*   Developer                Date             Description 
*  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
*   MALLI Sekhar           25-06-2020         Created.
*  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
**/
global class CreateNonComplaintForCaseBatch implements Database.Batchable<sObject>, Database.Stateful {
    
    String queryString;
    public Static Final String caseExObjAPIName1 = 'Case__x';
    
    Map<Id, CMPL123CME__Complaint__c> cmpResultMap = new Map<Id, CMPL123CME__Complaint__c>();
    List<CMPL123CME__Complaint__c> CMPL123List = new List<CMPL123CME__Complaint__c>();
    List<CMPL123CME__Complaint__c> CMPUpdatelist = new List<CMPL123CME__Complaint__c>();
    //Map<Id, Case__x> totCaseExUpdMap = new Map<Id, Case__x>();
    //Set<Id> caseIdSet = new Set<Id>();
    
    //Intializing external Case query string, limit count and latest time stamp in the constructor
    global CreateNonComplaintForCaseBatch(String queryString) {
        this.queryString = queryString;
       
    }
    
    // querying the external Case records
    global Database.QueryLocator start(Database.BatchableContext bc) { 
        if(!Test.isRunningTest()){
            return Database.getQueryLocator(queryString);
        }else{
		    //string Query='SELECT Id,BMX_CaseNumber__c,CMPL123CME__CMPL123_WF_Status__c,Name from CMPL123CME__Complaint__c WHERE CMPL123CME__CMPL123_WF_Status__c='Opened' AND Createddate=LAST_YEAR'
            return Database.getQueryLocator('SELECT Id,BMX_CaseNumber__c,CMPL123CME__CMPL123_WF_Status__c,Name from CMPL123CME__Complaint__c WHERE CMPL123CME__CMPL123_WF_Status__c= \'Opened\'AND BMX_CaseNumber__c!=Null AND Createddate=LAST_YEAR');
        } 
    }
    global void Execute(Database.BatchableContext bc,List<CMPL123CME__Complaint__c> ComplaintsList){
        
        Set<Id> SetIds=new Set<Id>();
        List<Case__x> caseExList = new List<Case__x>();
        for(Case__x csx : [SELECT Id, CaseNumber_c__c,Type__c from Case__x WHERE Type__c!='TechnicalComplaint']){
        if ( csx.CaseNumber_c__c == csx.CaseNumber__c) { // As of Winter 20' Direct field comparisons aren't allowed within SOQL
                caseExList.add(csx);
            }
        }
        system.debug('caseExList...'+caseExList);
        if(Test.isRunningTest()){
            caseExList.add(BMX_TestDataFactory.getCaseExRecords());
        }                     
        
         for(Case__x cs : caseExList) {
          	SetIds.add(cs.ExternalId);
          }
      
        for(CMPL123CME__Complaint__c CMPScope:[Select id,BMX_Case_External__c,BMX_CaseNumber__c,BMX_Case_Type__c,CMPL123CME__CMPL123_WF_Status__c from CMPL123CME__Complaint__c WHERE BMX_Case_Type__c!='TechnicalComplain' AND BMX_Case_External__c in:SetIds]){
             cmpResultMap.put(CMPScope.BMX_Case_External__c, CMPScope);
             CMPL123List.add(CMPScope);
        }
         for(CMPL123CME__Complaint__c CMPScopevalue:CMPL123List){
             if(CMPScopevalue.BMX_Case_Type__c!='TechnicalComplaint')
             CMPScopevalue.CMPL123CME__CMPL123_WF_Status__c='Closed-Canceled';
             CMPUpdatelist.add(CMPScopevalue);
         } 
           system.debug('CMPUpdatelist....'+CMPUpdatelist);
           if(!CMPL123List.isEmpty()){
           Database.update(CMPL123List, false);
        }
    }
    global void finish(Database.BatchableContext bc){
    
    }
}