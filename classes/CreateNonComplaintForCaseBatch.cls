global class CreateNonComplaintForCaseBatch implements Database.Batchable <sObject> {
    
    List<CMPL123CME__Complaint__c> CMPL123List =new list<CMPL123CME__Complaint__c>();
    List<CMPL123CME__Complaint__c> CMPL123List1 =new list<CMPL123CME__Complaint__c>();
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        
        //String query = 'SELECT Id, CaseNumber_c__c,Type__c,(Select Id,BMX_CaseNumber__c,CMPL123CME__CMPL123_WF_Status__c from RelatedComplaints__r WHERE BMX_CaseNumber__c!=Null AND CMPL123CME__CMPL123_WF_Status__c='\Opened\') from Case__x WHERE Type__c!='TechnicalComplaint' ';
        
        String query='SELECT Id,BMX_CaseNumber__c,CMPL123CME__CMPL123_WF_Status__c,BMX_Case_Type__c FROM CMPL123CME__Complaint__c WHERE BMX_CaseNumber__c!=null AND CMPL123CME__CMPL123_WF_Status__c=\'Opened\' AND BMX_Case_Type__c=\'TechnicalComplaint\' ';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<CMPL123CME__Complaint__c> ComplineList ) {
        
        //Map<Id,CMPL123CME__Complaint__c> ExecaseMap=new <Id,CMPL123CME__Complaint__c>();
        list<Case__x > caseExelist=new list<Case__x>();
        Set<Id> SetIds=new set<Id>();
        
        for(CMPL123CME__Complaint__c scopeCMP:ComplineList){
            CMPL123List.add(scopeCMP);
        }
        
        CMPL123CME__Complaint__c  CMPList=[Select id,BMX_CaseNumber__c from CMPL123CME__Complaint__c  limit 1];
        for(Case__x csx:[SELECT Id, CaseNumber_c__c, Type__c FROM Case__x WHERE Type__c!='TechnicalComplaint' AND CaseNumber__c =:CMPList.BMX_CaseNumber__c]){
            caseExelist.add(csx);
        }
        
        for(CMPL123CME__Complaint__c CMPScope:[Select id,BMX_Case_External__c,BMX_CaseNumber__c,BMX_Case_Type__c,CMPL123CME__CMPL123_WF_Status__c from CMPL123CME__Complaint__c WHERE BMX_Case_External__c in:SetIds]){
            CMPScope.CMPL123CME__CMPL123_WF_Status__c='Closed-Canceled';
            CMPL123List1.add(CMPScope);
        }
        
        if(!CMPL123List1.isEmpty()){
            update CMPL123List1;
        }
        
    }
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
    
    
}