/********************************************************************************************************************
    Copyright (c) 2017 Sparta Systems, Inc.

    THIS IS AN AUTO-GENERATED TRIGGER CREATED BY  TRACKWISE DIGITAL PLATFORM PACKAGE
    Note: Follow the guidelines on how to use/implement 123 Triggers
    Add your custom code before  X123TriggerHandler. X123TriggerHandler code should be on the last line.
*********************************************************************************************************************/

trigger CMPL123CME_Investigation_123Trigger on CMPL123CME__Investigation__c (before insert,after insert,before update,after update,before delete,after delete,after undelete){

    //**Do NOT handle shadow records created to link back to external case objects*/
    if(!BMXTriggerUtils.shouldAuditInvestigation()) {
        return;
    }
    CMPL123.X123TriggerHandler X123handler = new CMPL123.X123TriggerHandler();

    /* Before Insert */
    if(Trigger.isInsert && Trigger.isBefore){
        // Place your custom code here 
        X123handler.handleBeforeInsert();
    }

    /* After Insert */
    else if(Trigger.isInsert && Trigger.isAfter){
        CMPL123CME.Investigation_TriggerHandler investigationTrigHandler = new CMPL123CME.Investigation_TriggerHandler ();
        investigationTrigHandler.createInvestigationItems();
        X123handler.handleAfterInsert();
    }

    /* Before Update */
    else if(Trigger.isUpdate && Trigger.isBefore){
        // Place your custom code here 
        X123handler.handleBeforeUpdate();
    }

    /* After Update */
    else if(Trigger.isUpdate && Trigger.isAfter){
        
        //INV_EUMIRUpdate_TriggerHandler  invEumirTrigHandler = new INV_EUMIRUpdate_TriggerHandler();
            //System.debug('@@@invEumirTrigHandler'+invEumirTrigHandler);
            //invEumirTrigHandler.updateINVEUMIR(trigger.newMap, trigger.oldMap);           
            //invEumirTrigHandler.updateINVEUMIR(trigger.new);
            List<Id> invIdrecordlist = new List<Id>();
            //System.debug('@@@invIdrecordlist'+invIdrecordlist);
            for(CMPL123CME__Investigation__c i : Trigger.new)
            {
                if(i.CMPL123_WF_Status__c  == 'Closed - Done')
                {
                    invIdrecordlist.add(i.id);  
                    
                }
            }
            if(!invIdrecordlist.isEmpty()){
            //INV_EUMIRUpdate_TriggerHandler.updateINVEUMIR(invIdrecordlist);
            //System.debug('@@@invEumirTrigHandler'+ INV_EUMIRUpdate_TriggerHandler.updateINVEUMIR(invIdrecordlist));
            }
        CMPL123CME.Investigation_TriggerHandler investigationTrigHandler = new CMPL123CME.Investigation_TriggerHandler ();
        investigationTrigHandler.createInvestigationItems();
        X123handler.handleAfterUpdate();

    }

    /* Before Delete */
    else if(Trigger.isDelete && Trigger.isBefore){
        Set<ID> compliantIdSet = New Set<ID>();
    for(CMPL123CME__Investigation__c investigation : trigger.old) 
       compliantIdSet.add(investigation.cmpl123cme__complaint__c);
    
    if(compliantIdSet.size() > 0){
        Map<Id, CMPL123CME__Complaint__c> complaintsMap = new Map<Id, CMPL123CME__Complaint__c>([Select Id From CMPL123CME__Complaint__c 
                                     Where CMPL123CME__CMPL123_WF_Status__c = 'Closed - Completed' and Id IN: compliantIdSet]);
        
        for(CMPL123CME__Investigation__c investigation : trigger.old) 
            if(investigation.CMPL123CME__Complaint__c != null && complaintsMap.get(investigation.CMPL123CME__Complaint__c) != null)
                investigation.addError(System.Label.INVESTIGATION_DELETE_ERROR_MESSAGE);
    } 
         X123handler.handleBeforeDelete();
    }

        
    /* After Delete */
    else if(Trigger.isDelete && Trigger.isAfter){
        // Place your custom code here 
        X123handler.handleAfterDelete();
    }

    /* After UnDelete */
    else if(Trigger.isUnDelete && Trigger.isAfter){
        // Place your custom code here 
        X123handler.handleAfterUnDelete();
    }
}