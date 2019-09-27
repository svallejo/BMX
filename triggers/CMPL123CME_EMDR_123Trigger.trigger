/********************************************************************************************************************
    Copyright (c) 2017 Sparta Systems, Inc.

    THIS IS AN AUTO-GENERATED TRIGGER CREATED BY  TRACKWISE DIGITAL PLATFORM PACKAGE
    Note: Follow the guidelines on how to use/implement 123 Triggers
    Add your custom code before  X123TriggerHandler. X123TriggerHandler code should be on the last line.
*********************************************************************************************************************/

trigger CMPL123CME_EMDR_123Trigger on CMPL123CME__EMDR__c (before insert,after insert,before update,after update,before delete,after delete,after undelete){

    CMPL123.X123TriggerHandler X123handler = new CMPL123.X123TriggerHandler();

    /* Before Insert */
    if(Trigger.isInsert && Trigger.isBefore){
        // Place your custom code here 
        X123handler.handleBeforeInsert();
        //MFR Report Number Generation
        CMPL123CME.EMDR_GenerateMFRReportNoTriggerHandler generateMFRNo = new CMPL123CME.EMDR_GenerateMFRReportNoTriggerHandler ();
              generateMFRNo.emdrGenerateMFRReportNo();
    }

    /* After Insert */
    else if(Trigger.isInsert && Trigger.isAfter){
        //Place your custom code here
        X123handler.handleAfterInsert();

        //MFR Report Number Generation
        CMPL123CME.EMDR_GenerateMFRReportNoTriggerHandler generateMFRNo = new CMPL123CME.EMDR_GenerateMFRReportNoTriggerHandler ();
              generateMFRNo.emdrGenerateMFRReportNo();

        // FDA Submission
          //    CMPL123CME.EMDR_FDASubmissionTriggerHandler fdaSubmission = new CMPL123CME.EMDR_FDASubmissionTriggerHandler();
        //      fdaSubmission.emdrFDASubmissionTrigger();
    }

    /* Before Update */
    else if(Trigger.isUpdate && Trigger.isBefore){
        // Locking EMDR record for other user. Allowing only FDA Gateway user.
        EmdrLockValidationHandler emdrLockValidate = new EmdrLockValidationHandler();
        for(Integer i = 0;i<Trigger.new.size();i++) {
             if(BMX_StaticUtil.isRun() && !BMX_StaticUtil.isRecordInUpdate(Trigger.oldMap.get(Trigger.new.get(i).id),Trigger.new.get(i),'CMPL123CME__CMPL123_WF_Status__c')) {
                 emdrLockValidate.validateUpdate(Trigger.new.get(i));
             }
          }
          
          //MFR Report Number Generation
          CMPL123CME.EMDR_GenerateMFRReportNoTriggerHandler generateMFRNo = new CMPL123CME.EMDR_GenerateMFRReportNoTriggerHandler ();
              generateMFRNo.emdrGenerateMFRReportNo();
        
        // Place your custom code here     
        X123handler.handleBeforeUpdate();
    }

    /* After Update */
    else if(Trigger.isUpdate && Trigger.isAfter){
        
        // Place your custom code here 
        X123handler.handleAfterUpdate();
        //MFR Report Number Generation
        CMPL123CME.EMDR_GenerateMFRReportNoTriggerHandler generateMFRNo = new CMPL123CME.EMDR_GenerateMFRReportNoTriggerHandler ();
              generateMFRNo.emdrGenerateMFRReportNo();

        // FDA Submission
              CMPL123CME.EMDR_FDASubmissionTriggerHandler fdaSubmission = new CMPL123CME.EMDR_FDASubmissionTriggerHandler();
              fdaSubmission.emdrFDASubmissionTrigger();    }

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