<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>Cancel All Open CC IAs</label>
    <protected>false</protected>
    <values>
        <field>Bypass_Validation_Rule__c</field>
        <value xsi:type="xsd:boolean">true</value>
    </values>
    <values>
        <field>Child_Object_API_Name__c</field>
        <value xsi:type="xsd:string">Impact_Assessment__c</value>
    </values>
    <values>
        <field>Child_Workflow_Status__c</field>
        <value xsi:type="xsd:string">Open</value>
    </values>
    <values>
        <field>Parent_Field_API_Name__c</field>
        <value xsi:type="xsd:string">Change_Control__c</value>
    </values>
    <values>
        <field>Parent_Object_API_Name__c</field>
        <value xsi:type="xsd:string">CMPL123QMS__Change_Control__c</value>
    </values>
    <values>
        <field>Parent_Workflow_Status__c</field>
        <value xsi:type="xsd:string">Closed - Canceled</value>
    </values>
    <values>
        <field>X123_Task_Key_Value__c</field>
        <value xsi:type="xsd:string">CancelOpenIA</value>
    </values>
</CustomMetadata>
