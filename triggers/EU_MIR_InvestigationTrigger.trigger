//trigger EU_MIR_InvestigationUpdate on CMPL123CME__EU_MIR__c (After insert,After update) {
trigger EU_MIR_InvestigationTrigger on CMPL123CME__EU_MIR__c (before update) {
    if(trigger.isBefore && Trigger.isUpdate){
        EU_MIR_InvestigationHandler.populateInvistigationId(trigger.new);
    }
}