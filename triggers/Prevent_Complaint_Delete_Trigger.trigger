trigger Prevent_Complaint_Delete_Trigger on cmpl123cme__complaint__c (before delete) {
    Set<ID> InquiryIdSet = New Set<ID>();
    for(cmpl123cme__complaint__c Complaint: trigger.old) 
       InquiryIdSet.add(Complaint.Related_Inquiry__c);
    if(InquiryIdSet.size() > 0){
        Map<Id, Inquiry__c> InquiriesMap = new Map<Id, Inquiry__c>([Select Id From Inquiry__c
                                                                                                 Where Subject__c!=null and Id IN: InquiryIdSet]);
        
        for(cmpl123cme__complaint__c Complaint: trigger.old) 
            if(Complaint.Related_Inquiry__c!= null && InquiriesMap.get(Complaint.Related_Inquiry__c) != null)
            Complaint.addError(System.Label.COMPLAINT_DELETE_ERROR_MESSAGE);
    }
}