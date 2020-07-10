trigger Update_EUMIR_Support_Data on CMPL123CME__EU_MIR__c (after insert) {
    
    Set<String> Manufacturer=new Set<String>();
    Set<String> Authorized = new set<String>();
   
   // List <EUMIR_support__c>Manufacturerupdate = new list <EUMIR_support__c> ();
    // List <EUMIR_support__c> Authorizedupdate = new list <EUMIR_support__c> ();
      List <CMPL123CME__EU_MIR__c> update1 = new list <CMPL123CME__EU_MIR__c> ();
    CMPL123CME__EU_MIR__c man= new CMPL123CME__EU_MIR__c();
     for(CMPL123CME__EU_MIR__c eumirinsert: Trigger.new){
        Manufacturer.add(eumirinsert.Manufacturer_Organisation_name__c);
        Authorized.add(eumirinsert.Org_Name_of_Authorised_Representative__c);
     }
    
    if (Manufacturer.contains('bioMérieux SA'))
    {
        //List <EUMIR_support__c> M1=new List<EUMIR_support__c>();
        
       EUMIR_support__c M2= [ Select Contact_first_Name__c,Contact_last_name__c,City_Name__c,Country__c,E_mail__c,Phone__c,
       Postal_Code__c  ,Street__c,Street_number__c from EUMIR_support__c where organisation_Name__c = 'bioMérieux SA' AND
       Type__c = 'Manufacturer'];
       
       
      For(CMPL123CME__EU_MIR__c supp:Trigger.new)
      {
         CMPL123CME__EU_MIR__c EUMIR = new CMPL123CME__EU_MIR__c ();
         EUMIR.CMPL123CME__Manufact_Contact_First_Name__c=M2.Contact_first_Name__c;
      }
        
    }
    else if (Manufacturer.contains('bioMérieux Inc'))
    {
         List <EUMIR_support__c> M2=[ Select 
Contact_first_Name__c,Contact_last_name__c,City_Name__c,Country__c,E_mail__c,Phone__c,
Postal_Code__c  ,Street__c,Street_number__c from EUMIR_support__c where organisation_Name__c = 'bioMérieux Inc' and Type__c = 'Manufacturer'];
       
    }
    
    if (Authorized.contains('bioMérieux SA'))
    {
      List <EUMIR_support__c> M3=[ Select 
Contact_first_Name__c,Contact_last_name__c,City_Name__c,Country__c,E_mail__c,Phone__c,
Postal_Code__c  ,Street__c,Street_number__c from EUMIR_support__c where organisation_Name__c = 'bioMérieux SA' and Type__c = 'Authorized'];
          
    }
    else if (Authorized.contains('bioMérieux SA'))
    {
        List <EUMIR_support__c> M4=[ Select 
Contact_first_Name__c,Contact_last_name__c,City_Name__c,Country__c,E_mail__c,Phone__c,
Postal_Code__c  ,Street__c,Street_number__c from EUMIR_support__c where organisation_Name__c = 'bioMérieux Inc' and Type__c = 'Authorized'];
        
    }
    
    
    
}