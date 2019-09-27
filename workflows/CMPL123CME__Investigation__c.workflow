<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>BMX_Email_alert_to_RQC_Group_when_Investigation_is_Closed_with_Complaint_PRE_has</fullName>
        <description>Email alert to RQC Group when Investigation is Closed with Complaint PRE has Yes</description>
        <protected>false</protected>
        <recipients>
            <recipient>BMX_RQC</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/BMX_Investigation_is_Completed_its_related_Complaint_PRE_Yes</template>
    </alerts>
    <alerts>
        <fullName>BMX_Email_notification_when_Expert_Investigator_is_assigned</fullName>
        <description>Email notification when Expert Investigator is assigned</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>BMX_Expert_Investigator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/BMX_Expert_Investigation_Notification_Template</template>
    </alerts>
    <alerts>
        <fullName>BMX_Email_notification_when_Investigation_is_in_Pending_Approval_status</fullName>
        <description>Email notification when Investigation is in Pending Approval status</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>BMX_Approver_1__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>BMX_Approver_2__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>BMX_Approver_3__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>BMX_Approver_4__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>BMX_Investigation_Approver__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/BMX_Investigation_Approval_Template</template>
    </alerts>
    <alerts>
        <fullName>BMX_Investigation_Notify_Owner_when_Complete_Expert_Investigation_Performed</fullName>
        <description>Investigation-Notify Owner when Complete Expert Investigation Performed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/BMX_Investigation_Expert_Investigation_Complete</template>
    </alerts>
    <alerts>
        <fullName>BMX_Investigation_Notify_Owner_when_Reject_is_Performed_from_Pending_Approval</fullName>
        <description>Investigation-Notify Owner when Reject is Performed from Pending Approval</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/BMX_Investigation_Rejected_Approval</template>
    </alerts>
    <alerts>
        <fullName>Email_alert_to_RQC_US_group_when_an_investigation_is_closed_for_a_complaint_with</fullName>
        <description>Email alert to RQC (US) group when an investigation is closed for a complaint with an initial eMDR created.</description>
        <protected>false</protected>
        <recipients>
            <recipient>BMX_US_User</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/Investigation_Closed_Initial_EMDR_exists</template>
    </alerts>
    <fieldUpdates>
        <fullName>Assign_Record_Type_to_Child_Inv</fullName>
        <description>Assign Record Type to Child Investigation</description>
        <field>RecordTypeId</field>
        <lookupValue>Child_Investigation</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Assign Record Type to Child Inv</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_a_Key_Value</fullName>
        <field>CMPL123Rule_Key_Value__c</field>
        <formula>"INVWF"</formula>
        <name>Assign a Key Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_to_locked_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>BMX_Lock_Investigation</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update to locked Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_workflow_status</fullName>
        <field>CMPL123_WF_Status__c</field>
        <formula>Master_Investigation__r.CMPL123_WF_Status__c</formula>
        <name>Update workflow status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Assign Child Investigation Page Layout</fullName>
        <actions>
            <name>Assign_Record_Type_to_Child_Inv</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Investigation__c.BMX_Invest_Reference__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Assign child investigation page layout by assigning record type to chlid investigation</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Email Notification to RQC %28US%29 group when investigation is closed and initial emdr exists for a Complaint</fullName>
        <actions>
            <name>Email_alert_to_RQC_US_group_when_an_investigation_is_closed_for_a_complaint_with</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>RQC (US) group receives an email alert when an investigation is closed for a complaint with an initial eMDR created.</description>
        <formula>AND(CONTAINS(CMPL123_WF_Status__c ,'Closed'), CMPL123CME__Complaint__r.BMX_Initial_emdr_created__c = True, CMPL123CME__Complaint__c  &lt;&gt; null)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notify RQC Group when Investigation is Closed with Complaint PRE has Yes</fullName>
        <actions>
            <name>BMX_Email_alert_to_RQC_Group_when_Investigation_is_Closed_with_Complaint_PRE_has</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>US-AER-016 #AC1</description>
        <formula>AND(
CMPL123_WF_Status__c = 'Closed - Done',
CMPL123CME__Complaint__c &lt;&gt; null, TEXT(CMPL123CME__Complaint__r.BMX_PRE__c) = 'Yes'
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Record Type in Investigation</fullName>
        <actions>
            <name>Update_to_locked_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Investigation__c.CMPL123_WF_Status__c</field>
            <operation>equals</operation>
            <value>Closed - Done</value>
        </criteriaItems>
        <criteriaItems>
            <field>CMPL123CME__Investigation__c.BMX_Invest_Reference__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
