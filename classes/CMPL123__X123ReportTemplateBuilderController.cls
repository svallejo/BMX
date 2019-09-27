/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class X123ReportTemplateBuilderController {
    @RemoteAction
    global static String checkFormulaSyntax(String objectName, String field) {
        return null;
    }
    @RemoteAction
    global static void deleteTemplate(String reportTemplateId) {

    }
    @RemoteAction
    global static String doActivate(String reportTemplateId, String isActivate) {
        return null;
    }
    @RemoteAction
    global static String getAllFields(String objectName) {
        return null;
    }
    @RemoteAction
    global static String getAllSObjects() {
        return null;
    }
    @RemoteAction
    global static String getFieldOptionList(String fieldApi, String objectName, String relationShipName) {
        return null;
    }
    @RemoteAction
    global static String getFieldOptionS(String objApiNm) {
        return null;
    }
    @RemoteAction
    global static String getRelationShipNameObjectNameMap(String objNm, String RelationShipName) {
        return null;
    }
    @RemoteAction
    global static String getReportTemplates(String objectName) {
        return null;
    }
    @RemoteAction
    global static String getReportTemplatesDetail(String templateId) {
        return null;
    }
    @RemoteAction
    global static String saveAsReportTemplate(String finalTemplateJson) {
        return null;
    }
    @RemoteAction
    global static String saveReportTemplate(String reportTemplateJson) {
        return null;
    }
global class LabelApiMap {
    global String dataType {
        get;
        set;
    }
    global String formula {
        get;
        set;
    }
    global String label {
        get;
        set;
    }
    global String type {
        get;
        set;
    }
    global String value {
        get;
        set;
    }
    global LabelApiMap(String label, String value, String type) {

    }
    global LabelApiMap(String label, String value, String dataType, String type, String formula) {

    }
}
global class SectionDetail {
    global List<CMPL123.X123ReportTemplateBuilderController.LabelApiMap> fields;
    global String id;
    global String label;
    global Integer sequence;
    global Boolean showBorder;
    global Boolean showHeader;
    global String type;
    global String value;
    global SectionDetail(Boolean showHedr, String type, String label, String value, List<CMPL123.X123ReportTemplateBuilderController.LabelApiMap> fldSet, String Id) {

    }
    global SectionDetail(Boolean showHedr, String type, String label, String value, List<CMPL123.X123ReportTemplateBuilderController.LabelApiMap> fldSet, String Id, Integer sequence) {

    }
    global SectionDetail(Boolean showHedr, Boolean showBorde, String type, String label, String value, List<CMPL123.X123ReportTemplateBuilderController.LabelApiMap> fldSet, String Id, Integer sequence) {

    }
}
}
