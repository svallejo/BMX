public without Sharing class ProcessBatchChildWorkflow {
    public ProcessBatchChildWorkflow() {

    }

    public static void processBatchChildWorkflows(String parentApiName, Map<Id,SObject> objectMap, Map<Id,SObject> objectOldMap){
        System.debug('process batch ');
        Set<Id> keySet = objectMap.keySet();
        Id objectId;
        SObject obj;
        for ( Id objID : keySet) {
            obj = objectMap.get(objId);
        }

        // The record is at updated at the open state
        if (objectOldMap.get(obj.id).get('CMPL123_WF_Action__c') == null ) {
            if ( obj.get('CMPL123_WF_Action__c') == null) {
                return;
            }
        }
        // The record was updated by did not progress states
        else if (objectOldMap.get(obj.id).get('CMPL123_WF_Action__c').toString() == obj.get('CMPL123_WF_Action__c').toString()) {
            return;
        }
        Integer childBatchSize = 50;
        List<Workflow_Batch_Size__mdt> childBatchSizeList = [SELECT Batch_Size__c FROM Workflow_Batch_Size__mdt where MasterLabel =: parentApiName];
        if (!childBatchSizeList.isEmpty()){
            childBatchSize = childBatchSizeList.get(0).Batch_Size__c.intValue();
        }
        String parentWorkflowStatus = obj.get('CMPL123_WF_Status__c').toString();
        List<Batch_Child_Workflow_Mapping__mdt> workflowMappingList = [SELECT X123_Task_Key_Value__c, Parent_Field_API_Name__c, Child_Workflow_Status__c,Bypass_Validation_Rule__c,
                                Parent_Object_API_Name__c, Parent_Workflow_Status__c, Parent_Workflow_Action__c, Child_Object_API_Name__c from Batch_Child_Workflow_Mapping__mdt
                                where Parent_Object_API_Name__c =: parentApiName and Parent_Workflow_Status__c =: parentWorkflowStatus];
        if ( !workflowMappingList.isEmpty()) {
            Id recordId = (Id)obj.get('Id');
            BatchChildWorkflowHandler wfHandler = new BatchChildWorkflowHandler(workflowMappingList, childBatchSize, recordId, 0);
            Database.executeBatch(wfHandler, childBatchSize);
        }
    }
}