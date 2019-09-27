<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CMPL123__Update_Field</fullName>
        <field>CMPL123__Field__c</field>
        <name>Update Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>true</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>CMPL123__MDC Field Criteria</fullName>
        <actions>
            <name>CMPL123__Update_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123__MDC_Trigger__c.CMPL123__Field__c</field>
            <operation>notEqual</operation>
            <value>Null</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
