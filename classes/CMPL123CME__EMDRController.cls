/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class EMDRController {
    global String dateLocaleCode {
        get;
        set;
    }
    global String dateLocaleFormat {
        get;
        set;
    }
    global String dateTimeLocaleFormat {
        get;
        set;
    }
    global String parentEMDRCodeMap {
        get;
    }
    global String plcHolderMap {
        get;
        set;
    }
    global String recordType {
        get;
    }
    global String recordTypeName {
        get;
    }
    global Boolean showWFPanel {
        get;
        set;
    }
    global String urlParamsMapString {
        get;
        set;
    }
    global EMDRController(ApexPages.StandardController controller) {

    }
    @RemoteAction
    global static String complaintCodeList(String type, String filter) {
        return null;
    }
    @RemoteAction
    global static String createTreeJson(String codeId, String type) {
        return null;
    }
    @Deprecated
    global static String getApiIdMap(String emdrId) {
        return null;
    }
    global static String getButtons(String recordTypeId) {
        return null;
    }
    global static String getButtons(String recordTypeId, String emdrId) {
        return null;
    }
    @RemoteAction
    global static String getFieldDetails(String recDetails) {
        return null;
    }
    @RemoteAction
    global static Map<String,CMPL123CME.EMDRController.FieldHelper> getFields(String recDetails) {
        return null;
    }
    @RemoteAction
    global static String getLookupFields(String fieldApi, String name) {
        return null;
    }
    global static String getRelatedList(String recordTypeId) {
        return null;
    }
    @Deprecated
    global static String getSectionDetail(String recDetails) {
        return null;
    }
    @RemoteAction
    global static String getSectionDetail(String recDetails, String pageTheme) {
        return null;
    }
    global static Object getTabs(String mdrId) {
        return null;
    }
    @RemoteAction
    global static String queryRelatedList(String recDetails) {
        return null;
    }
    @RemoteAction
    global static String saveRecord(String fieldList, String recDetails) {
        return null;
    }
global class Code {
    global String action;
    global String ccid;
    global String code;
    global String id;
    global Code(String code, String Id, String ccid, String action) {

    }
}
global class ComplaintCode {
    global List<CMPL123CME.EMDRController.Code> codes;
    global String type;
    global ComplaintCode(String type, List<CMPL123CME.EMDRController.Code> codes) {

    }
}
global class Field {
    global String apiName;
    global Boolean isReadOnly;
    global String isRequired;
    global String label;
    global Integer length;
    global String referenceObjKeyPrefix;
    global String tabPosition;
    global Field(String label, Boolean isReadOnly, String tabPosition, String apiName, String isRequired, Integer length, String referenceObjKeyPrefix) {

    }
}
global class FieldHelper {
    global List<CMPL123CME.EMDRController.ComplaintCode> cCodes;
    global String formatValue;
    global String message;
    global List<CMPL123CME.EMDRController.PickList> pickVals;
    global String type;
    global String value;
    global FieldHelper(String val, String type, String formatValue, List<CMPL123CME.EMDRController.PickList> pickVals, List<CMPL123CME.EMDRController.ComplaintCode> cCodes) {

    }
}
global class LookupData {
    global LookupData() {

    }
}
global class PickList {
    global String Label;
    global Boolean ticked;
    global String value;
    global PickList(String lbl, String val, Boolean tick) {

    }
}
global class RelatedList {
    global List<String> apiList;
    global String buttonLink;
    global List<String> columnList;
    global CMPL123CME__EMDR_Layout_Config__c config;
    global String newButtonLabel;
    global String relatedName;
    global String relationShip;
    global RelatedList(String relLabel, String rel, List<String> columns, List<String> apis, String btnLabel, String buttonLink, CMPL123CME__EMDR_Layout_Config__c configRec) {

    }
}
global class Tab {
    global List<CMPL123CME.EMDRController.Field> fieldList;
    global Boolean isValid;
    global String tabLabel;
    global String tabName;
    global Integer tabPosition;
    global Tab(String tabLabel, String tabName, Integer tabPosition, Boolean isValid, List<CMPL123CME.EMDRController.Field> fieldList) {

    }
}
}
