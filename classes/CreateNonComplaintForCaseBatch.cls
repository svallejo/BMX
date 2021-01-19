global class CreateNonComplaintForCaseBatch implements Database.Batchable <sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        
        //String query = 'SELECT Id, CaseNumber_c__c,Type__c,(Select Id,BMX_CaseNumber__c,CMPL123CME__CMPL123_WF_Status__c from RelatedComplaints__r WHERE BMX_CaseNumber__c!=Null AND CMPL123CME__CMPL123_WF_Status__c='\Opened\') from Case__x WHERE Type__c!='TechnicalComplaint' ';
        
        String query='SELECT Id,BMX_Investigation__c FROM CMPL123CME__Complaint__c WHERE BMX_CaseNumber__c != null AND CMPL123CME__CMPL123_WF_Status__c =\'Opened\' AND BMX_Case_External__r.Type__c !=\'TechnicalComplaint\' AND CreatedDate>LAST_YEAR';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<CMPL123CME__Complaint__c> scope ) {
        
        List<CMPL123CME__Investigation__c> investigationList = new list<CMPL123CME__Investigation__c>();
        Map<Id,CMPL123CME__Complaint__c> complaintsMap = new Map<Id,CMPL123CME__Complaint__c>();
        Set<Id> invistigationIds = new Set<Id>();
        Set<Id> complaintIds = new Set<Id>();
        for(CMPL123CME__Complaint__c complaint:scope){
            invistigationIds.add(complaint.BMX_Investigation__c);
            complaintIds.add(complaint.Id);
        }
        for(CMPL123CME__Investigation__c inv:[SELECT ID,RecordTypeId,CMPL123CME__Complaint__c FROM CMPL123CME__Investigation__c WHERE (Id In:invistigationIds OR CMPL123CME__Complaint__c IN: complaintIds) AND CMPL123_WF_Status__c != 'Closed-Canceled']){
            inv.RecordTypeId=null;
            inv.CMPL123_WF_Status__c = 'Closed-Canceled';
            inv.CMPL123Task_Key_Value__c = 'CANCELOPENINVEST';
            investigationList.add(inv);
            if(String.isNotBlank(inv.CMPL123CME__Complaint__c) && complaintsMap.containsKey(inv.CMPL123CME__Complaint__c)){
                
            complaintsMap.put(inv.CMPL123CME__Complaint__c, new CMPL123CME__Complaint__c(Id = inv.CMPL123CME__Complaint__c,
            CMPL123CME__CMPL123_WF_Status__c = 'Closed-Canceled'));
                
            complaintsMap.put(inv.CMPL123CME__Complaint__c, new CMPL123CME__Complaint__c(Id = inv.CMPL123CME__Complaint__c,
            CMPL123Task_Key_Value__c = 'CANCELOPENCOMPLAINT'));        
            }
        }
        
        /*for(CMPL123CME__Complaint__c complaint : scope){
            complaint.CMPL123CME__CMPL123_WF_Status__c = 'Closed-Canceled';
            complaintList.add(complaint);
        }*/
        if(!complaintsMap.isEmpty()){
            Database.update(complaintsMap.values());
            //update complaintList;
        }
        
        if(!investigationList.isEmpty()){
            Database.update(investigationList);
            //update investigationList;
        }
        
    }
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
    
    
}