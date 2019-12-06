global class BatchChildWorkflowHandler implements Database.Batchable<sObject>, Database.Stateful {

    Integer currentChildIndex = 0;
    Integer childBatchSize = 10;
    Id parentRecordId;
    List<Batch_Child_Workflow_Mapping__mdt> workflowMappingList;
    Batch_Child_Workflow_Mapping__mdt currentWorkflowMapping;

    global BatchChildWorkflowHandler(List<Batch_Child_Workflow_Mapping__mdt> workflowMappingList, Integer childBatchSize, Id parentRecordId) {
        this.workflowMappingList = workflowMappingList;
        this.childBatchSize = childBatchSize;
        this.parentRecordId = parentRecordId;
        System.debug(workflowMappingList);
        this.currentWorkflowMapping = workflowMappingList.get(currentChildIndex);
    }

    private String createQuery(Batch_Child_Workflow_Mapping__mdt workflowMapping){
        return 'SELECT ID, CMPL123Task_Key_Value__c, ' + workflowMapping.Parent_Field_API_Name__c + ' FROM ' + workflowMapping.Child_Object_API_Name__c + 
        ' WHERE ' + workflowMapping.Parent_Field_API_Name__c + ' = \'' + parentRecordId + '\'';
    }

    global Database.QueryLocator start(Database.BatchableContext BC) {
        if ( !workflowMappingList.isEmpty()) {
            String query = createQuery(currentWorkflowMapping);
            System.debug('query ' + query);
            return Database.getQueryLocator(query);
        }
        return null;
    }

    global void execute(Database.BatchableContext BC, List<SObject> childObjectList) {
        for ( SObject childObject : childObjectList ) {
            childObject.put('CMPL123Task_Key_Value__c', currentWorkflowMapping.X123_Task_Key_Value__c);
            System.debug(childObject.id);
        }
       // update childObjectList;
    }

    global void finish(Database.BatchableContext BC) {
        if ( currentChildIndex != workflowMappingList.size() - 1){
            BatchChildWorkflowHandler wfHandler = new BatchChildWorkflowHandler(workflowMappingList, childBatchSize, parentRecordId);
            Database.executeBatch(wfHandler, childBatchSize++);
        }
   }
}