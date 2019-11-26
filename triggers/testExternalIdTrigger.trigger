trigger testExternalIdTrigger on CMPL123CME__Complaint__c (before insert) {
    for (CMPL123CME__Complaint__c complaint: Trigger.New ){
        System.debug('AccountId__c: ' + complaint.AccountId__c);
        System.debug('BMX_Action_Code_External__c: ' + complaint.BMX_Action_Code_External__c);
        System.debug('BMX_ANALYZE_External__c: ' + complaint.BMX_ANALYZE_External__c);
        System.debug('BMX_Assets_External__c: ' + complaint.BMX_Assets_External__c);
        System.debug('BMX_Case_Created_By__c: ' + complaint.BMX_Case_Created_By__c);
        System.debug('BMX_Case_External__c: ' + complaint.BMX_Case_External__c);
        System.debug('BMX_Case_External_Id__c: ' + complaint.BMX_Case_External_Id__c);
        System.debug('BMX_Case_Owner_Name__c: ' + complaint.BMX_Case_Owner_Name__c);
        System.debug('BMX_Case_Software_Version_External__c: ' + complaint.BMX_Case_Software_Version_External__c);
        System.debug('BMX_Contact_External__c: ' + complaint.BMX_Contact_External__c);
        System.debug('BMX_Entitlement_External__c: ' + complaint.BMX_Entitlement_External__c);
        System.debug('BMX_Error_Code_External__c: ' + complaint.BMX_Error_Code_External__c);
        System.debug('Justification_Decision_Maker__c: ' + complaint.Justification_Decision_Maker__c);
        System.debug('BMX_Case_Last_Modified_By_External__c: ' + complaint.BMX_Case_Last_Modified_By_External__c);
        System.debug('BMX_Level_1_Owner_External__c: ' + complaint.BMX_Level_1_Owner_External__c);
        System.debug('BMX_Level_2_Owner_External__c: ' + complaint.BMX_Level_2_Owner_External__c);
        System.debug('BMX_No_Invest_Justification_External__c: ' + complaint.BMX_No_Invest_Justification_External__c);
        System.debug('BMX_Parent_Case_External__c: ' + complaint.BMX_Parent_Case_External__c);
        System.debug('BMX_Product_External__c: ' + complaint.BMX_Product_External__c);
        System.debug('BMX_RESULT_External__c: ' + complaint.BMX_RESULT_External__c);
        System.debug('BMX_SAMPLE_External__c: ' + complaint.BMX_SAMPLE_External__c);
        System.debug('BMX_Satisfaction_External__c: ' + complaint.BMX_Satisfaction_External__c);
        System.debug('BMX_Asset_External__c: ' + complaint.BMX_Asset_External__c);
        System.debug('BMX_Visitor_Address_Name__c: ' + complaint.BMX_Visitor_Address_Name__c);
    }

}