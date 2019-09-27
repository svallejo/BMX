/**
*  --------------------------------------------------------------------------------------------------------------------------------------
* @Who   : Copyright (c) 2017 - 2019  Sparta Systems, Inc.
* @What  : CreateAllChildSchedulableBatch
* @Why   : 
* @When  : 09-May-2019
  
*  --------------------------------------------------------------------------------------------------------------------------------------
*  Modification Log:  
*  --------------------------------------------------------------------------------------------------------------------------------------
*   Developer                Date             Description 
*  --------------------------------------------------------------------------------------------------------------------------------------
*                        09-May-2019         Created.
*  --------------------------------------------------------------------------------------------------------------------------------------
**/

global class CreateAllChildSchedulableBatch implements Schedulable,Database.AllowsCallouts{   

/**
* @Method       : execute
* @Invoke       : 
* @Description  : Method to query all the external case records created/updated in last 24 hours in CRM and passing those records
*                 to the CreateComplaintForCaseBatch batch class for processing.
* @Return       : N/A
* @Params       : 
**/ 
 
    global void execute(SchedulableContext sc) { 
        
        // querying the external Case records which are created/updated in last 24 hours 
        DateTime latestTimeStamp = Complaint_Creation_Batch_Time__c.getInstance().Batch_Completion_Time__c;

        Integer count = [SELECT Count() FROM Case__x WHERE LastModifiedDate__c >=: latestTimeStamp];
        String formattedTime = latestTimeStamp.formatGMT('yyyy-MM-dd\'T\'HH:mm:ss.SSSZ');

        String query = 'SELECT Id, ExternalId FROM Case__x WHERE LastModifiedDate__c >= ' + formattedTime;

        Complaint_Creation_Batch_Time__c cst = [SELECT Id, Batch_Completion_Time__c FROM Complaint_Creation_Batch_Time__c LIMIT 1];
        cst.Batch_Completion_Time__c = System.now();
        update cst;
        /**String query = 'SELECT Id, ExternalId, BatchExpDate_c__c,SerialNumberAsset_c__c,Reason__c,ATC_c__c,BatchNumber_c__c,UDI_Code_c__c,
        CaseNumber__c,FirstL2EscalationDate_c__c,DueDate_c__c,CVM_c__c,ClosedDate__c,CustomerContactDate_c__c,Product_c__c, SofwareVersion_c__c,
        CurrentLevel_c__c,ContactEmail__c,isCreatedOnSite_c__c,ContactPhone__c,CatalogProfile_c__c,CaseHasWO_c__c,BatchNumberUnknown_c__c,CreatedDate__c,
        BatchNumberStatus_c__c,WasEscalated_c__c,Type__c,SubOrigin_c__c,SIGcode_c__c,Subject__c,ShiptoLocationSapNumber_c__c,Status__c,SAPCustomerNumber_c__c,
        Priority__c,PRE5_c__c,PRE6_c__c,PRE4_c__c,PRE2P2_c__c,PRE3P2_c__c,PRE3_1_c__c,PRE1_c__c,PRE2_1_c__c,INVEST_c__c,Origin_c__c,PRE_YesNo_c__c,MaterialCode_c__c,
        Description_c__c,LastL2toL1DeescalationDate_c__c,SAPAssetNumber_c__c,LastATCSentDateTime_c__c,InvQ6_c__c,InvQ5_c__c,InvQ4_c__c,InvQ3_c__c,InvQ2_c__c,InvQ1_c__c,
        InvestSubmittedBy_c__c,IsInternalCase_c__c,FirstL2OwnershipTaken_c__c,AssetRecordType_c__c,LastL2EscalationDate_c__c,ContactId__c,EntitlementId__c,
        FunctionalLocation_c__c,LastModifiedById__c,ErrorCode_c__c,ANALYZE_c__c,SAMPLE_c__c,AssetId__c,ProductId__c,L1Owner_c__c,L2Owner_c__c,CreatedById__c,
        AccountId__c,ShipToLocation_c__c,SatisfactionCode_c__c,RESULT_c__c,NoInvestJustif_c__c,SoftwareCode_c__c,ActionCode_c__c,ParentId__c, OwnerId__c,
        LastModifiedDate__c,Case_First_Closed_Date_c__c,FixedOnPhone_c__c,GDPR_L1Q2_c__c,GDPR_L2Q2_c__c,GDPR_L1Q1_c__c,GDPR_L2Q1_c__c,RE_c__c,
        ShipToLocation_c__r.VisitorAddressId__c,TWD_Case_Owner_c__c,AccountId__r.Global_Reporting_Hierarchy_Level_3_c__c,AccountId__r.Global_Reporting_Hierarchy_Level_2_c__c,
        AccountId__r.Key_Account_Hierarchy_c__c,AccountId__r.Pricing_Hierarchy_2_c__c,AccountId__r.Pricing_Hierarchy_c__c,AccountId__r.Reporting_Hierarchy_c__c,
        AccountId__r.Global_Reporting_Hierarchy_Level_1_c__c,AccountId__r.RecordTypeId__c,TWD_Error_Code_c__c,TWD_No_Invest_Justification_c__c,TWD_Level_1_Owner_c__c,
        TWD_Level_2_Owner_c__c,TWD_Account_Name_c__c,TWD_Product_Name_c__c,TWD_Product_Reagent_or_BOM_c__c,TWD_Ship_to_location_c__c,(
        SELECT Id,CMPL123CME__CMPL123_WF_Status__c,CMPL123Task_Key_Value__c,BMX_Status__c,Visitor_City__c,Visitor_Street__c,BMX_Visitor_State__c,
        Visitor_Country__c, BMX_Case_Software_Version__c, BMX_Case_Software_Version_External__c,    BMX_Visitor_Address_Name__c,    
        Visitor_Address_Name__c,    BMX_Satisfaction_External__c,   BMX_Satisfaction__c,    BMX_SAMPLE_External__c, BMX_SAMPLE__c,  
        BMX_RESULT_External__c, BMX_RESULT__c,  BMX_Product_Name__c,    BMX_Product_External__c,    BMX_Case_Owner_Name__c, BMX_Case_Owner__c,
          BMX_No_Invest_Justification__c, BMX_No_Invest_Justification_External__c,    BMX_Case_Last_Modified_By__c,
             BMX_Case_Last_Modified_By_External__c,  BMX_Level_2_Owner_External__c,  BMX_Level_2_Owner__c,   
             BMX_Level_1_Owner_External__c,  BMX_Level_1_Owner__c,   BMX_System__c,  BMX_Asset_External__c,  BMX_Error_Code__c,  BMX_Error_Code_External__c, 
             BMX_Entitlement_External__c,    BMX_Entitlement_Name__c,    BMX_Case_Created_By__c, BMX_Created_By__c,  BMX_Contact_Name__c,    
             BMX_Contact_External__c,    BMX_Asset__c,   BMX_Assets_External__c, BMX_ANALYZE_External__c,    BMX_Analyze__c, BMX_Action_Code_External__c,   
              BMX_Action_Code__c, BMX_Global_reporting_hierarchy_Level_3__c,  BMX_Account_Record_Type__c, BMX_Global_reporting_hierarchy_Level_2__c,  
              BMX_Global_reporting_hierarchy_Level_4__c,  BMX_Account_Category__c,    BMX_Division__c,    BMX_Region__c,  BMX_Local_pricing_hierarchy_2__c,   
              BMX_Local_pricing_hierarchy__c, BMX_Local_reporting_hierarchy__c,   BMX_Account_Name__c,    BMX_Global_reporting_hierarchy_Level_1__c,  BMX_Market__c,  
              AccountId__c,   BMX_Subsidiary__c,  BMX_Account_Sub_category__c,    BMX_Activities__c,  Case_Has_WO__c, BMX_BatchNumberUnknown__c,  
              BMX_Catalog_Profile__c, BMX_GDPR_L1Q1__c,   BMX_ATC__c, BMX_LongDescription__c, BMX_PRE3P2__c,  BMX_InvQ5_User_Customer_impact_risk__c, 
              BMX_Origin__c,  BMX_InvQ4_Was_the_IFU_followed__c,  BMX_FixedOnPhone__c,    BMX_PRE__c, BMX_Case_External__c,   BMX_Subject__c, 
              BMX_PRE4_PatientHarmedTreatedIncorrectly__c,    BMX_UDI_Code__c,    BMX_Parent_Case_External__c,BMX_Case_Date_Time_Opened__c,   
              BMX_INVEST__c,  BMX_CaseNumber__c,  BMX_Contact_Email__c,   BMX_GDPR_L2Q2__c,   BMX_Created_On_Site__c, BMX_InvQ2_Is_the_Tech_Complaint_an_RE__c,   
              BMX_PRE2P2__c,  BMX_Case_Date_Time_Closed__c,   BMX_InvQ3_Open_Invest_exist_on_issue__c,    BMX_Current_Level__c,   BMX_PRE3_1_IndirectHarm_patient_reported__c,
          BMXLast_L2_to_L1_Deescalation_Date__c, BMX_Batch_Number_Reagent__c,    BMX_Case_Type__c,   BMX_Customer_Contact_Date_Time__c,
          BMX_Ship_to_Location_SAP_Number__c, BMX_SIG_Code__c,    BMX_Material_Code__c,   BMX_Last_L2_Escalation_Date__c, BMX_Was_Escalated_c__c,
          BMX_Internal_Case__c,   CMPL123CME__Date_Due__c,    BMX_SAP_Asset_Number__c,    BMX_First_L2_Ownership_Taken__c,    BMX_GDPR_L1Q2__c,
          BMX_Asset_Record_Type__c,   BMX_Serial_Number_Asset__c, BMX_Product_Code__c,    BMX_First_L2_Escalation_Date__c, 
          BMX_InvQ1_Any_Complaint_data_missing__c,    BMX_Parent_Case__c, BMX_InvestSubmittedBy__c,   BMX_Current_Sofware_version__c,
          BMX_Case_First_Closed_Date__c,  BMX_Batch_Number_Status__c, BMX_SAPCustomerNumber__c, 
          BMX_InvQ6_Trend_on_the_issue_acceptable__c, BMX_PRE1_Patient_or_operator_death__c,
          BMX_Priority__c,    BMX_LastModifiedDate__c,    BMX_Sub_Origin__c,  BMX_PRE2_1_Patient_or_operator_harmed__c,   
          BMX_Batch_Expiration_Date__c,   BMX_Contact_Phone__c,   BMX_GDPR_L2Q1__c,   BMX_CVM__c, BMX_PRE6_Reported_to_local_Reg_Authority__c,   
          BMX_PRE5_WrongResultsPRE_Guidance_014764__c,    BMX_Is_Reportable__c,   BMX_Last_ATC_Sent_Date__c,Visitor_Postal_Code__c FROM Complaints__r)
          FROM Case__x WHERE LastModifiedDate__c >=: latestTimeStamp  ORDER BY LastModifiedDate__c DESC';
        **/
        CreateComplaintForCaseBatch bc = new CreateComplaintForCaseBatch(query, count);
        Database.executeBatch(bc, 50);
    }  
}