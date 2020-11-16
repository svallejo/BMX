trigger EU_MIR_InvestigationTrigger on CMPL123CME__EU_MIR__c (before update,after update) {
    /**
    if(trigger.isBefore && Trigger.isUpdate){
        EU_MIR_InvestigationHandler.populateInvistigationId(trigger.new);
    }
    **/
    Set<Id> mirSetId= new Set<Id>();
    if(trigger.isafter && trigger.isupdate){
        for(CMPL123CME__EU_MIR__c emr :trigger.new)
        {
            mirSetId.add(emr.Id);
        }
    }
    if(!mirSetId.isEmpty())
    {
    EUMIRInitalToFollowupHandler.EUMIRInitalToFollow_Afterupdate(mirSetId);
   }
}