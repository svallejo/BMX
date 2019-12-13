<?xml version="1.0" encoding="utf-8"?><Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>CRB_Quality_Approver_Email_Alert</fullName>
        <description>CRB Quality Approver Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>CRB_Approver_1__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>CRB_Approver_2__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>CRB_Approver_3__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>CRB_Approver_4__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>CRB_Approver_5__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CRB_Quality_Approver_Email_Notification</template>
    </alerts>
    <alerts>
        <fullName>Change_Request_Canceled</fullName>
        <description>Change Request Canceled</description>
        <protected>false</protected>
        <recipients>
            <field>Originator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Change_Request_Canceled</template>
    </alerts>
    <alerts>
        <fullName>Quality_Approver_Email</fullName>
        <description>Quality Approver Email</description>
        <protected>false</protected>
        <recipients>
            <field>Quality_Approver__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Quality_Approver_CC_Custom</template>
    </alerts>
    <alerts>
        <fullName>Workflow_Rejected_Change_Control</fullName>
        <description>Workflow Rejected Change Control</description>
        <protected>false</protected>
        <recipients>
            <field>Change_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Originator__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Quality_Approver__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Change_Request_Rejected</template>
    </alerts>
    <alerts>
        <fullName>External_Customer_Impacted</fullName>
        <description>External Customer Impacted</description>
        <protected>false</protected>
        <recipients>
            <field>External_Responsible_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Quality_Approver__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/External_Customer_Impacted</template>
    </alerts>
    <alerts>
        <fullName>Internal_Customer_Impacted</fullName>
        <description>Internal Customer Impacted</description>
        <protected>false</protected>
        <recipients>
            <field>Internal_Mfg_Site_Responsible_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Internal_Sub_Responsible_Person__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Quality_Approver__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Internal_Customer_Impacted</template>
    </alerts>
    <alerts>
        <fullName>Release_Approver_Optional_Approver_Notification</fullName>
        <description>Release Approver Optional Approver Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Release_Approver_1__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Release_Approver_2__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Release_Approver_3__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Release_Approver_4__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Release_Approver_5__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Release_Approver_6__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Release_Approver_Email_Notification</template>
    </alerts>
    <alerts>
        <fullName>Release_Approver_QA_Approver_Notfication</fullName>
        <description>Release Approver QA Approver Notfication</description>
        <protected>false</protected>
        <recipients>
            <field>Release_QA_Approver__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Release_Approver_Email_Notification</template>
    </alerts>
    <alerts>
        <fullName>Final_QA_Approver_email_notification</fullName>
        <description>Final QA Approver email notification</description>
        <protected>false</protected>
        <recipients>
            <field>CMPL123QMS__QA_Contact__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Final_Approver_Email_Notification</template>
    </alerts>
    <alerts>
        <fullName>Final_optional_Approver_email_notification</fullName>
        <description>Final optional Approver email notification</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_To__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>CMPL123QMS__Main_Contact__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>CMPL123QMS__Management_Approved_By__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>CMPL123QMS__Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Quality_Contact__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Supervisor_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Final_Approver_Email_Notification</template>
    </alerts>
    <alerts>
        <fullName>Change_Request_Closed_Unsuccessful</fullName>
        <description>Change Request Closed Unsuccessful</description>
        <protected>false</protected>
        <recipients>
            <field>Change_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/TrackWise_Digital_Change_Control_Change_Request_Closed_Unsuccessful</template>
    </alerts>
    <fieldUpdates>
        <fullName>Set_Change_Control_Review_Flag</fullName>
        <field>Change_Control_Review_Completed__c</field>
        <literalValue>1</literalValue>
        <name>Set Change Control	Review Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Record_type_to_editabl</fullName>
        <field>RecordTypeId</field>
        <lookupValue>CC_Custom</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change Record type to editabl</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_record_to_Read_Only</fullName>
        <field>RecordTypeId</field>
        <lookupValue>CC_Custom_Read_Only</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change record to Read Only</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Change Control%09Review Flag</fullName>
        <actions>
            <name>Set_Change_Control_Review_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123QMS__Change_Control__c.Change_Control_Review_Completed__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>CMPL123QMS__Change_Control__c.CMPL123_WF_Action__c</field>
            <operation>equals</operation>
            <value>Complete Review - Change Control</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Change Record to Editable</fullName>
        <actions>
            <name>Change_Record_type_to_editabl</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123QMS__Change_Control__c.CMPL123_WF_Status__c</field>
            <operation>equals</operation>
            <value>Open</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Change To Read Only</fullName>
        <actions>
            <name>Change_record_to_Read_Only</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CMPL123QMS__Change_Control__c.CMPL123_WF_Status__c</field>
            <operation>equals</operation>
            <value>Pending CRB Team Review</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
