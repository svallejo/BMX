/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class WorkflowPanelController {
    global String pageName {
        get;
        set;
    }
    global String recordId {
        get;
        set;
    }
    global WorkflowPanelController() {

    }
    @Deprecated
    global static String applyWorkflowAction(String recordId, String stepId, String comment) {
        return null;
    }
    @RemoteAction
    global static String applyWorkflowAction(String recordId, String actionId, String stepId, String comment) {
        return null;
    }
    @RemoteAction
    global static String getComplianceDet(String recordId) {
        return null;
    }
    global static CMPL123.WorkflowPanelController.InnerRest getComplianceDetails(String recordId) {
        return null;
    }
    @RemoteAction
    global static List<CMPL123__WF_Step__c> getWFSteps(String recordId) {
        return null;
    }
    @RemoteAction
    global static CMPL123.WorkflowPanelController.InnerRest getWorkFlowSteps(String recordId) {
        return null;
    }
    @RemoteAction
    global static List<CMPL123__WF_Step__c> getWorkFlowSteps2(String currentId) {
        return null;
    }
    @RemoteAction
    global static String getWorkFlowSteps3(String recordId, String st_id, String encode_id) {
        return null;
    }
    @RemoteAction
    global static String getWorkflowDetail(String recordId) {
        return null;
    }
    @RemoteAction
    global static List<CMPL123__WF_Step__c> getWorkflowStepRecords(String recordId) {
        return null;
    }
    @RemoteAction
    global static Boolean isValidCredentials(String uname, String pwd) {
        return null;
    }
    @RemoteAction
    global static String remotelyHandleActions(String recordId, String stepId, String comment) {
        return null;
    }
    @RemoteAction
    global static Boolean validateESignature(String uname, String pwd) {
        return null;
    }
    @RemoteAction
    global static CMPL123__WF_Action__c validateWorkflowStep(Id recordId, Id stepId, Id actionId) {
        return null;
    }
global class InnerRest {
    global InnerRest() {

    }
}
}
