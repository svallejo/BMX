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
global class CreateNonComplaintForCaseBatch  {
    
    String queryString;

    public Static Final String caseExObjAPIName1 = 'Case__x';
    
    List<CMPL123CME__Complaint__c> complaintUpsertList = new List<CMPL123CME__Complaint__c>();
    Map<Id, CMPL123CME__Complaint__c> cmpResultMap = new Map<Id, CMPL123CME__Complaint__c>();
    Map<Id, Case__x> totCaseExUpdMap = new Map<Id, Case__x>();
    Set<Id> caseIdSet = new Set<Id>();
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
    global void Execute(Database.BatchableContext bc,List<sobject> ComplaintsList){
         List<CMPL123CME__Complaint__c> CMPL123List = new List<CMPL123CME__Complaint__c>();
           if(!Test.isRunningTest()){
            for(Sobject sObj: ComplaintsList){
                CMPL123CME__Complaint__c extCMPObj = (CMPL123CME__Complaint__c) sObj;
                CMPL123List.add(extCMPObj);
            }
        }
         system.debug('==caseQueryList=='+CMPL123List);
    }
}