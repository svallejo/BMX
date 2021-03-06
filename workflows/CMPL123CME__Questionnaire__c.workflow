<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Assign_Local_Assessment_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Local_Assessment</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Assign Local Assessment Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BMX_Rule_field_update_in_Assessment</fullName>
        <description>Updates Assessment: Rule Field Update Key Value to "Global Assessment"</description>
        <field>CMPL123Rule_Key_Value__c</field>
        <formula>'Global Assessment'</formula>
        <name>Rule field update in Assessment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BMX_Update_RFUKV_for_Local_Assessment</fullName>
        <description>Updates Assessment: Rule Field Update Key Value to "Local Assessment"</description>
        <field>CMPL123Rule_Key_Value__c</field>
        <formula>"Local Assessment"</formula>
        <name>Update RFUKV for Local Assessment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Is_Assessment_Closed_update</fullName>
        <field>BMX_Is_Assessment_Closed__c</field>
        <literalValue>1</literalValue>
        <name>Is Assessment Closed ? update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Key_Value_Update</fullName>
        <field>CMPL123CME__Key_value__c</field>
        <formula>Questionnaire__r.CMPL123CME__Key_Value__c</formula>
        <name>Key Value Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Key_Value</fullName>
        <description>TWD US-AER-009 Global Questionnaire</description>
        <field>CMPL123CME__Key_value__c</field>
        <formula>"Assessment"</formula>
        <name>Update Key Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Local Assessment Closed Done</fullName>
        <actions>
            <name>Is_Assessment_Closed_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CMPL123CME__Questionnaire__c.CMPL123_WF_Status__c</field>
            <operation>equals</operation>
            <value>Closed - Done</value>
        </criteriaItems>
        <description>Local Assessment Closed Done</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>CMPL123CME__Questionnaire__c.NOW_59MIN__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Update Assessment Key Value</fullName>
        <actions>
            <name>Update_Key_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>TWD US-AER-009 Global Questionnaire</description>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
