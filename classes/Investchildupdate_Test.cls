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
        invest.BMX_Expert_Investigator__c='testing';
      
        Insert Invest;
  }
    

}