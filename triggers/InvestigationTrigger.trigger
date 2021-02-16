trigger InvestigationTrigger on CMPL123CME__Investigation__c (after insert) {
    //this trigger is used for update the EU_MIR Field from Complaints which is we selected
    //and update current investigation Record to updated EU_Mir Records.
    
    if(trigger.isInsert && trigger.isafter){
        InvestigationTriggerHandler.InvestiToEumirupdate(trigger.new);
    }
    
}