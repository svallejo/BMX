<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notify_RQC_US_Approver_User_Group_when_emdr_is_WF_status_as_Review_In_Progress</fullName>
        <description>Notify RQC US Approver  User Group when emdr is WF status as Review In Progress</description>
        <protected>false</protected>
        <recipients>
            <recipient>BMX_RQC_Approver</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/Notify_RQC_US_Approver_User_Group_when_emdr_is_WF_status_as_Review_In_Progress</template>
    </alerts>
    <alerts>
        <fullName>Notify_US_User_Group_when_emdr_is_sent_back_for_Rework</fullName>
        <description>Notify US User Group when emdr is sent back for Rework</description>
        <protected>false</protected>
        <recipients>
            <recipient>BMX_US_User</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/Notify_US_User_Group_when_emdr_is_sent_back_for_Rework</template>
    </alerts>
    <fieldUpdates>
        <fullName>BMX_Update_Submit_for_Review_Done_by</fullName>
        <field>BMX_Submit_for_Review_Done_by__c</field>
        <formula>IF(CMPL123CME__CMPL123_WF_Action__c = 'Submit for Review', CMPL123CME__CMPL123_WF_Action_Performed_By__r.FirstName +' '+ CMPL123CME__CMPL123_WF_Action_Performed_By__r.LastName , '')</formula>
        <name>Update Submit for Review Done by</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Notify RQC US Approver User Group when emdr WF status as Review in Progress</fullName>
        <actions>
            <name>Notify_RQC_US_Approver_User_Group_when_emdr_is_WF_status_as_Review_In_Progress</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123CME__EMDR__c.CMPL123CME__CMPL123_WF_Status__c</field>
            <operation>equals</operation>
            <value>Review In Progress</value>
        </criteriaItems>
        <description>Notify RQC US Approver User Group when emdr WF status as Review in Progress</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify US User Group when emdr is sent back for Rework</fullName>
        <actions>
            <name>Notify_US_User_Group_when_emdr_is_sent_back_for_Rework</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CMPL123CME__EMDR__c.CMPL123CME__CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Rework</value>
        </criteriaItems>
        <description>ID-006 : Have US User Group be notified when an eMDR is sent back for rework.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update %09 Submit for Review Done By</fullName>
        <actions>
            <name>BMX_Update_Submit_for_Review_Done_by</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CMPL123CME__EMDR__c.CMPL123CME__CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Submit for Review</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
