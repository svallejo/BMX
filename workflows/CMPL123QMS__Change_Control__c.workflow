<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Change_Control_Review_Flag</fullName>
        <field>Change_Control_Review_Completed__c</field>
        <literalValue>1</literalValue>
        <name>Set Change Control	Review Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Change Control%09Review Flag</fullName>
        <actions>
            <name>Set_Change_Control_Review_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123QMS__Change_Control__c.Change_Control_Review_Completed__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>CMPL123QMS__Change_Control__c.CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Complete Review - Change Control</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
