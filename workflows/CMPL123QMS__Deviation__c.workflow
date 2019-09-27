<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Complete_Review_Check</fullName>
        <field>Complete_Review_Reached__c</field>
        <literalValue>1</literalValue>
        <name>Complete Review Check</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Complete_Review_uncheck</fullName>
        <field>Complete_Review_Reached__c</field>
        <literalValue>0</literalValue>
        <name>Complete Review uncheck</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contributing_Factor</fullName>
        <field>Contributing_Factors__c</field>
        <name>Contributing Factor</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Investigation_Summary</fullName>
        <field>CMPL123QMS__Investigation_Summary__c</field>
        <name>Investigation Summary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>investigation_required</fullName>
        <field>Investigation_Required__c</field>
        <name>investigation required?</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Invest need to be empty</fullName>
        <actions>
            <name>Contributing_Factor</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Investigation_Summary</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>investigation_required</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123QMS__Deviation__c.CMPL123_WF_Status__c</field>
            <operation>equals</operation>
            <value>,Open,Review - Quality Event</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Quality Event Review update</fullName>
        <actions>
            <name>Complete_Review_Check</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123QMS__Deviation__c.CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Complete Review - Quality Event</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reopen Quality event update</fullName>
        <actions>
            <name>Complete_Review_uncheck</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123QMS__Deviation__c.CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Reopen</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
