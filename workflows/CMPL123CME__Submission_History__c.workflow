<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_notification_when_submission_history_is_Failed</fullName>
        <description>Email notification when submission history is "Failed"</description>
        <protected>false</protected>
        <recipients>
            <recipient>BMX_US_User</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/eMDR_Submission_Failure_Template</template>
    </alerts>
</Workflow>
