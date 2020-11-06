//trigger EU_MIR_InvestigationUpdate on CMPL123CME__EU_MIR__c (After insert,After update) {
trigger EU_MIR_InvestigationTrigger on CMPL123CME__EU_MIR__c (After insert) {
    if(trigger.isafter && Trigger.isinsert){
    EU_MIR_InvestigationHandler.populateInvistigationId(trigger.new);
    }
}