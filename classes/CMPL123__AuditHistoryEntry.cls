/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AuditHistoryEntry {
    global Id activityTypeId {
        get;
    }
    global String application {
        get;
    }
    global String comments {
        get;
    }
    global String createdByUserName {
        get;
    }
    global Datetime datePosted {
        get;
    }
    global Boolean eSignApplied {
        get;
    }
    global List<CMPL123.AuditHistoryEntry.FieldValueChange> fieldValueChanges {
        get;
    }
    global String relatedRecordId {
        get;
    }
    global Id responsibleUserId {
        get;
    }
    global String summary {
        get;
    }
    global AuditHistoryEntry(String relatedRecordId, Datetime datePosted, Id activityTypeId, Id responsibleUserId, String application, String comments, String summary, List<CMPL123.AuditHistoryEntry.FieldValueChange> fieldValueChanges) {

    }
    global AuditHistoryEntry(String relatedRecordId, Datetime datePosted, Id activityTypeId, Id responsibleUserId, String application, String comments, String summary, Boolean eSignApplied, List<CMPL123.AuditHistoryEntry.FieldValueChange> fieldValueChanges) {

    }
    global AuditHistoryEntry(String relatedRecordId, Datetime datePosted, Id activityTypeId, Id responsibleUserId, String application, String comments, String summary, Boolean eSignApplied, String createdByUserName, List<CMPL123.AuditHistoryEntry.FieldValueChange> fieldValueChanges) {

    }
    global Boolean equals(Object obj) {
        return null;
    }
    global override Integer hashCode() {
        return null;
    }
    global Map<String,Object> mapAuditHistoryEntryObjectsByStrings(Map<Id,CMPL123__Audit_Activity_Type__c> mapOfActivityTypes, Map<Id,User> mapOfUsers) {
        return null;
    }
global class FieldValueChange {
    global String fieldName {
        get;
        set;
    }
    global Object newValue {
        get;
        set;
    }
    global Object oldValue {
        get;
        set;
    }
    global FieldValueChange(String fieldName, Object oldValue, Object newValue) {

    }
    global Boolean equals(Object obj) {
        return null;
    }
    global override Integer hashCode() {
        return null;
    }
}
}
