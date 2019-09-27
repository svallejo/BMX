trigger Prevent_Repair_Delete_Trigger on CMPL123CME__Repair__c (before delete) {
    Set<ID> compliantIdSet = New Set<ID>();
    for(CMPL123CME__Repair__c Repair: trigger.old) 
        compliantIdSet.add(Repair.cmpl123cme__complaint__c);
    if(compliantIdSet.size() > 0){
        Map<Id, CMPL123CME__Complaint__c> complaintsMap = new Map<Id, CMPL123CME__Complaint__c>([Select Id From CMPL123CME__Complaint__c 
                                                                                                 Where CMPL123CME__CMPL123_WF_Status__c = 'Closed - Completed' and Id IN: compliantIdSet]);
        
        for(CMPL123CME__Repair__c Repair : trigger.old) 
            if(Repair.cmpl123cme__complaint__c != null && complaintsMap.get(Repair.cmpl123cme__complaint__c) != null)
            Repair.addError(System.Label.REPAIR_ERROR_MESSAGE);
    }
}