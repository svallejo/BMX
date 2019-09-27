<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Investigation_Completed</fullName>
        <field>Investigation_Completed__c</field>
        <literalValue>1</literalValue>
        <name>Investigation Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>CMPL123CME__Investigation__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Investigation_not_completed</fullName>
        <field>Investigation_Completed__c</field>
        <literalValue>0</literalValue>
        <name>Investigation not completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>CMPL123CME__Investigation__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Investigation Validation</fullName>
        <actions>
            <name>Investigation_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Investigation_Items__c.CMPL123CME__Completed__c</field>
            <operation>equals</operation>
            <value>Yes,N/A</value>
        </criteriaItems>
        <description>Evaluate the rule when a record is created, and any time it's edited to subsequently meet criteria</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Investigation not completed</fullName>
        <actions>
            <name>Investigation_not_completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Investigation_Items__c.CMPL123CME__Completed__c</field>
            <operation>notEqual</operation>
            <value>Yes,N/A</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
