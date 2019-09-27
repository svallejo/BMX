<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>BMX_Update_Close_Date_in_TGA</fullName>
        <field>BMX_Close_Date__c</field>
        <formula>CMPL123_WF_Action_Performed_On__c</formula>
        <name>Update Close Date in TGA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BMX_Update_to_locked_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>BMX_Lock_TGA</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update to locked Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Populate Close Date in TGA</fullName>
        <actions>
            <name>BMX_Update_Close_Date_in_TGA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>US-AER-047 :Close Date to be populated When TGA enters either "Closed - Submitted" or "Closed - Done"</description>
        <formula>OR( CMPL123_WF_Status__c = 'Closed-Submitted',CMPL123_WF_Status__c ='Closed - Done')</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Record Type in TGA</fullName>
        <actions>
            <name>BMX_Update_to_locked_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__TGA__c.CMPL123_WF_Status__c</field>
            <operation>equals</operation>
            <value>Pending Response</value>
        </criteriaItems>
        <description>RQC User or Local Subsidiary are able to add attachments when the  TGA  is in "Pending Response" status</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
