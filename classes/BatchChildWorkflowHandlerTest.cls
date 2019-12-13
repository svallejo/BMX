@IsTest
public class BatchChildWorkflowHandlerTest {
    @IsTest static void createQuery_validQuery(){
        Batch_Child_Workflow_Mapping__mdt batchMapping = new Batch_Child_Workflow_Mapping__mdt(X123_Task_Key_Value__c='CancelOpenAI', Parent_Field_API_Name__c='Change_Control__c',
                Child_Workflow_Status__c='Open',Parent_Object_API_Name__c='CMPL123QMS__Change_Control__c', Parent_Workflow_Status__c='Closed - Canceled',
                Child_Object_API_Name__c='Action_Item__c', MasterLabel='Cancel All Open CC AIs - Test', DeveloperName='Cancel_All_Open_CC_AIs_Test');

        BatchChildWorkflowHandler handler = new BatchChildWorkflowHandler();
        Id ccRecType = Schema.SObjectType.CMPL123QMS__Change_Control__c.getRecordTypeInfosByName().get('CC Custom').getRecordTypeId();
        CMPL123QMS__Change_Control__c cc = TestSetup.createCC(true, ccRecType);
        handler.parentRecordId = cc.id;

        String query = handler.createQuery(batchMapping);
        String expectedQuery = 'SELECT ID, CMPL123Task_Key_Value__c, CMPL123_WF_Status__c,' + batchMapping.Parent_Field_API_Name__c + 
        ' FROM ' + batchMapping.Child_Object_API_Name__c + 
        ' WHERE CMPL123_WF_Status__c =\'' +  batchMapping.Child_Workflow_Status__c + '\' AND ' +
         batchMapping.Parent_Field_API_Name__c + ' = \'' + cc.id + '\'';
        System.assertEquals(expectedQuery, query);
    }
}