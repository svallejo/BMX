/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class MDC_Utility {
    global static Map<String,Map<String,String>> objectFieldSets;
    global static List<String> systemFields;
    global MDC_Utility() {

    }
    global static String formatRecordDetailValue(Id auditParentID, String objectName, String fieldName) {
        return null;
    }
    @RemoteAction
    global static Map<Id,String> getAllPublicGroupsForUser(String userId) {
        return null;
    }
    @RemoteAction
    global static String getNameFieldName(String objectName) {
        return null;
    }
    global static String getObjectFieldLabel(String objectName, String fieldName) {
        return null;
    }
    global static String getObjectFieldLabelWithoutID(String objectName, String fieldName) {
        return null;
    }
    global static Map<String,Schema.DescribeFieldResult> getObjectFieldSetDescribe(String objectName) {
        return null;
    }
    @RemoteAction
    global static Map<String,String> getObjectFieldSet(String objectName) {
        return null;
    }
    global static Map<String,String> getObjectFieldsOfType(String objectName, List<Schema.DisplayType> includeFieldTypes, Boolean includeFormulaFields) {
        return null;
    }
    @RemoteAction
    global static Map<String,String> getObjectFields(String objectName) {
        return null;
    }
    @RemoteAction
    global static Map<String,String> getObjectFields(String objectName, Boolean excludeSystemFields) {
        return null;
    }
    global static Map<String,String> getObjectFields(String objectName, Boolean excludeSystemFields, List<Schema.DisplayType> excludeFieldTypes, List<String> excludeFields) {
        return null;
    }
    @RemoteAction
    global static Map<String,String> getObjectFields(String objectName, Boolean excludeSystemFields, List<String> excludeFields) {
        return null;
    }
    global static Boolean isSystemField(String fieldName) {
        return null;
    }
    @RemoteAction
    global static Boolean isUserInPublicGroup(String userId, String userRoleId, String publicGroupId) {
        return null;
    }
    @RemoteAction
    global static Boolean isUserInPublicGroup(String userId, String publicGroupId, List<Group> allPublicGroups, Map<String,GroupMember> allGroupMembers) {
        return null;
    }
    global static String replaceCrLf(String inString) {
        return null;
    }
}
