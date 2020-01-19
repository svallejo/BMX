<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>BMX_Update_to_locked_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>BMX_Lock_EU_MIR</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update to locked Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Record Type in EU MIR</fullName>
        <actions>
            <name>BMX_Update_to_locked_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__EU_MIR__c.CMPL123_WF_Status__c</field>
            <operation>equals</operation>
            <value>Pending Response</value>
        </criteriaItems>
        <description>RQC User or Local Subsidiary are able to add attachments when the EU MIR is in "Pending Response" status.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
