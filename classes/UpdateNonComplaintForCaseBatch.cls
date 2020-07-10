/**
*  --------------------------------------------------------------------------------------------------------------------------------------
* @Who   : Copyright (c) 2017 - 2019  CTS, Inc.
* @What  : UpdateNonComplaintForCaseBatch
* @Why   : Batch class to create Complaint records from the Cases which are of type "Technical Complaint" coming from CRM through External Data Source.
*          Also few text fields of external Case are getting updated.
* @When  : 09-JULY-2020 

*  --------------------------------------------------------------------------------------------------------------------------------------
*  Modification Log:  
*  --------------------------------------------------------------------------------------------------------------------------------------
*   Developer                Date             Description 
*  --------------------------------------------------------------------------------------------------------------------------------------
*     SHIVA                   09-JULY-2020         Created.
*  --------------------------------------------------------------------------------------------------------------------------------------
**/

global class UpdateNonComplaintForCaseBatch implements Database.Batchable <sObject> {
        
    String queryString;
    
    List<CMPL123CME__Complaint__c> CMPL123List =new list<CMPL123CME__Complaint__c>();       
    // querying the external Case records
    global Database.QueryLocator start(Database.BatchableContext Bc) { 
            queryString = ' SELECT Id, CaseNumber_c__c, Type__c FROM Case__x WHERE Type__c!=\'TechnicalComplaint\' LIMIT 1 ';
            return Database.getQueryLocator(queryString);
        } 
        //system.debug('==queryString=='+queryString); 
        
    global void execute(Database.BatchableContext bc, List<Case__x> caseQuerysObjLst) {
       
       List<Case__x> caseQueryList = new List<Case__x>();  
       
            for(Case__x sObj: caseQuerysObjLst){
                Case__x extCaseObj = (Case__x) sObj;
                caseQueryList.add(extCaseObj);
            }        
        system.debug('==caseQueryList=='+caseQueryList); 
               
        // Sets to keep external record Ids of all the external objects
        Set<Id> caseIdSet = new Set<Id>();        
        // Maps to keep all the external records            
        Map<Id, CMPL123CME__Complaint__c> cmpResultMap = new Map<Id, CMPL123CME__Complaint__c>();
        List<CMPL123CME__Complaint__c> cmpResultList = new List<CMPL123CME__Complaint__c>();
  
        for(Case__x cs : caseQueryList) {
            // populating the sets with the parent Ids of the Case Object
            caseIdSet.add(cs.ExternalId);
        }
       system.debug('==caseIdSet=='+caseIdSet);
        for(CMPL123CME__Complaint__c cmp : [SELECT Id,BMX_CaseNumber__c,CMPL123CME__CMPL123_WF_Status__c,BMX_Case_Type__c,BMX_Case_External__c FROM CMPL123CME__Complaint__c WHERE BMX_Case_External__c!=null AND CMPL123CME__CMPL123_WF_Status__c='Opened' AND BMX_Case_Type__c='TechnicalComplaint' AND BMX_Case_External__c IN : caseIdSet]) {
             
            cmpResultMap.put(cmp.BMX_Case_External__c, cmp);
            //cmpResultList.add(cmp);
        }
        
        for(Case__x cs : caseQueryList){
            CMPL123CME__Complaint__c cmplnt;
            CMPL123CME__Complaint__c reoependCmplntRecord;
            
            
            if(cmpResultMap.get(cs.ExternalId) <> null) {
                cmplnt = cmpResultMap.get(cs.ExternalId);
            } else {
                cmplnt = new CMPL123CME__Complaint__c();
            }
        
        
        /** system.debug('@@@cmpResultMap'+cmpResultMap); 
         
         if(cmpResultMap.get(cs.ExternalId) <> null) {
            cmplnt = cmpResultMap.get(cs.ExternalId);
          } **/
        //system.debug('==cmpResultList=='+cmpResultList); 

        cmplnt.CMPL123CME__CMPL123_WF_Status__c ='Closed-Canceled';
        CMPL123List.add(cmplnt);
        
        /**
        system.debug('==cmpResultMap=='+cmpResultMap); 
        for(CMPL123CME__Complaint__c cmps : cmpResultMap) {
             cmps.CMPL123CME__CMPL123_WF_Status__c='Closed-Canceled';
             CMPL123List.add(cmps);
        }       
        **/
        
       system.debug('==CMPL123List=='+CMPL123List);  
          
        if(!CMPL123List.isEmpty()){
            
            update CMPL123List;
        }
        }
    }
    global void finish(Database.BatchableContext bc){
        
         // execute any post-processing operations like sending email
    }

}