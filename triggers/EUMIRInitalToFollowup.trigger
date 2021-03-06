trigger EUMIRInitalToFollowup on CMPL123CME__EU_MIR__c (after update) {
 
    Set<Id> eumirids=new Set<Id>();
    for(CMPL123CME__EU_MIR__c emuir :Trigger.new){   
       
        //if(emuir.CMPL123CME__Type_Of_Report__c == 'Initial' && trigger.oldmap.get(emuir.Id).CMPL123_WF_Status__c!=emuir.CMPL123_WF_Status__c && emuir.CMPL123_WF_Status__c == 'Closed-Submitted')
        if(emuir.CMPL123CME__Type_Of_Report__c == 'Initial' && emuir.CMPL123_WF_Status__c == 'Closed-Submitted')            
        {           
         eumirids.add(emuir.id);
        }
    }
    list<CMPL123CME__EU_MIR__c> EumirListinsert = new list<CMPL123CME__EU_MIR__c>();
    system.debug('MSR::eumirupdatemap@@@...'+eumirids);
    if(!eumirids.isEmpty()){
    
        List<CMPL123CME__EU_MIR__c> eumirrecords = [SELECT id,BMX_Local_Assessment__c,CMPL123CME__Author_Contact_Last_Name__c,CMPL123CME__Author_Contact_First_Name__c,CMPL123CME__Author_City_Name__c,CMPL123CME__Author_Address_Complement__c,CMPL123CME__B_Investigation_Type_Code_Choice_1__c,CMPL123CME__B_Investigation_Type_Code_Choice_2__c, CMPL123CME__B_Investigation_Type_Code_Choice_3__c   , CMPL123CME__B_Investigation_Type_Code_Choice_4__c, CMPL123CME__B_Investigation_Type_Code_Choice_5__c  ,CMPL123CME__B_Investigation_Type_Code_Choice_6__c,CMPL123CME__B_Investigation_Type_Code_Choice_7__c, CMPL123CME__B_Investigation_Type_Code_Choice_8__c,CMPL123CME__C_Investigation_Findings_Code_Choice_1__c,CMPL123CME__C_Investigation_Findings_Code_Choice_2__c,CMPL123CME__C_Investigation_Findings_Code_Choice_3__c,CMPL123CME__C_Investigation_Findings_Code_Choice_5__c,CMPL123CME__C_Investigation_Findings_Code_Choice_6__c,
        CMPL123CME__Device_Operator_At_Event_Other__c,CMPL123CME__Device_Operator_At_Event__c,CMPL123CME__Device_Has_Been_Placed_On_Market_Before__c,CMPL123CME__Description_Of_Device_Nomenclature_Text__c,CMPL123CME__Date_Of_Incident_From__c,CMPL123CME__Date_Of_Incident_To__c,CMPL123CME__Complaint__c,CMPL123CME__Current_Device_Location_Other__c,CMPL123CME__Current_Device_Location__c,CMPL123CME__Basic_UDI_DI__c,CMPL123CME__Classification_Of_Incident__c,CMPL123CME__Author_Single_Registration_Number_SRN__c,CMPL123CME__Author_Street_Number__c,CMPL123CME__Author_Street__c,CMPL123CME__Author_Country__c,CMPL123CME__Author_E_mail__c,CMPL123CME__Author_Phone__c,CMPL123CME__Author_Postcode__c,CMPL123CME__D_Investigation_Conclusion_Choice_1__c,CMPL123CME__D_Investigation_Conclusion_Choice_2__c,CMPL123CME__D_Investigation_Conclusion_Choice_3__c,CMPL123CME__D_Investigation_Conclusion_Choice_4__c,CMPL123CME__D_Investigation_Conclusion_Choice_5__c,
        CMPL123CME__Manufact_Street__c,CMPL123CME__Manufact_Organisation_Name__c,CMPL123CME__Manufact_Phone__c,CMPL123CME__Manufact_Postcode__c,CMPL123CME__Manufact_Single_Registration_Number_SRN__c,CMPL123CME__Manufact_Street_Number__c,CMPL123CME__Manufact_E_Mail__c,CMPL123CME__Manufact_Country__c,CMPL123CME__Manufact_Contact_Last_Name__c,CMPL123CME__Manufact_Address_Complement__c,CMPL123CME__Manufact_City_Name__c,CMPL123CME__Manufact_Contact_First_Name__c,CMPL123CME__MDR_Class_Type__c,CMPL123CME__Initial_Reporter_Contact_Last_Name__c,CMPL123CME__Initial_Reporter_Contact_First_Name__c,CMPL123CME__Initial_Actions_Taken_By_Manufacturer__c,CMPL123CME__Indicate_Year__c,CMPL123CME__Indicate_Month__c,CMPL123CME__IVDR_Class_Type__c,CMPL123CME__IVDR_Class__c,CMPL123CME__If_Initial_Reporter_Is_Other_Specify__c,CMPL123CME__IVDD_Class__c,CMPL123CME__IMDRF_Code_Missing__c,CMPL123CME__Device_Usage_Other__c,CMPL123CME__Device_Usage__c,
        CMPL123CME__Registered_Commercial_Name_Of_Company__c,CMPL123CME__Reference_Number_By_NCA__c,CMPL123CME__Reference_Number_By_Manufacturer__c,CMPL123CME__Recipient_Name_Of_NCA__c,CMPL123CME__Preliminary_Results_And_Conclusions__c,CMPL123CME__Please_Indicate_The_Date__c,CMPL123CME__Periodic_Summary_Report_PSR_ID__c,CMPL123CME__Patients_Prior_Health_Condition__c,CMPL123CME__Patient_Remedial_Action__c,CMPL123CME__Org_Name_Of_Authorised_Representative__c,CMPL123CME__Number_Of_Patients_Involved__c,CMPL123CME__NCA_S_Local_Reference_Number__c,CMPL123CME__NCA_S_Local_FSCA_Reference_Number__c,CMPL123CME__NB_ID_Number2__c,CMPL123CME__NB_Certificate_Number_1__c,CMPL123CME__NB_Certificate_Number_2__c,CMPL123CME__NB_ID_Number1__c,CMPL123CME__Medical_Device_Terminology_Other__c,CMPL123CME__Medical_Device_Terminology__c,CMPL123CME__Medical_Device_Nomenclature_Code__c,CMPL123CME__Manufacturer_S_Reference_Number__c,CMPL123CME__Manufacturer_S_FSCA_Reference_Number__c,
        CMPL123CME__Model__c,CMPL123CME__Date_Of_Submission__c,CMPL123CME__D_Investigation_Conclusion_Choice_6__c,CMPL123CME__Explain_Incident_If_IMDRF_Code_Missing__c,CMPL123CME__Years_At_Time_Of_Incident__c,CMPL123CME__Unit_Of_Use_UDI_DI__c,CMPL123CME__UDI_PI__c,CMPL123CME__UDI_DI__c,BMX_Due_Date__c,CMPL123CME__Type_Of_Report__c,CMPL123CME__Submitter_Street__c,CMPL123CME__Submitter_Street_Number__c,CMPL123CME__Submitter_Postcode__c,CMPL123CME__Submitter_Phone__c,CMPL123CME__Submitter_Of_Report__c,CMPL123CME__Submitter_E_Mail__c,CMPL123CME__Submitter_Country__c,CMPL123CME__Submitter_Contact_Last_Name__c,CMPL123CME__Submitter_Contact_First_Name__c,CMPL123CME__Submitter_City_Name__c,CMPL123CME__Submitter_Address_Complement__c,CMPL123CME__Specify_Other_Submitter__c,CMPL123CME__Software_Version__c,CMPL123CME__Role_Of_Initial_Reporter__c,CMPL123CME__Relevant_Associated_Devices__c,CMPL123CME__Relevant_Accessories_Used_With_Device__c,title__c FROM CMPL123CME__EU_MIR__C WHERE Id IN:eumirids];    
        
        for(CMPL123CME__EU_MIR__c emr:eumirrecords){
            
                CMPL123CME__EU_MIR__c mr= new CMPL123CME__EU_MIR__c();
                mr.Id= emr.Id;
                mr.BMX_Local_Assessment__c = emr.BMX_Local_Assessment__c;
                mr.CMPL123CME__Author_Address_Complement__c= emr.CMPL123CME__Author_Address_Complement__c;
                mr.CMPL123CME__Author_City_Name__c= emr.CMPL123CME__Author_City_Name__c;
                mr.CMPL123CME__Author_Contact_First_Name__c= emr.CMPL123CME__Author_Contact_First_Name__c;
                mr.CMPL123CME__Author_Contact_Last_Name__c  = emr.CMPL123CME__Author_Contact_Last_Name__c;
                mr.CMPL123CME__Author_Country__c  = emr.CMPL123CME__Author_Country__c;
                mr.CMPL123CME__Author_E_mail__c= emr.CMPL123CME__Author_E_mail__c;
                mr.CMPL123CME__Author_Phone__c   = emr.CMPL123CME__Author_Phone__c;
                mr.CMPL123CME__Author_Postcode__c= emr.CMPL123CME__Author_Postcode__c;
                mr.CMPL123CME__Author_Single_Registration_Number_SRN__c  = emr.CMPL123CME__Author_Single_Registration_Number_SRN__c ;
                mr.CMPL123CME__Author_Street_Number__c    = emr.CMPL123CME__Author_Street_Number__c ;
                mr.CMPL123CME__Author_Street__c   = emr.CMPL123CME__Author_Street__c ;
                mr.CMPL123CME__Basic_UDI_DI__c= emr.CMPL123CME__Basic_UDI_DI__c; 
                mr.CMPL123CME__Classification_Of_Incident__c   = emr.CMPL123CME__Classification_Of_Incident__c;
                mr.CMPL123CME__Complaint__c= emr.CMPL123CME__Complaint__c;
                mr.CMPL123CME__Current_Device_Location_Other__c  = emr.CMPL123CME__Current_Device_Location_Other__c;
                mr.CMPL123CME__Current_Device_Location__c = emr.CMPL123CME__Current_Device_Location__c ;
                mr.CMPL123CME__Date_Of_Incident_From__c   = emr.CMPL123CME__Date_Of_Incident_From__c;
                mr.CMPL123CME__Date_Of_Incident_To__c = emr.CMPL123CME__Date_Of_Incident_To__c ;
                mr.CMPL123CME__Description_Of_Device_Nomenclature_Text__c = emr.CMPL123CME__Description_Of_Device_Nomenclature_Text__c;
                mr.CMPL123CME__Device_Has_Been_Placed_On_Market_Before__c = emr.CMPL123CME__Device_Has_Been_Placed_On_Market_Before__c;
                mr.CMPL123CME__Device_Operator_At_Event_Other__c  = emr.CMPL123CME__Device_Operator_At_Event_Other__c ;
                mr.CMPL123CME__Device_Operator_At_Event__c    = emr.CMPL123CME__Device_Operator_At_Event__c;
                mr.CMPL123CME__Device_Usage_Other__c  = emr.CMPL123CME__Device_Usage_Other__c ;
                mr.CMPL123CME__Device_Usage__c    = emr.CMPL123CME__Device_Usage__c;
                mr.CMPL123CME__Explain_Incident_If_IMDRF_Code_Missing__c= emr.CMPL123CME__Explain_Incident_If_IMDRF_Code_Missing__c;
                mr.CMPL123CME__IMDRF_Code_Missing__c    = emr.CMPL123CME__IMDRF_Code_Missing__c;
                mr.CMPL123CME__IVDD_Class__c  = emr.CMPL123CME__IVDD_Class__c ;
                mr.CMPL123CME__IVDR_Class_Type__c = emr.CMPL123CME__IVDR_Class_Type__c;
                mr.CMPL123CME__IVDR_Class__c  = emr.CMPL123CME__IVDR_Class__c;
                mr.CMPL123CME__Date_Of_Submission__c = emr.CMPL123CME__Date_Of_Submission__c;
                mr.CMPL123CME__If_Initial_Reporter_Is_Other_Specify__c= emr.CMPL123CME__If_Initial_Reporter_Is_Other_Specify__c;
                mr.CMPL123CME__Indicate_Month__c  = emr.CMPL123CME__Indicate_Month__c;
                mr.CMPL123CME__Indicate_Year__c   = emr.CMPL123CME__Indicate_Year__c;
                mr.CMPL123CME__Initial_Actions_Taken_By_Manufacturer__c= emr.CMPL123CME__Initial_Actions_Taken_By_Manufacturer__c;
                mr.CMPL123CME__Author_Address_Complement__c = emr.CMPL123CME__Author_Address_Complement__c;
                mr.CMPL123CME__Initial_Reporter_Contact_First_Name__c = emr.CMPL123CME__Initial_Reporter_Contact_First_Name__c;
                mr.CMPL123CME__Initial_Reporter_Contact_Last_Name__c= emr.CMPL123CME__Initial_Reporter_Contact_Last_Name__c;
                mr.CMPL123CME__Author_Street_Number__c  = emr.CMPL123CME__Author_Street_Number__c;
                mr.CMPL123CME__MDR_Class_Type__c  = emr.CMPL123CME__MDR_Class_Type__c;
                mr.CMPL123CME__Manufact_Address_Complement__c = emr.CMPL123CME__Manufact_Address_Complement__c;
                mr.CMPL123CME__Manufact_City_Name__c  = emr.CMPL123CME__Manufact_City_Name__c;
                mr.CMPL123CME__Manufact_Contact_First_Name__c = emr.CMPL123CME__Manufact_Contact_First_Name__c;
                mr.CMPL123CME__Manufact_Contact_Last_Name__c  = emr.CMPL123CME__Manufact_Contact_Last_Name__c;
                mr.CMPL123CME__Manufact_Country__c    = emr.CMPL123CME__Manufact_Country__c ;
                mr.CMPL123CME__Manufact_E_Mail__c = emr.CMPL123CME__Manufact_E_Mail__c;
                mr.CMPL123CME__Manufact_Organisation_Name__c  = emr.CMPL123CME__Manufact_Organisation_Name__c;
                mr.CMPL123CME__Manufact_Phone__c  = emr.CMPL123CME__Manufact_Phone__c ;
                mr.CMPL123CME__Manufact_Postcode__c   = emr.CMPL123CME__Manufact_Postcode__c ;
                mr.CMPL123CME__Manufact_Single_Registration_Number_SRN__c = emr.CMPL123CME__Manufact_Single_Registration_Number_SRN__c;
                mr.CMPL123CME__Manufact_Street_Number__c  = emr.CMPL123CME__Manufact_Street_Number__c ;
                mr.CMPL123CME__Manufact_Street__c = emr.CMPL123CME__Manufact_Street__c ;
                mr.CMPL123CME__Manufacturer_S_FSCA_Reference_Number__c = emr.CMPL123CME__Manufacturer_S_FSCA_Reference_Number__c ;
                mr.CMPL123CME__Manufacturer_S_Reference_Number__c = emr.CMPL123CME__Manufacturer_S_Reference_Number__c;
                mr.CMPL123CME__Medical_Device_Nomenclature_Code__c    = emr.CMPL123CME__Medical_Device_Nomenclature_Code__c  ;
                mr.CMPL123CME__Medical_Device_Terminology_Other__c = emr.CMPL123CME__Medical_Device_Terminology_Other__c;
                mr.CMPL123CME__Medical_Device_Terminology__c  = emr.CMPL123CME__Medical_Device_Terminology__c ;
                mr.CMPL123CME__Model__c= emr.CMPL123CME__Model__c;
                mr.CMPL123CME__NB_Certificate_Number_1__c    = emr.CMPL123CME__NB_Certificate_Number_1__c;
                mr.CMPL123CME__NB_Certificate_Number_2__c = emr.CMPL123CME__NB_Certificate_Number_2__c;
                mr.CMPL123CME__NB_ID_Number1__c= emr.CMPL123CME__NB_ID_Number1__c;
                mr.CMPL123CME__NB_ID_Number2__c = emr.CMPL123CME__NB_ID_Number2__c;
                mr.CMPL123CME__NCA_S_Local_FSCA_Reference_Number__c   = emr.CMPL123CME__NCA_S_Local_FSCA_Reference_Number__c ;
                mr.CMPL123CME__NCA_S_Local_Reference_Number__c = emr.CMPL123CME__NCA_S_Local_Reference_Number__c ;
                mr.CMPL123CME__Number_Of_Patients_Involved__c = emr.CMPL123CME__Number_Of_Patients_Involved__c ;
                mr.CMPL123CME__Org_Name_Of_Authorised_Representative__c   = emr.CMPL123CME__Org_Name_Of_Authorised_Representative__c ;
                mr.CMPL123CME__Patient_Remedial_Action__c = emr.CMPL123CME__Patient_Remedial_Action__c ;
                mr.CMPL123CME__Patients_Prior_Health_Condition__c    = emr.CMPL123CME__Patients_Prior_Health_Condition__c;
                mr.CMPL123CME__Periodic_Summary_Report_PSR_ID__c = emr.CMPL123CME__Periodic_Summary_Report_PSR_ID__c;
                mr.CMPL123CME__Please_Indicate_The_Date__c= emr.CMPL123CME__Please_Indicate_The_Date__c;
                mr.CMPL123CME__Preliminary_Results_And_Conclusions__c   = emr.CMPL123CME__Preliminary_Results_And_Conclusions__c;
                mr.CMPL123CME__Recipient_Name_Of_NCA__c  = emr.CMPL123CME__Recipient_Name_Of_NCA__c ;
                mr.CMPL123CME__Reference_Number_By_Manufacturer__c   = emr.CMPL123CME__Reference_Number_By_Manufacturer__c;
                mr.CMPL123CME__Reference_Number_By_NCA__c = emr.CMPL123CME__Reference_Number_By_NCA__c;
                mr.CMPL123CME__Registered_Commercial_Name_Of_Company__c  = emr.CMPL123CME__Registered_Commercial_Name_Of_Company__c ;
                mr.CMPL123CME__Relevant_Accessories_Used_With_Device__c  = emr.CMPL123CME__Relevant_Accessories_Used_With_Device__c;
                mr.CMPL123CME__Relevant_Associated_Devices__c    = emr.CMPL123CME__Relevant_Associated_Devices__c;
                mr.CMPL123CME__Role_Of_Initial_Reporter__c   = emr.CMPL123CME__Role_Of_Initial_Reporter__c;
                mr.CMPL123CME__Software_Version__c= emr.CMPL123CME__Software_Version__c;
                mr.CMPL123CME__Specify_Other_Submitter__c   = emr.CMPL123CME__Specify_Other_Submitter__c; 
                mr.CMPL123CME__Submitter_Address_Complement__c   = emr.CMPL123CME__Submitter_Address_Complement__c;
                mr.CMPL123CME__Submitter_City_Name__c = emr.CMPL123CME__Submitter_City_Name__c;
                mr.CMPL123CME__Submitter_Contact_First_Name__c= emr.CMPL123CME__Submitter_Contact_First_Name__c;
                mr.CMPL123CME__Submitter_Contact_Last_Name__c= emr.CMPL123CME__Submitter_Contact_Last_Name__c;
                mr.CMPL123CME__Submitter_Country__c= emr.CMPL123CME__Submitter_Country__c;
                mr.CMPL123CME__Submitter_E_Mail__c= emr.CMPL123CME__Submitter_E_Mail__c;
                mr.CMPL123CME__Submitter_Of_Report__c = emr.CMPL123CME__Submitter_Of_Report__c;
                mr.CMPL123CME__Submitter_Phone__c = emr.CMPL123CME__Submitter_Phone__c; 
                mr.CMPL123CME__Submitter_Postcode__c= emr.CMPL123CME__Submitter_Postcode__c;
                mr.CMPL123CME__Submitter_Street_Number__c = emr.CMPL123CME__Submitter_Street_Number__c;
                mr.CMPL123CME__Submitter_Street__c= emr.CMPL123CME__Submitter_Street__c;
                mr.CMPL123CME__Type_Of_Report__c    = 'Follow up';
                mr.BMX_Due_Date__c = emr.BMX_Due_Date__c;
                mr.CMPL123CME__Date_Of_Submission__c= emr.CMPL123CME__Date_Of_Submission__c;
                mr.CMPL123CME__UDI_DI__c= emr.CMPL123CME__UDI_DI__c;
                mr.CMPL123CME__UDI_PI__c  = emr.CMPL123CME__UDI_PI__c;
                mr.CMPL123CME__Unit_Of_Use_UDI_DI__c = emr.CMPL123CME__Unit_Of_Use_UDI_DI__c;
                mr.CMPL123CME__Years_At_Time_Of_Incident__c = emr.CMPL123CME__Years_At_Time_Of_Incident__c; 
                mr.Title__c = emr.Title__c ;
                EumirListinsert.add(mr);
        }
    }
    if(EumirListinsert.size()>0){
        insert EumirListinsert;
    }
}