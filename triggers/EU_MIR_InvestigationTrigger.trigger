trigger EU_MIR_InvestigationTrigger on CMPL123CME__EU_MIR__c (before update,after update) {

    if(trigger.isBefore && Trigger.isUpdate){
        EU_MIR_InvestigationHandler.populateInvistigationId(trigger.new);
    }
    
    if(trigger.isafter && trigger.isupdate){
    
     list<Id> MirIds=new list<Id>();
      for(CMPL123CME__EU_MIR__c emuir : trigger.new) {
      
          if(emuir.CMPL123CME__Type_Of_Report__c == 'Initial' && emuir.CMPL123_WF_Status__c == 'Closed-Submitted'){                      
            MirIds.add(emuir.id);
          }
        }
        if(!MirIds.isEmpty()){
        EUMIRInitalToFollowupHandler.EUMIRInitalToFollowupupdate(MirIds);
        }   
    }
   
}