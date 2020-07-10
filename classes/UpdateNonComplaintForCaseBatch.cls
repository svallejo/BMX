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
    
          
    
    // querying the external Case records
    global Database.QueryLocator start(Database.BatchableContext Bc) {
        
            queryString = ' SELECT Id,CaseNumber_c__c, Type__c,ExternalId,TWComplaintNumber_c__c FROM Case__x WHERE Type__c!=\'TechnicalComplaint\' ';
             system.debug('==queryString=='+queryString); 
            return Database.getQueryLocator(queryString); 
            
        } 
     
    global void execute(Database.BatchableContext bc, List<sObject> caseQuerysObjLst) {
       
       //List<Case__x> caseQueryList = new List<Case__x>();  
       Set<id> setcaseIds = new Set<Id>();
       
            for(sObject sObj: caseQuerysObjLst){
                Case__x extCaseObj = (Case__x) sObj;
                //caseQueryList.add(sObj);
                setcaseIds.add(extCaseObj.Id);
            }        
        system.debug('==setcaseIds=='+setcaseIds.size()); 
        
        List<Case__x> csxExtList =[SELECT Id,CaseNumber_c__c, Type__c,ExternalId,TWComplaintNumber_c__c,(SELECT Id,BMX_CaseNumber__c,CMPL123CME__CMPL123_WF_Status__c,BMX_Case_Type__c,BMX_Case_External__c FROM Complaints__r WHERE BMX_Case_External__c!=null AND CMPL123CME__CMPL123_WF_Status__c='Opened' AND BMX_Case_Type__c='TechnicalComplaint') FROM case__x WHERE Id IN:setcaseIds];
         system.debug('==csxExtList=='+csxExtList.size());
        List<CMPL123CME__Complaint__c> CMPL123List =new list<CMPL123CME__Complaint__c>(); 
        
        for(case__x cs : csxExtList){
            for(CMPL123CME__Complaint__c cmps : cs.Complaints__r){
                
                cmps.CMPL123CME__CMPL123_WF_Status__c ='Closed-Canceled';
                CMPL123List.add(cmps);
            }
            
        }
        system.debug('==CMPL123List=='+CMPL123List.size()); 
        if(!CMPL123List.isEmpty()){
            
            update CMPL123List;
        }
        
    }

    global void finish(Database.BatchableContext bc){
        
         // execute any post-processing operations like sending email
    }

}