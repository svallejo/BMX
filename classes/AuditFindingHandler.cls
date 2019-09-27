/*
File Name: AuditFindingHandler
Author: Sparta Systems
Description: public class which is used to handle all the custom functioanlity on audit finding object. 
*/
public with sharing class AuditFindingHandler{

    /*
    Input: List< Audit_Finding__c >
    Output: Void
    Description: public method, which is referenced in the audit finding audit trigger, 
                 used to prevent deletion on closed complaints.
    Requirement: JIRA 303-A, Audit findings cannot be added or removed or edited after audit has been approved
    */
    public static void preventAuditFindingDelete(List< Audit_Finding__c > existingAuditFindings){
        Set<String> auditIds = new Set<String>();
        
        for(Audit_Finding__c t : existingAuditFindings)
               if(t.Audit__c != null)      
                   auditIds.add(t.Audit__c);
        
        Set<Id> AuditApprovedIdsSet = new Set<Id>();
        
        for(CMPL123QMS__Internal_Audit__c cp : [Select Id From CMPL123QMS__Internal_Audit__c Where Id IN :auditIds and Initial_Approval_Complete__c=true limit 49999])
            AuditApprovedIdsSet.add(cp.Id);
        
        for(Audit_Finding__c t : existingAuditFindings) 
            if(t.Audit__c != null && AuditApprovedIdsSet.contains(t.Audit__c))
                t.addError(System.Label.AUDITFINDING_REMOVE_ERROR_MESSAGE);    
        
    }
    
}