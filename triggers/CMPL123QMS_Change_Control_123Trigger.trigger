/********************************************************************************************************************
    Copyright (c) 2017 Sparta Systems, Inc.

    THIS IS AN AUTO-GENERATED TRIGGER CREATED BY  TRACKWISE DIGITAL PLATFORM PACKAGE
    Note: Follow the guidelines on how to use/implement 123 Triggers
    Add your custom code before  X123TriggerHandler. X123TriggerHandler code should be on the last line.
*********************************************************************************************************************/

trigger CMPL123QMS_Change_Control_123Trigger on CMPL123QMS__Change_Control__c (before insert,after insert,before update,after update,before delete,after delete,after undelete){

    CMPL123.X123TriggerHandler X123handler = new CMPL123.X123TriggerHandler();

    /* Before Insert */
    if(Trigger.isInsert && Trigger.isBefore){
        // Place your custom code here 
        X123handler.handleBeforeInsert();
    }

    /* After Insert */
    else if(Trigger.isInsert && Trigger.isAfter){
        //Place your custom code here
        X123handler.handleAfterInsert();
    }

    /* Before Update */
    else if(Trigger.isUpdate && Trigger.isBefore){
        //User should not be able to submit Change Control for Review without any change control plans
        ChangeControlHandler.preventChangeControlSubmission(Trigger.newMap, Trigger.oldMap);
        ChangeControlHandler.preventChangeControlCompleteReview(Trigger.newMap, Trigger.oldMap);
        ProcessBatchChildWorkflow.ProcessBatchChildWorkflows('CMPL123QMS__Change_Control__c',Trigger.newMap, Trigger.oldMap);
        X123handler.handleBeforeUpdate();
    }

    /* After Update */
    else if(Trigger.isUpdate && Trigger.isAfter){
        // Place your custom code here 
        X123handler.handleAfterUpdate();
    }

    /* Before Delete */
    else if(Trigger.isDelete && Trigger.isBefore){
        // Place your custom code here 
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