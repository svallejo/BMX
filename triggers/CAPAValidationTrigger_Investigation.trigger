trigger CAPAValidationTrigger_Investigation on CAPA_Investigation__c (before insert,before delete)
{    
    if(Trigger.isBefore && Trigger.isInsert)
    {
        CAPA_ValidationHandler.beforeInsertValidation_investigation(Trigger.New);
    }
    
    if(Trigger.isBefore && Trigger.isDelete)
    {
        CAPA_ValidationHandler.beforeDeleteValidation_investigation(Trigger.Old);
    }
}