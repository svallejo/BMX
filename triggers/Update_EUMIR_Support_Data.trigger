trigger Update_EUMIR_Support_Data on CMPL123CME__EU_MIR__c (after insert) {
    
    Set<String> Manufacturer=new Set<String>();
    Set<String> Authorized = new set<String>();
    List <EUMIR_support__c>Manufacturerupdate = new list <EUMIR_support__c> ();
     List <EUMIR_support__c> Authorizedupdate = new list <EUMIR_support__c> ();
     for(CMPL123CME__EU_MIR__c eumirinsert: Trigger.new){
        Manufacturer.add(eumirinsert.Manufacturer_Organisation_name__c);
        Authorized.add(eumirinsert.Org_Name_of_Authorised_Representative__c);
     }
    
    if (Manufacturer.contains('bioMérieux SA'))
    {
        List <EUMIR_support__c> M1=[ Select 
Contact_first_Name__c,Contact_last_name__c,City_Name__c,Country__c,E_mail__c,Phone__c,
Postal_Code__c	,Street__c,Street_number__c from EUMIR_support__c where organisation_Name__c = 'bioMérieux SA' and Type__c = 'Manufacturer'];
        
        
    }
    else if (Manufacturer.contains('bioMérieux Inc'))
    {
         List <EUMIR_support__c> M2=[ Select 
Contact_first_Name__c,Contact_last_name__c,City_Name__c,Country__c,E_mail__c,Phone__c,
Postal_Code__c	,Street__c,Street_number__c from EUMIR_support__c where organisation_Name__c = 'bioMérieux Inc' and Type__c = 'Manufacturer'];
       
    }
    
    if (Authorized.contains('bioMérieux SA'))
    {
      List <EUMIR_support__c> M3=[ Select 
Contact_first_Name__c,Contact_last_name__c,City_Name__c,Country__c,E_mail__c,Phone__c,
Postal_Code__c	,Street__c,Street_number__c from EUMIR_support__c where organisation_Name__c = 'bioMérieux SA' and Type__c = 'Authorized'];
          
    }
    else if (Authorized.contains('bioMérieux SA'))
    {
        List <EUMIR_support__c> M4=[ Select 
Contact_first_Name__c,Contact_last_name__c,City_Name__c,Country__c,E_mail__c,Phone__c,
Postal_Code__c	,Street__c,Street_number__c from EUMIR_support__c where organisation_Name__c = 'bioMérieux Inc' and Type__c = 'Authorized'];
        
    }
    
    
    /*
      // SOQL outside for loop....
      List<EProduct__c> prodcutList=[Select id,Name,Quantity__c from EProduct__c 
                                                         where  Name IN : productNames];
      //Main loop starts...
      for(EOrder__c order: Trigger.new){
        for(EProduct__c product: productList){
             //Second part of if checks if there are enough products for the current order.
             if(order.Product__c == product.Name && (product.Quantity__c - order.Quantity__c)>0){
                    product.Quantity__c=product.Quantity__c - order.Quantity__c;
                 }
              }
        }
        try{
             Database.update(productList,FALSE);
        }
       catch(DMLException e){
            System.debug(e);
       }
*/
}