<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>BMX_Update_to_locked_Record_Type</fullName>
        <description>RQC User or Local Subsidiary are able to add attachments when the  Generic Report is in "Pending Response" status.</description>
        <field>RecordTypeId</field>
        <lookupValue>BMX_Lock_Generic_Report</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update to locked Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Close_Date_in_Generic_Report</fullName>
        <description>US-AER-047</description>
        <field>BMX_Close_Date__c</field>
        <formula>CMPL123_WF_Action_Performed_On__c</formula>
        <name>Populate Close Date in Generic Report</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Populate Close Date in Generic Report</fullName>
        <actions>
            <name>Populate_Close_Date_in_Generic_Report</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>US-AER-047</description>
        <formula>OR( CMPL123_WF_Status__c = 'Closed - Done', CMPL123_WF_Status__c ='Closed-Submitted')</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Record Type in Generic Report</fullName>
        <actions>
            <name>BMX_Update_to_locked_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>BMX_Generic_Report__c.CMPL123_WF_Status__c</field>
            <operation>equals</operation>
            <value>Pending Response</value>
        </criteriaItems>
        <description>RQC User or Local Subsidiary are able to add attachments when the  Generic Report is in "Pending Response" status.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
