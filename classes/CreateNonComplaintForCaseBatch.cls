global class CreateNonComplaintForCaseBatch implements Database.Batchable <sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        
        //String query = 'SELECT Id, CaseNumber_c__c,Type__c,(Select Id,BMX_CaseNumber__c,CMPL123CME__CMPL123_WF_Status__c from RelatedComplaints__r WHERE BMX_CaseNumber__c!=Null AND CMPL123CME__CMPL123_WF_Status__c='\Opened\') from Case__x WHERE Type__c!='TechnicalComplaint' ';
        
        String query='SELECT Id FROM CMPL123CME__Complaint__c WHERE BMX_CaseNumber__c != null AND CMPL123CME__CMPL123_WF_Status__c =\'Opened\' AND BMX_Case_External__r.Type__c !=\'TechnicalComplaint\' AND CreatedDate>LAST_YEAR ';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<CMPL123CME__Complaint__c> scope ) {
        
        List<CMPL123CME__Complaint__c> complaintList = new list<CMPL123CME__Complaint__c>();
        List<CMPL123CME__Investigation__c> investigationList = new list<CMPL123CME__Investigation__c>();
        List<CMPL123CME__Investigation__c> Master_investigationList = new list<CMPL123CME__Investigation__c>();
        Map<Id,CMPL123CME__Complaint__c> complaintsMap = new  Map<Id,CMPL123CME__Complaint__c>(scope);
        for(CMPL123CME__Investigation__c inv:[SELECT ID FROM CMPL123CME__Investigation__c WHERE CMPL123CME__Complaint__c IN:complaintsMap.keySet() AND CMPL123_WF_Status__c != 'Closed-Canceled']){
            inv.CMPL123_WF_Status__c = 'Closed-Canceled';
            investigationList.add(inv);
            
        }
        
        for(CMPL123CME__Investigation__c Parinv:[SELECT ID,Master_Investigation__c FROM CMPL123CME__Investigation__c WHERE Master_Investigation__c IN:complaintsMap.KeySet() AND CMPL123_WF_Status__c != 'Closed-Canceled']){
          Parinv.CMPL123_WF_Status__c='Closed-Canceled';
          Master_investigationList.add(Parinv);
        }
        for(CMPL123CME__Complaint__c complaint : scope){
            complaint.CMPL123CME__CMPL123_WF_Status__c = 'Closed-Canceled';
            complaintList.add(complaint);
        }
        if(!complaintList.isEmpty()){
            update complaintList;
        }
        
        if(!investigationList.isEmpty()){
            update investigationList;
        }
        if(!Master_investigationList.isEmpty()){
            update Master_investigationList;
        }
    }
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
    
    
}