<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>BMX_Populate_Close_Date_in_CVR</fullName>
        <description>US-AER-047 : Populate Close date Date/Time when  CVR enters either "Closed - Submitted" or "Closed - Done"</description>
        <field>BMX_Close_Date__c</field>
        <formula>CMPL123_WF_Action_Performed_On__c</formula>
        <name>Populate Close Date in CVR</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BMX_Update_to_locked_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>BMX_Lock_CVR</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update to locked Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Populate Close Date in CVR</fullName>
        <actions>
            <name>BMX_Populate_Close_Date_in_CVR</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>US-AER-047 : Populate Close Date  Date/Time when  CVR enters either "Closed - Submitted" or "Closed - Done"</description>
        <formula>OR(CMPL123_WF_Status__c = 'Closed - Done', 
CMPL123_WF_Status__c ='Closed-Submitted')</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Record Type in CVR</fullName>
        <actions>
            <name>BMX_Update_to_locked_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CMPL123CME__CVR__c.CMPL123_WF_Status__c</field>
            <operation>equals</operation>
            <value>Pending Response</value>
        </criteriaItems>
        <description>RQC User or Local Subsidiary are able to add attachments when the  CVR  is in "Pending Response" status</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
