/********************************************************************************************************************
Copyright (c) 2017 Sparta Systems, Inc.

THIS IS AN AUTO-GENERATED TRIGGER CREATED BY  TRACKWISE DIGITAL PLATFORM PACKAGE
Note: Follow the guidelines on how to use/implement 123 Triggers
Add your custom code before  X123TriggerHandler. X123TriggerHandler code should be on the last line.
*********************************************************************************************************************/

trigger CMPL123CME_Questionnaire_123Trigger on CMPL123CME__Questionnaire__c (before insert,after insert,before update,after update,before delete,after delete,after undelete){
    
    CMPL123.X123TriggerHandler X123handler = new CMPL123.X123TriggerHandler();
    
    
    
    /* Before Insert */
    if(Trigger.isInsert && Trigger.isBefore){
        // Place your custom code here 
        X123handler.handleBeforeInsert();
        
    }
    
    /* After Insert */
    else if(Trigger.isInsert && Trigger.isAfter){
        CMPL123CME.Questionnaire_TriggerHandler questionnaireTrigHandler = new CMPL123CME.Questionnaire_TriggerHandler();
        questionnaireTrigHandler.createQuestionareItems();
        X123handler.handleAfterInsert();
    }
    
    /* Before Update */
    else if(Trigger.isUpdate && Trigger.isBefore){
        // Place your custom code here 
        X123handler.handleBeforeUpdate();
        
        
    }
    
    /* After Update */
    else if(Trigger.isUpdate && Trigger.isAfter){
        CMPL123CME.Questionnaire_TriggerHandler questionnaireTrigHandler = new CMPL123CME.Questionnaire_TriggerHandler();
        questionnaireTrigHandler.createQuestionareItems(); 
        X123handler.handleAfterUpdate();
        
        
    }
    
    /* Before Delete */
    else if(Trigger.isDelete && Trigger.isBefore){
        Set<ID> compliantIdSet = New Set<ID>();
        for(CMPL123CME__Questionnaire__c questionnaire: trigger.old) 
            compliantIdSet.add(questionnaire.cmpl123cme__complaint__c);
        if(compliantIdSet.size() > 0){
            Map<Id, CMPL123CME__Complaint__c> complaintsMap = new Map<Id, CMPL123CME__Complaint__c>([Select Id From CMPL123CME__Complaint__c Where CMPL123CME__CMPL123_WF_Status__c = 'Closed - Completed' and Id IN: compliantIdSet]);
            
            for(CMPL123CME__Questionnaire__c questionnaire : trigger.old) 
                if(questionnaire.cmpl123cme__complaint__c != null && complaintsMap.get(questionnaire.cmpl123cme__complaint__c) != null)
                questionnaire.addError(System.Label.ASSESSMENTS_DELETE_ERROR_MESSAGE);
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