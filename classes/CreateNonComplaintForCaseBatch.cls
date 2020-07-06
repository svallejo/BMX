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
    public Integer count = 0;
    Map<Id, CMPL123CME__Complaint__c> cmpResultMap = new Map<Id, CMPL123CME__Complaint__c>();
    List<CMPL123CME__Complaint__c> CMPL123List = new List<CMPL123CME__Complaint__c>();
    List<CMPL123CME__Complaint__c> complaintUpdate = new List<CMPL123CME__Complaint__c>();
    list<CMPL123CME__Investigation__c> investlist=new list<CMPL123CME__Investigation__c>();
     list<CMPL123CME__Investigation__c> investupdate=new list<CMPL123CME__Investigation__c>();
    
    //Map<Id, Case__x> totCaseExUpdMap = new Map<Id, Case__x>();
    //Set<Id> caseIdSet = new Set<Id>();
    
    //Intializing external Case query string, limit count and latest time stamp in the constructor
   
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
       
        List<Case__x> caseExList = new List<Case__x>();
        Set<Id> SetIds=new Set<Id>();
        CMPL123CME__Complaint__c CMPlist=[SELECT Id,BMX_CaseNumber__c,CMPL123CME__CMPL123_WF_Status__c,Name from CMPL123CME__Complaint__c WHERE CMPL123CME__CMPL123_WF_Status__c= 'Opened'AND BMX_CaseNumber__c!=Null AND Createddate=LAST_YEAR];
        for(Case__x csx : [SELECT Id, CaseNumber_c__c,Type__c from Case__x WHERE Type__c!='TechnicalComplaint' AND CaseNumber__c =:CMPlist.BMX_CaseNumber__c]){
           caseExList.add(csx);
        }
        
        for(Case__x cs:caseExList){
            SetIds.add(cs.ExternalId);
        }
        
             for(CMPL123CME__Complaint__c CMPScope:[Select id,BMX_Case_External__c,BMX_CaseNumber__c,BMX_Case_Type__c,CMPL123CME__CMPL123_WF_Status__c from CMPL123CME__Complaint__c WHERE BMX_Case_External__c in:SetIds]){
                 //cmpResultMap.put(CMPScope.BMX_Case_External__c, CMPScope);
                 CMPL123List.add(CMPScope);
            }
            
        
           for(CMPL123CME__Investigation__c Investi:[select id from CMPL123CME__Investigation__c WHERE CMPL123CME__Complaint__c=:CMPL123List]){
           investlist.add(Investi);
           }
            
             for(CMPL123CME__Investigation__c Investcope:investlist){
                 Investcope.CMPL123_WF_Status__c='Closed - Canceled';
                 investupdate.add(Investcope);
             } 
        
        
            for(CMPL123CME__Complaint__c CMPScopevalue:CMPL123List){
                 
                 CMPScopevalue.CMPL123CME__CMPL123_WF_Status__c='Closed-Canceled';
                 complaintUpdate.add(CMPScopevalue);
             } 
        
               system.debug('CMPUpdatelist....'+CMPL123List);
               if(!CMPL123List.isEmpty()){
               Database.update(complaintUpdate, false);
               Database.update(investupdate, false);    
               count++;
               }
        
    }
    global void finish(Database.BatchableContext bc){
    system.debug('count the Records...@@@@'+count);
    }
}