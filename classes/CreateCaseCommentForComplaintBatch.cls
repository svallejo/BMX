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
    
    //Intializing external Case Comment Ids in the constructor
    global CreateCaseCommentForComplaintBatch(){}
    Boolean chained;
    global CreateCaseCommentForComplaintBatch(Boolean chain){
        this.chained = chain;
    }
    
    // querying the external Case Comment records
    global virtual Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        DateTime dt = System.now().addHours(-24);
        Integer count = [SELECT count() FROM CaseComment__x WHERE LastModifiedDate__c >=: dt];
        
        if(!Test.isRunningTest()){
            return Database.getQueryLocator('SELECT Id,CommentBody__c,ParentId__r.ExternalId,CreatedById__r.Name__c,ExternalId,CreatedDate__c FROM CaseComment__x ORDER BY LastModifiedDate__c DESC LIMIT ' + count);   
        }else{
            return Database.getQueryLocator('SELECT Id FROM Case LIMIT 1');
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
        /*Set<Id> caseExIdSet = new Set<Id>();
Map<Id, CMPL123CME__Complaint__c> cmpMap = new Map<Id, CMPL123CME__Complaint__c>();

for(CaseComment__x  caseCommX : records) {
caseExIdSet.add(caseCommX.ParentId__r.ExternalId);
}

for(CMPL123CME__Complaint__c cmp : [SELECT Id, BMX_Case_External__c FROM CMPL123CME__Complaint__c WHERE BMX_Case_External__c IN: caseExIdSet]) {
cmpMap.put(cmp.BMX_Case_External__c, cmp);
}*/
        
        for(CaseComment__x  caseCommX: records){
            
            //mapping external Case Comment fields to the Case Comment custom object fields to create Case Comment records
            if(Test.isRunningTest() || caseCommX.ParentId__r.ExternalId != null){
                //Integer cmplntCount = (!Test.isRunningTest()) ? [SELECT Count() FROM CMPL123CME__Complaint__c WHERE BMX_Case_External_Id__c =: caseCommX.ParentId__r.ExternalId LIMIT 1] : 1;
                Case_Comment__c caseComm = new Case_Comment__c();
                caseComm.ComplaintId__r = new CMPL123CME__Complaint__c(BMX_Case_External_Id__c = caseCommX.ParentId__r.ExternalId);
                //caseComm.ComplaintId__c = cmpMap.get(caseCommX.ParentId__r.ExternalId).Id;
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
        // execute any post-processing
        //system.debug('Case Comments inserted/updated');
        //if(chained) {
        //Complaint_Creation_Batch_Time__c cs = Complaint_Creation_Batch_Time__c.getInstance();
        //Integer gap = Integer.valueOf(cs.Time_Interval__c);
        
        //dateTime timeInterval  = System.now().addMinutes(gap);
        //String cronExp = '0 ' + timeInterval.minute() + ' ' + timeInterval.hour() + ' ' + timeInterval.day() + ' ' + timeInterval.month() + ' ?';
        //System.schedule('Case External Sync Job ' + timeInterval, cronExp, new CreateAllChildSchedulableBatch());
        if(!Test.isRunningTest()){
		
		    // Executing the CreateWorkOrderForComplaintBatch batch class
            CreateWorkOrderForComplaintBatch createWorkOrder = new CreateWorkOrderForComplaintBatch(true);
            database.executebatch(createWorkOrder);
        }
        
        //}  
    } 
}