<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Change_Control_Plan_Approved_Flag</fullName>
        <field>Change_Control_Plan_Approved__c</field>
        <literalValue>1</literalValue>
        <name>Set Change Control Plan Approved Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_SME_Approved</fullName>
        <field>Plan_SME_Approved__c</field>
        <literalValue>1</literalValue>
        <name>Update SME Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Change Control Plan Approved Flag</fullName>
        <actions>
            <name>Set_Change_Control_Plan_Approved_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Change_Control_Plan__c.CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Approve Action Plan</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update SME Approved</fullName>
        <actions>
            <name>Update_SME_Approved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Change_Control_Plan__c.CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Quality Approve</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
