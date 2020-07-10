global class UpdateNonComplaintForCaseBatch implements Database.Batchable<sObject> {
        
        String queryString;
        global Database.QueryLocator start(Database.BatchableContext Bc) {
            
            queryString = ' SELECT Id,CaseNumber_c__c, Type__c,ExternalId,TWComplaintNumber_c__c FROM Case__x WHERE Type__c!=\'TechnicalComplaint\' ';
            system.debug('==queryString=='+queryString); 
            return Database.getQueryLocator(queryString);
        }
        
        global void execute(Database.BatchableContext bc, List<Case__x> caseQuerysObjLst) {
            
            Map < Id,  Case__x > mapCase = new Map < Id, Case__x >();
            List<CMPL123CME__Complaint__c> listComplaints = new List<CMPL123CME__Complaint__c>();
           
            for(Case__x sObj : caseQuerysObjLst){
                mapCase.put(sObj.Id, sObj);             
            }
            
            listComplaints = [SELECT Id,BMX_CaseNumber__c,CMPL123CME__CMPL123_WF_Status__c,BMX_Case_Type__c,BMX_Case_External__c FROM CMPL123CME__Complaint__c WHERE CMPL123CME__CMPL123_WF_Status__c='Opened' AND BMX_Case_External__c IN : mapCase.keySet()];
   
             if(!listComplaints.isEmpty()){
                 
                 for(CMPL123CME__Complaint__c cmp : listComplaints){
                     cmp.CMPL123CME__CMPL123_WF_Status__c='Closed-Canceled';
                     listComplaints.add(cmp);
                 }
            
                update listComplaints;
            }
        }   
            
        
        global void finish(Database.BatchableContext bc){
        
         // execute any post-processing operations like sending email
       }

}