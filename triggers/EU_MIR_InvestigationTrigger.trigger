trigger EU_MIR_InvestigationTrigger on CMPL123CME__EU_MIR__c (before insert,before update,after update, after insert) {


    Set<Id> mirSetId= new Set<Id>();
    Set<Id> EU_InvsetIds= new Set<Id>();
    set<Id> EMITSetId =new set<Id>();
    
    if(trigger.isafter && trigger.isinsert){
        for(CMPL123CME__EU_MIR__c emuir:trigger.new)
        {
            
            if(emuir.CMPL123CME__Complaint__c !=null )
            {
                EMITSetId.add(emuir.Id);
               // EU_MIR_InvestigationHandler.populateInvistigationId(trigger.new);
                
            }
        }
    }
    system.debug('MSR:::Follow-up Id::'+EMITSetId);
    //EU_MIR_InvestigationHandler.populateInvistigationId(EMITSetId);
    
    if(trigger.isafter && trigger.isupdate){
        for(CMPL123CME__EU_MIR__c emuir:trigger.new)
        {
            
            if((emuir.CMPL123CME__Type_Of_Report__c == 'Initial'|| emuir.CMPL123CME__Type_Of_Report__c=='Follow up') && emuir.CMPL123CME__Complaint__c !=null )
            {
                //EU_MIR_InvestigationHandler.populateInvistigationId(trigger.new);
               //EMITSetId.add(emuir.Id);
            }
            
            if( (trigger.oldmap.get(emuir.Id).CMPL123_WF_Status__c !=emuir.CMPL123_WF_Status__c) && ( emuir.CMPL123CME__Type_Of_Report__c=='Initial' && emuir.CMPL123_WF_Status__c == 'Closed-Submitted') )
            {  
                mirSetId.add(emuir.Id);
            }
            
            if((trigger.oldmap.get(emuir.Id).CMPL123_WF_Status__c !=emuir.CMPL123_WF_Status__c) && ( emuir.CMPL123CME__Type_Of_Report__c=='Follow up' && emuir.CMPL123_WF_Status__c == 'Closed-Submitted') )
            {  
                EU_InvsetIds.add(emuir.Id);
            }

        }
       
    }
    
    if(!mirSetId.isEmpty())
    {
    EUMIRInitalToFollowupHandler.EUMIRInitalToFollow_Afterupdate(mirSetId);
    }
    
    if(!EU_InvsetIds.isEmpty())
    {
    EUMIRInitalToFollowupHandler.EUMIRInitalToFollow_Afterupdate(EU_InvsetIds);
    }
    
 
}