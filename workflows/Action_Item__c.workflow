<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Action_Item_Optional_Approver</fullName>
        <description>Action Item Optional Approver</description>
        <protected>false</protected>
        <recipients>
            <field>Approver_1__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Approver_2__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Approver_3__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Approver_4__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Approver_5__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Approver_6__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Optional_Approver_Email_Notification</template>
    </alerts>
    <alerts>
        <fullName>Action_Item_Quality_Approver</fullName>
        <description>Action Item Quality Approver</description>
        <protected>false</protected>
        <recipients>
            <field>Quality_Approver__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/AI_Quality_Approver_Email_Notification</template>
    </alerts>
    <alerts>
        <fullName>Action_Item_Rejected</fullName>
        <description>Action Item Rejected</description>
        <protected>false</protected>
        <recipients>
            <field>Assignee__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Quality_Approver__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Action_Item_Rejected</template>
    </alerts>
    <alerts>
        <fullName>Action_item_is_due_5_days_before_target_due_date</fullName>
        <description>Action item is due 5 days before target due date</description>
        <protected>false</protected>
        <recipients>
            <field>Assignee__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/TrackWise_Digital_Change_Control_Action_Item_due_in_5_Days</template>
    </alerts>
    <alerts>
        <fullName>Action_Item_Assignee</fullName>
        <description>Action Item Assignee</description>
        <protected>false</protected>
        <recipients>
            <field>Assignee__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/AI_Assigned_Email_Notification</template>
    </alerts>
    <alerts>
        <fullName>Action_Item_Reopened</fullName>
        <description>Action Item Reopened</description>
        <protected>false</protected>
        <recipients>
            <field>Assignee__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/TrackWise_Digital_Change_Control_Action_Item_Reopened</template>
    </alerts>
    <rules>
        <fullName>Due Soon Notification</fullName>
        <active>true</active>
        <formula>AND( 
          NOT(ISBLANK( Target_Due_Date__c )),
          NOT(ISBLANK( Assignee__c  )),
          CMPL123_WF_Status__c  &lt;&gt; 'Closed - Canceled', 
          CMPL123_WF_Status__c &lt;&gt; 'Closed - Done', 
          CMPL123_WF_Status__c &lt;&gt; 'Closed - Approved'            
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Action_item_is_due_5_days_before_target_due_date</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Action_Item__c.Target_Due_Date__c</offsetFromField>
            <timeLength>-5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
