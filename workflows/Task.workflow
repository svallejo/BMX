<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>BMX_Email_notification_to_intended_assignee</fullName>
        <description>Email notification to intended assignee</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/Email_notification_to_intended_assignee_in_Assessment</template>
    </alerts>
    <alerts>
        <fullName>BMX_Email_notification_when_Due_Date_is_passed</fullName>
        <description>Email notification when Due Date is passed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/Task_Overdue_Notification_Template</template>
    </alerts>
    <alerts>
        <fullName>BMX_Task_Notify_Task_Creator_that_it_Complete</fullName>
        <description>Task-Notify Task Creator that it Complete</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>BMX_Templates/BMX_Task_Task_Complete</template>
    </alerts>
    <rules>
        <fullName>Send Notification to Intended Assignee</fullName>
        <actions>
            <name>BMX_Email_notification_to_intended_assignee</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Task.BMX_Related_To__c</field>
            <operation>equals</operation>
            <value>a0d</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Task-Notify Task Creator when Complete</fullName>
        <actions>
            <name>BMX_Task_Notify_Task_Creator_that_it_Complete</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <description>Sends a notification to the Task Creator when the task's status is changed to Completed.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
