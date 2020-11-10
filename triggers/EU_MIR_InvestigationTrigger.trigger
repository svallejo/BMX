trigger EU_MIR_InvestigationTrigger on CMPL123CME__EU_MIR__c (before update) {
    if(trigger.isBefore && Trigger.isUpdate){
        EU_MIR_InvestigationHandler.populateInvistigationId(trigger.new);
    }
}