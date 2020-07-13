global class UpdateNonComplaintForCaseBatch implements Database.Batchable <sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        
       String queryString = ' SELECT Id,CaseNumber__c, Type__c,ExternalId,TWComplaintNumber_c__c FROM Case__x WHERE ExternalId!=NULL AND Type__c!=\'TechnicalComplaint\' ';
        system.debug('==queryString=='+queryString); 
        return Database.getQueryLocator(queryString);
        
    }
    
     global void execute(Database.BatchableContext BC, List<Case__x> scope ) {
        List<Case__x> caseList = new list<Case__x>();
        List<CMPL123CME__Complaint__c> complaintList = new list<CMPL123CME__Complaint__c>();
        Map<Id,Case__x> caseMap = new  Map<Id,Case__x>(scope);
        
        for(CMPL123CME__Complaint__c cmp : [SELECT Id,BMX_CaseNumber__c,BMX_Case_External__c,CMPL123CME__CMPL123_WF_Status__c  FROM CMPL123CME__Complaint__c WHERE BMX_CaseNumber__c != null AND CMPL123CME__CMPL123_WF_Status__c ='Opened' AND BMX_Case_External__c IN:caseMap.keySet()]){
            
            cmp.CMPL123CME__CMPL123_WF_Status__c= 'Closed-Canceled';
            complaintList.add(cmp);
        }
        
        if(!complaintList.isEmpty()){
            update complaintList;
        }
     }
     
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
    
    
}