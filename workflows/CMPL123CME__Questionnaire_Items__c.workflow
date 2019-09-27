<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CMPL123CME__CMPL123_QITEM_KEY_VALUE</fullName>
        <field>CMPL123CME__Parent_Key_Value__c</field>
        <formula>CMPL123CME__Questionnaire__r.CMPL123CME__Key_value__c</formula>
        <name>CMPL123_QITEM_KEY_VALUE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Weight</fullName>
        <field>CMPL123CME__Weight__c</field>
        <formula>1</formula>
        <name>Update Weight</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CMPL123CME__Set Key Value on Creation</fullName>
        <actions>
            <name>CMPL123CME__CMPL123_QITEM_KEY_VALUE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Questionnaire_Items__c.CMPL123CME__Parent_Key_Value__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Weight</fullName>
        <actions>
            <name>Update_Weight</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Questionnaire_Items__c.CMPL123CME__Answer__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
