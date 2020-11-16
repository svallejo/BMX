trigger EU_MIR_InvestigationTrigger on CMPL123CME__EU_MIR__c (before update,after update) {
    /**
    if(trigger.isBefore && Trigger.isUpdate){
        EU_MIR_InvestigationHandler.populateInvistigationId(trigger.new);
    }
    **/
    Set<Id> mirSetId= new Set<Id>();
    if(trigger.isafter && trigger.isupdate){
        for(CMPL123CME__EU_MIR__c emuir:trigger.new)
        {
            //if(trigger.oldmap.get(emuir.Id).CMPL123CME__Type_Of_Report__c!=emuir.CMPL123CME__Type_Of_Report__c && emuir.CMPL123CME__Type_Of_Report__c == 'Initial' && trigger.oldmap.get(emuir.Id).CMPL123_WF_Status__c !=emuir.CMPL123_WF_Status__c && emuir.CMPL123_WF_Status__c == 'Closed-Submitted')
            if((trigger.oldmap.get(emuir.Id).CMPL123_WF_Status__c !=emuir.CMPL123_WF_Status__c) && ( emuir.CMPL123CME__Type_Of_Report__c=='Initial' && emuir.CMPL123_WF_Status__c == 'Closed-Submitted') )
            {  
                mirSetId.add(emuir.Id);
            }
        }
    }
    if(!mirSetId.isEmpty())
    {
    EUMIRInitalToFollowupHandler.EUMIRInitalToFollow_Afterupdate(mirSetId);
   }
}