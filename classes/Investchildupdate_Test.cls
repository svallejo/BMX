@isTest
private class Investchildupdate_Test {
       
  public static testmethod void myTest() 
  {
      // User initialization
        Profile p = [select id from profile where name='Standard User'];

        User u = new User(alias = 'utest', email='utest@email.com',
            emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
            localesidkey='en_US', profileid = p.Id, country='United States',
            timezonesidkey='America/Los_Angeles', username='utest123@email.com');
    insert u;
      
    CMPL123CME__Complaint__c cmplnt = new CMPL123CME__Complaint__c();
    insert cmplnt;
      
      CMPL123CME__EU_MIR__c eu= new CMPL123CME__EU_MIR__c();
        eu.CMPL123CME__Complaint__c=cmplnt.Id;
        eu.CMPL123CME__Type_Of_Report__c='Initial';
        eu.CMPL123CME__Author_Address_Complement__c='My Address';
        eu.CMPL123CME__Author_City_Name__c='Marcy- l’Etoile';
        eu.CMPL123CME__Author_Contact_First_Name__c='Sophie';
        eu.CMPL123CME__Author_Contact_Last_Name__c='BOBIN-DUBREUX';
        eu.CMPL123CME__Author_Country__c='France';
        eu.CMPL123CME__Author_E_mail__c='sophie.bobin-dubreux@biomerieux.com';
        eu.CMPL123CME__Author_Phone__c='+(33) 4 78 87 70 66';
        eu.CMPL123CME__Author_Postcode__c='69280';
        eu.CMPL123CME__Author_Single_Registration_Number_SRN__c='64';
        eu.CMPL123CME__Author_Street_Number__c='12345';
        eu.CMPL123CME__Author_Street__c='Allée Louis Pasteur';
        eu.CMPL123CME__Basic_UDI_DI__c='UDI deviceEudamed';
        eu.CMPL123CME__Classification_Of_Incident__c='Test';
        eu.CMPL123CME__Current_Device_Location_Other__c='Testing Device';
        eu.CMPL123CME__Current_Device_Location__c='Healthcare facility/carer';
        eu.CMPL123CME__Date_Of_Incident_From__c=system.today()+10;
        eu.CMPL123CME__Date_Of_Incident_To__c=System.today()+20;
        eu.CMPL123CME__Description_Of_Device_Nomenclature_Text__c='Description of device/Nomenclature text';
        eu.CMPL123CME__Device_Usage__c='Initial use';
        eu.CMPL123CME__Date_Of_Submission__c=System.today()+5;
        eu.CMPL123CME__Initial_Actions_Taken_By_Manufacturer__c='List down further investigations pla';
        eu.CMPL123CME__Initial_Reporter_Contact_First_Name__c='Sophie';
        eu.CMPL123CME__Initial_Reporter_Contact_Last_Name__c='BOBIN-DUBREUX';
        eu.CMPL123CME__Manufact_City_Name__c='Marcy- l’Etoile';
        eu.CMPL123CME__Manufact_Contact_First_Name__c='Sophie';
        eu.CMPL123CME__Manufact_Contact_Last_Name__c='BOBIN-DUBREUX';
        eu.CMPL123CME__Manufact_Country__c='France';
        eu.CMPL123CME__Manufact_E_Mail__c='sophie.bobin-dubreux@biomerieux.com';
        eu.CMPL123CME__Manufact_Organisation_Name__c='bioMérieux SA';
        eu.CMPL123CME__Manufact_Phone__c='123456789';
        eu.CMPL123CME__Manufact_Postcode__c='69280';
        eu.CMPL123CME__Manufact_Single_Registration_Number_SRN__c='64';
        eu.CMPL123CME__Manufact_Street_Number__c='110';
        eu.CMPL123CME__Manufact_Street__c='Allée Louis Pasteur';
        eu.CMPL123CME__Manufacturer_S_FSCA_Reference_Number__c='53543';
        eu.CMPL123CME__Manufacturer_S_Reference_Number__c='23432424';
        eu.CMPL123CME__Medical_Device_Nomenclature_Code__c='wwww';
        eu.CMPL123CME__Medical_Device_Terminology_Other__c='test';
        eu.CMPL123CME__Medical_Device_Terminology__c='EMDN';
        eu.CMPL123CME__NCA_S_Local_FSCA_Reference_Number__c='233535';
        eu.CMPL123CME__NCA_S_Local_Reference_Number__c='32234234';
        eu.CMPL123CME__Org_Name_Of_Authorised_Representative__c='bioMérieux SA';
        eu.CMPL123CME__Patient_Remedial_Action__c='Test';
        eu.CMPL123CME__Periodic_Summary_Report_PSR_ID__c='Testing';
        eu.CMPL123CME__Please_Indicate_The_Date__c= 'First declaration of conformity';
        eu.CMPL123CME__Preliminary_Results_And_Conclusions__c='List down further investigations pla';
        eu.CMPL123CME__Recipient_Name_Of_NCA__c='[ANSM] - Agence nationale deuits de santé';
        eu.CMPL123CME__Reference_Number_By_Manufacturer__c='CN-014146';
        eu.CMPL123CME__Reference_Number_By_NCA__c='Reference number by N';
        eu.CMPL123CME__Registered_Commercial_Name_Of_Company__c='bioMérieux SA';
        eu.CMPL123CME__Role_Of_Initial_Reporter__c='Healthcare professional';
        eu.CMPL123CME__Specify_Other_Submitter__c='Testing';
        eu.CMPL123CME__Submitter_City_Name__c='Craponne';
        eu.CMPL123CME__Submitter_Contact_First_Name__c='Sophie';
        eu.CMPL123CME__Submitter_Contact_Last_Name__c='BOBIN-DUBREUX';
        eu.CMPL123CME__Submitter_Country__c='France';
        eu.CMPL123CME__Submitter_E_Mail__c='sophie.bobin-dubreux@biomerieux.com';
        eu.CMPL123CME__Submitter_Of_Report__c='Manufacturer';
        eu.CMPL123CME__Submitter_Phone__c='12347';
        eu.CMPL123CME__Submitter_Postcode__c='69280';
        eu.CMPL123CME__Submitter_Street_Number__c='110';
        eu.CMPL123CME__Submitter_Street__c='Allée Louis Pasteur';
        eu.BMX_Due_Date__c=System.today()+10;
        eu.CMPL123CME__Date_Of_Submission__c=system.today()+5;
        eu.CMPL123CME__UDI_DI__c='UDI device identifier/Eudamed';
        eu.CMPL123CME__UDI_PI__c='UDI device identifier/Eudamed';
        eu.CMPL123CME__Unit_Of_Use_UDI_DI__c='UDI device identifier/Eudamed';
        eu.CMPL123CME__Years_At_Time_Of_Incident__c=10;
        eu.Title__c='Test Followup';
        Insert eu;
      
        CMPL123CME__Investigation__c Invest=new CMPL123CME__Investigation__c();
        Invest.Name='TWD TestInvestigation';
		Invest.BMX_Investigation_Approver__c=u.id;        
        Invest.CMPL123CME__Complaint__c=cmplnt.Id;
        invest.BMX_Product_Returned__c='Product Return Requested';
      	invest.BMX_Date_Product_Received__c=system.today()+15;
        invest.BMX_Return_Comments__c='Test';
        invest.BMX_Is_there_a_trend__c='Yes';
      	invest.CMPL123_WF_Status__c='Opened';
      	invest.BMX_Evidence_of_Trend__c='testing';
        invest.BMX_Containment_Correction_Action__c='Testing';
        invest.BMX_Investigation_Details__c='my Test';
      	invest.BMX_Impact_Analysis__c='my Test';
        invest.BMX_Expert_Investigator__c=u.id;
        invest.B_Investigation_Type_Code_Choice_1__c='B01 - Testing of Actual/Suspected Device';
        invest.EU_MIR__c=eu.id;
      
        Insert Invest;
        
      
        invest.CMPL123_WF_Status__c='Closed - Done';
        invest.B_Investigation_Type_Code_Choice_1__c='B01 - Testing of Actual/Suspected Device';
        invest.B_Investigation_Type_Code_Choice_2__c='B02 - Testing of Device from Same Lot/Batch Retained by Manufacturer';
        invest.B_Investigation_Type_Code_Choice_3__c='B03 - Testing of Device from Same Lot/Batch Returned from User';
      	invest.B_Investigation_Type_Code_Choice_4__c='B04 - Testing of Device from Other Lot/Batch Retained by Manufacturer';
        invest.B_Investigation_Type_Code_Choice_5__c='B04 - Testing of Device from Other Lot/Batch Retained by Manufacturer';
       	invest.B_Investigation_Type_Code_Choice_6__c='B06 - Testing of Model Variant';
      
       	invest.Justification_for_Annex_B__c='B-Test';
      	invest.Justification_for_Annex_C__c='C-Test';
      	invest.Justification_for_Annex_D__c='D-Test';
        invest.BMX_Investigation_Answer__c='Investigation asnwers';
        
        
           
        CMPL123CME__EU_MIR_Code__c Code=new CMPL123CME__EU_MIR_Code__c();
        code.CMPL123CME__Name__c='Testing of Device';
        code.Name='B02';
        code.CMPL123CME__Code_Type__c='B-Investigation Type Code';
        code.CMPL123CME__Inactive__c=FALSE;
        Insert code;
      
        invest.D_Investigation_Conclusion_Choice1__c=Code.Id;
      	invest.D_Investigation_Conclusion_Choice2__c=Code.Id;
        invest.D_Investigation_Conclusion_Choice3__c=COde.Id;
      
      	CMPL123CME__EU_MIR_Code__c Code1=new CMPL123CME__EU_MIR_Code__c();
        Code1.CMPL123CME__Name__c='Testing of Device';
        Code1.Name='C010202';
        Code1.CMPL123CME__Code_Type__c='C-Investigation Findings Code';
        code1.CMPL123CME__Inactive__c=FALSE;
        Insert Code1;
      
        invest.C_Investigation_Findings_Code_Choice1__c=Code1.Id;
      	invest.C_Investigation_Findings_Code_Choice2__c=Code1.Id;
      	invest.C_Investigation_Findings_Code_Choice3__c=Code1.Id;
        
      	update invest;
        
            
        CMPL123CME__EU_MIR_Code_Choices__c Codech=new CMPL123CME__EU_MIR_Code_Choices__c();
        Codech.Name='B-Investigation Type Code - Choice1 - B02';
        Codech.CMPL123CME__Choice__c='Choice 1';
        Codech.CMPL123CME__Related_EU_MIR__c=eu.Id;
        Codech.CMPL123CME__Related_EU_MIR_Code__c=Code.Id;
        Insert Codech;
      
        CMPL123CME__EU_MIR_Code_Choices__c Codech1=new CMPL123CME__EU_MIR_Code_Choices__c();
        Codech1.Name='C-Investigation Type Code - Choice1 - C010202';
        Codech1.CMPL123CME__Choice__c='Choice 1';
        Codech1.CMPL123CME__Related_EU_MIR__c=eu.Id;
        Codech1.CMPL123CME__Related_EU_MIR_Code__c=Code1.Id;
        Insert Codech1;
      
        
        
      
      	List<Investchildupdate.InvestWrapper> wrpclslist= new List<Investchildupdate.InvestWrapper>();
      	Investchildupdate.InvestWrapper wrpcls= new Investchildupdate.InvestWrapper();
      	wrpcls.ParentId=invest.Id;
      	wrpclslist.add(wrpcls);
      	Investchildupdate.doProcessActions(wrpclslist);
      
      
  }
    

}