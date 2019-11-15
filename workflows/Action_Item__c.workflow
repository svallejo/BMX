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
</Workflow>