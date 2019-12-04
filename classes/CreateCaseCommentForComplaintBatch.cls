/**
*  --------------------------------------------------------------------------------------------------------------------------------------
* @Who   : Copyright (c) 2017 - 2019  Sparta Systems, Inc.
* @What  : CreateAllChildSchedulableBatch
* @Why   : Batch class to create Case Comment custom records from Case Comment External records and linking them to their respective complaints
* @When  : 14-DEC-2018
  
*  --------------------------------------------------------------------------------------------------------------------------------------
*  Modification Log:  
*  --------------------------------------------------------------------------------------------------------------------------------------
*   Developer                Date             Description 
*  --------------------------------------------------------------------------------------------------------------------------------------
*                        14-DEC-2018        Created.
*  --------------------------------------------------------------------------------------------------------------------------------------
**/

global virtual class CreateCaseCommentForComplaintBatch implements Database.Batchable<sObject>, Database.Stateful,Database.AllowsCallouts{
    private final String VALID_CASE_TYPE = 'TechnicalComplaint';
    
    //Intializing external Case Comment Ids in the constructor
    global CreateCaseCommentForComplaintBatch(){}
    Boolean chained;
    List<Id> caseIdList;
    DateTime lastExecuted;

    global CreateCaseCommentForComplaintBatch(Boolean chain, List<Id>caseIdList, DateTime lastExecuted){
        this.chained = chain;
        this.caseIdList = caseIdList;
        this.lastExecuted = lastExecuted;
    }
    
    // querying the external Case Comment records
    global virtual Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        if(!Test.isRunningTest()){
            return Database.getQueryLocator([SELECT Id,CommentBody__c,ParentId__r.ExternalId,ParentId__r.TWComplaintNumber_c__c,  ParentId__r.Type__c, CreatedById__r.Name__c,ExternalId,CreatedDate__c
                                            FROM CaseComment__x WHERE ParentId__c in:caseIdList or LastModifiedDate__c >=: lastExecuted]);
        }else{
            return Database.getQueryLocator('SELECT Id,CommentBody__c,ParentId__r.ExternalId,ParentId__r.TWComplaintNumber_c__c, ParentId__r.Type__c, CreatedById__r.Name__c,ExternalId,CreatedDate__c '+
                                            'FROM CaseComment__x LIMIT 1');
        }
    }
    
    global void execute(Database.BatchableContext bc, List<sObject> CaseCommList){
        
        List<CaseComment__x> records = new List<CaseComment__x>();
        if(!Test.isRunningTest()){
            for(Sobject sObj: CaseCommList){
                CaseComment__x extCaseCommObj = (CaseComment__x) sObj;
                records.add(extCaseCommObj);
            }
        }
        
        if(Test.isRunningTest()){
            records.add(BMX_TestDataFactory.getCaseCommentExRecord());
        }
        system.debug('==case comment records====='+records);
        List<Case_Comment__c> caseCommentList = new List<Case_Comment__c>();
        List<Database.upsertResult> upsertResultList = new List<Database.upsertResult>();
        
        for(CaseComment__x  caseCommX: records){
            
            //mapping external Case Comment fields to the Case Comment custom object fields to create Case Comment records
            if(Test.isRunningTest() || 
            (caseCommX.ParentId__r.ExternalId != null && 
            caseCommX.ParentId__r.Type__c != null && 
            caseCommX.ParentId__r.Type__c == VALID_CASE_TYPE &&
            String.isEmpty(caseCommX.ParentId__r.TWComplaintNumber_c__c))){
                Case_Comment__c caseComm = new Case_Comment__c();
                caseComm.ComplaintId__r = new CMPL123CME__Complaint__c(BMX_Case_External_Id__c = caseCommX.ParentId__r.ExternalId);
                caseComm.CommentBody__c = caseCommX.CommentBody__c;
                caseComm.ExternalId__c = caseCommX.ExternalId;
                caseComm.BMX_User__c = caseCommX.CreatedById__c;
                caseComm.Created_Date__c = caseCommX.CreatedDate__c;
                caseCommentList.add(caseComm);
            }
        }
        
        System.debug('-------caseCommentList------'+caseCommentList);
        
        if(!caseCommentList.isEmpty()) {
		
			// Upserting the external Case Comment list of records
            upsertResultList = Database.Upsert(caseCommentList,Case_Comment__c.ExternalId__c, false);
        }
        
		// creating error log records if any record gets failed during the execution of the batch
        if(!upsertResultList.isEmpty()) {
            List<Error_Log__c> errLogList = new List<Error_Log__c>();
            for(Integer i=0; i <upsertResultList.size(); i++) {
                if(!upsertResultList[i].isSuccess() ) {
                    Error_Log__c el = Utils_CreateComplaintForCaseBatch.returnErrorLog(upsertResultList[i].getErrors(), 
                                                                                       'CreateCaseCommentForComplaintBatch', 'Case_Comment__c');
                    el.Record_ID__c = caseCommentList[i].Id;
                    el.External_Case_Id__c = caseCommentList[i].ExternalId__c;
                    errLogList.add(el);
                }
            }
            if(!errLogList.isEmpty()) {
                Database.Insert(errLogList, false);
            }
        }
    }  
    
    global void finish(Database.BatchableContext bc){
        if(!Test.isRunningTest()){
		    // Executing the CreateWorkOrderForComplaintBatch batch class
            CreateWorkOrderForComplaintBatch createWorkOrder = new CreateWorkOrderForComplaintBatch(true, caseIdList, lastExecuted);
            database.executebatch(createWorkOrder);
        }
    } 
}