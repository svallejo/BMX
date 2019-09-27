/*   when Approve Audit action is perfoeming on the Audit record it need to verify weather all the related Auidt findings are closed or not 
To perform this condition activate this trigger unless keep it deactivated. */


trigger Internal_Audit_Findings_Handler on CMPL123QMS__Internal_Audit__c (before update)
 {
if(Trigger.isUpdate && Trigger.isBefore){
        
        InternalAuditHandler.preventInternalAuditClosure(Trigger.new, Trigger.newMap, Trigger.oldMap);
        
        CMPL123.AuditHandler.handleAudit();
}
}