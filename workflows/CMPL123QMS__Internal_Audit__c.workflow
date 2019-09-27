<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Audit_Reopen</fullName>
        <field>Is_Audit_Approved__c</field>
        <literalValue>0</literalValue>
        <name>Audit Reopen</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Audit_approved_Flag</fullName>
        <field>Is_Audit_Approved__c</field>
        <literalValue>1</literalValue>
        <name>Set Audit approved Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Initial_Approval_Flag</fullName>
        <field>Initial_Approval_Complete__c</field>
        <literalValue>1</literalValue>
        <name>Set Initial Approval Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Audit Reopen</fullName>
        <actions>
            <name>Audit_Reopen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123QMS__Internal_Audit__c.CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Reopen</value>
        </criteriaItems>
        <criteriaItems>
            <field>CMPL123QMS__Internal_Audit__c.Is_Audit_Approved__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Audit approved Flag</fullName>
        <actions>
            <name>Set_Audit_approved_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Initial_Approval_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123QMS__Internal_Audit__c.CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Approve Audit</value>
        </criteriaItems>
        <description>workflow to update the Is Audit Approved? field when the workflow status is approved</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
