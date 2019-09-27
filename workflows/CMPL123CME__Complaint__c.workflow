<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>BMX_Complaint_Notify_RQC_Group_when_possible_Serious_Injury_Death</fullName>
        <description>Complaint-Notify RQC Group when possible Serious Injury/Death</description>
        <protected>false</protected>
        <recipients>
            <recipient>BMX_RQC</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/BMX_Complaint_Complaint_possible_Serious_Injury_Death</template>
    </alerts>
    <alerts>
        <fullName>BMX_Email_alert_to_RQC_and_RQC_Approver_when_Complaint_fields_related_to_Product</fullName>
        <description>Email alert to RQC and RQC Approver when Complaint fields related to Product info and Customer info updated with Assessment Close</description>
        <protected>false</protected>
        <recipients>
            <recipient>BMX_RQC</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>BMX_RQC_Approver</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/BMX_Notification_RQC_n_RQC_Approver_wen_assessment_closed</template>
    </alerts>
    <alerts>
        <fullName>BMX_Email_alert_to_US_User_when_Complaint_has_a_PRE_switched_from_Yes_to_No</fullName>
        <description>Email alert to US User group when Complaint has a PRE switched from Yes to No</description>
        <protected>false</protected>
        <recipients>
            <recipient>BMX_US_User</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/Email_Notification_to_RQC_User</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approved_By</fullName>
        <field>Approved_By__c</field>
        <formula>CMPL123CME__CMPL123_WF_Action_Performed_By__r.FirstName &amp; " " &amp; CMPL123CME__CMPL123_WF_Action_Performed_By__r.LastName</formula>
        <name>Approved By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approved_Date</fullName>
        <field>Approved_Date__c</field>
        <formula>Now()</formula>
        <name>Approved Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closed_By</fullName>
        <field>Closed_By__c</field>
        <formula>CMPL123CME__CMPL123_WF_Action_Performed_By__r.FirstName &amp; " " &amp; CMPL123CME__CMPL123_WF_Action_Performed_By__r.LastName</formula>
        <name>Closed By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closed_Date</fullName>
        <field>Closed_Date__c</field>
        <formula>Now()</formula>
        <name>Closed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Complete_Investigation_By</fullName>
        <field>Complete_Investigation_By__c</field>
        <formula>CMPL123CME__CMPL123_WF_Action_Performed_By__r.FirstName &amp; " " &amp; CMPL123CME__CMPL123_WF_Action_Performed_By__r.LastName</formula>
        <name>Complete Investigation By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Complete_Investigation_Date</fullName>
        <field>Complete_Investigation_Date__c</field>
        <formula>Now()</formula>
        <name>Complete Investigation Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Evaluation_Completed_By</fullName>
        <field>Evaluation_Completed_By__c</field>
        <formula>CMPL123CME__CMPL123_WF_Action_Performed_By__r.FirstName &amp; " " &amp; CMPL123CME__CMPL123_WF_Action_Performed_By__r.LastName</formula>
        <name>Evaluation Completed By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Evaluation_Completed_Date</fullName>
        <field>Evaluation_Completed_Date__c</field>
        <formula>Now()</formula>
        <name>Evaluation Completed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opened_By</fullName>
        <field>Opened_By__c</field>
        <formula>CMPL123CME__Initiator__r.FirstName &amp; " " &amp; CMPL123CME__Initiator__r.LastName</formula>
        <name>Opened By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opened_Date</fullName>
        <field>Opened_Date__c</field>
        <formula>Now()</formula>
        <name>Opened Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Re_Opened_By</fullName>
        <field>Re_Opened_By__c</field>
        <formula>CMPL123CME__CMPL123_WF_Action_Performed_By__r.FirstName &amp; " " &amp; CMPL123CME__CMPL123_WF_Action_Performed_By__r.LastName</formula>
        <name>Re-Opened By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Re_Opened_Date</fullName>
        <field>Re_Opened_Date__c</field>
        <formula>Now()</formula>
        <name>Re-Opened Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reject_Complaint_By</fullName>
        <field>Reject_Complaint_By__c</field>
        <formula>CMPL123CME__CMPL123_WF_Action_Performed_By__r.FirstName &amp; " " &amp; CMPL123CME__CMPL123_WF_Action_Performed_By__r.LastName</formula>
        <name>Reject Complaint By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reject_Complaint_Date</fullName>
        <field>Reject_Complaint_Date__c</field>
        <formula>Now()</formula>
        <name>Reject Complaint Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rejected_By</fullName>
        <field>Rejected_By__c</field>
        <formula>CMPL123CME__CMPL123_WF_Action_Performed_By__r.FirstName &amp; " " &amp; CMPL123CME__CMPL123_WF_Action_Performed_By__r.LastName</formula>
        <name>Rejected By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rejected_Date</fullName>
        <field>Rejected_Date__c</field>
        <formula>Now()</formula>
        <name>Rejected Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rule_field_update</fullName>
        <field>CMPL123Rule_Key_Value__c</field>
        <formula>'Complaint'</formula>
        <name>Rule field update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Submitted_For_Evaluation_Date</fullName>
        <field>Submitted_for_Evaluation_Date__c</field>
        <formula>Now()</formula>
        <name>Submitted For Evaluation Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Submitted_For_Evaluation_by</fullName>
        <field>Submitted_for_Evaluation_By__c</field>
        <formula>CMPL123CME__CMPL123_WF_Action_Performed_By__r.FirstName &amp; " " &amp; CMPL123CME__CMPL123_WF_Action_Performed_By__r.LastName</formula>
        <name>Submitted For Evaluation by</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Submitted_for_Review_By</fullName>
        <field>Submitted_for_Review_By__c</field>
        <formula>CMPL123CME__CMPL123_WF_Action_Performed_By__r.FirstName &amp; " " &amp; CMPL123CME__CMPL123_WF_Action_Performed_By__r.LastName</formula>
        <name>Submitted for Review By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Submitted_for_Review_Date</fullName>
        <field>Submitted_for_Review_Date__c</field>
        <formula>Now()</formula>
        <name>Submitted for Review Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Customer_Contact_Date_Field</fullName>
        <field>BMX_Customer_Contact_Date__c</field>
        <formula>BMX_Customer_Contact_Date_Time__c</formula>
        <name>Update Customer Contact Date Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Approved</fullName>
        <actions>
            <name>Approved_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Approved_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.CMPL123CME__CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Approve Review</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>BMX Complaint Close</fullName>
        <actions>
            <name>Rule_field_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Rule key value field</description>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Closed</fullName>
        <actions>
            <name>Closed_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Closed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.CMPL123CME__CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Close Complaint</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Complaint-Notify RQC Group when possible Serious Injury%2FDeath</fullName>
        <actions>
            <name>BMX_Complaint_Notify_RQC_Group_when_possible_Serious_Injury_Death</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.BMX_PRE1_Patient_or_operator_death__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.BMX_PRE2_1_Patient_or_operator_harmed__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>Send a notification to the RQC Group when a Complaint has been created and the "PRE1 Patient or operator death?" = "Yes", OR "PRE2.1 Patient or operator harmed?" = "Yes".</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Complete Investigation</fullName>
        <actions>
            <name>Complete_Investigation_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Complete_Investigation_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.CMPL123CME__CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Complete Investigation</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Evaluation Completed</fullName>
        <actions>
            <name>Evaluation_Completed_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Evaluation_Completed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.CMPL123CME__CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Complete Evaluation</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opened Complaint</fullName>
        <actions>
            <name>Opened_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opened_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.CMPL123CME__CMPL123_WF_Status__c</field>
            <operation>equals</operation>
            <value>Opened</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Re-Opened</fullName>
        <actions>
            <name>Re_Opened_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Re_Opened_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.CMPL123CME__CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Re-Open Complaint</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reject Complaint</fullName>
        <actions>
            <name>Reject_Complaint_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reject_Complaint_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.CMPL123CME__CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Reject Complaint</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Rejected</fullName>
        <actions>
            <name>Rejected_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Rejected_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.CMPL123CME__CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Reject Review</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Submitted For Evaluation</fullName>
        <actions>
            <name>Submitted_For_Evaluation_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Submitted_For_Evaluation_by</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.CMPL123CME__CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Submit for Evaluation</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Submitted for Review</fullName>
        <actions>
            <name>Submitted_for_Review_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Submitted_for_Review_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.CMPL123CME__CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Submit for Review</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Customer Contact Date Field</fullName>
        <actions>
            <name>Update_Customer_Contact_Date_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__Complaint__c.BMX_Customer_Contact_Date_Time__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
