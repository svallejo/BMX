trigger EU_MIR_InvestigationTrigger on CMPL123CME__EU_MIR__c (After insert,before update) {
    if(trigger.isBefore && Trigger.isUpdate){
        EU_MIR_InvestigationHandler.populateInvistigationId(trigger.new);
    }
    if(trigger.isInsert && trigger.isAfter){
     EU_MIR_InvestigationHandler.populateCompliantcode(trigger.new);
    }
}