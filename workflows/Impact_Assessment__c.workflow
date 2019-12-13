<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Impact_Assessment_has_been_reopened</fullName>
        <description>Impact Assessment has been reopened</description>
        <protected>false</protected>
        <recipients>
            <field>Assignee__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/TrackWise_Digital_Change_Control_Subject_Matter_Expert_SME_Assess_reopen</template>
    </alerts>
    <alerts>
        <fullName>Impact_assessment_has_been_assigned_or_reassigned</fullName>
        <description>Impact assessment has been assigned (or reassigned)</description>
        <protected>false</protected>
        <recipients>
            <field>Assignee__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/TrackWise_Digital_Change_Control_Subject_Matter_Expert_SME_Assessment_Assi</template>
    </alerts>
</Workflow>
