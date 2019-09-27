trigger CAPAPlanValidationTrigger on CAPA_Plan__c (before insert,before delete)
{
    if(Trigger.isBefore && Trigger.isInsert)
    {
        CAPA_ValidationHandler.beforeInsertValidation(Trigger.New);
    }
    
    if(Trigger.isBefore && Trigger.isDelete)
    {
        CAPA_ValidationHandler.deleteInsertValidation(Trigger.Old);
    }
}