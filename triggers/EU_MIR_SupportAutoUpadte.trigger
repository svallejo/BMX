trigger EU_MIR_SupportAutoUpadte on CMPL123CME__EU_MIR__c (After insert,After update) 
{
    List<CMPL123CME__EU_MIR__c> EUMIRListupdt= new List<CMPL123CME__EU_MIR__c>();
    if(EU_Recursive_Avoid.flag)
    {
        
        Map<string,Id> eu_manfMap=new Map<string,Id>();
        Map<Id,string> eu_AuthMap=new Map<Id,string>();
        Map<Id,string> eu_submMap=new Map<Id,string>();
    
        for(CMPL123CME__EU_MIR__c eum:Trigger.new)
        {
            if(eum.Manufacturer_Organisation_name__c !=null)
            {
                eu_manfMap.put(eum.Manufacturer_Organisation_name__c,eum.Id);
            }
            else if(eum.Org_Name_of_Authorised_Representative__c !=null)
            {
                eu_AuthMap.put(eum.Id,eum.Org_Name_of_Authorised_Representative__c);
            }
            else if(eum.Registered_commercial_name_of_company__c !=null)
            {
                eu_submMap.put(eum.Id,eum.Registered_commercial_name_of_company__c);
            }
        }
        if(!eu_manfMap.isEmpty())
        {
            map<string,EUMIR_support__c> suuumap=new map<string,EUMIR_support__c>();
            List<EUMIR_support__c> EmsupportList=[Select Id,organisation_Name__c,Contact_first_Name__c,Contact_last_name__c,Country__c,E_mail__c,Phone__c,Postal_Code__c,Street__c,
            Street_number__c,Type__c,City_Name__c  from EUMIR_support__c WHERE organisation_Name__c IN:eu_manfMap.keyset()];
            
            for(EUMIR_support__c emsup:EmsupportList){
                suuumap.put(emsup.organisation_Name__c,emsup);
            }
            
            List<CMPL123CME__EU_MIR__c> emulist=[SELECT Id,Manufacturer_Organisation_name__c,CMPL123CME__Manufact_Organisation_Name__c,CMPL123CME__Manufact_Contact_First_Name__c,CMPL123CME__Manufact_Contact_Last_Name__c,CMPL123CME__Manufact_E_Mail__c,
            CMPL123CME__Manufact_Phone__c,CMPL123CME__Manufact_Country__c,CMPL123CME__Manufact_Street__c,CMPL123CME__Manufact_Street_Number__c,
            CMPL123CME__Manufact_Address_Complement__c,CMPL123CME__Manufact_City_Name__c,CMPL123CME__Manufact_Postcode__c from CMPL123CME__EU_MIR__c WHERE Id IN:eu_manfMap.values()];
            
            for(CMPL123CME__EU_MIR__c UM:emulist)
            {
                CMPL123CME__EU_MIR__c eumir=new CMPL123CME__EU_MIR__c();
                eumir.Id=UM.Id;
                eumir.CMPL123CME__Manufact_Contact_First_Name__c=suuumap.get(UM.Manufacturer_Organisation_name__c).organisation_Name__c;
                eumir.CMPL123CME__Manufact_Contact_First_Name__c=suuumap.get(UM.Manufacturer_Organisation_name__c).Contact_first_Name__c;
                eumir.CMPL123CME__Manufact_Contact_Last_Name__c = suuumap.get(UM.Manufacturer_Organisation_name__c).Contact_last_name__c;
                eumir.CMPL123CME__Manufact_E_Mail__c = suuumap.get(UM.Manufacturer_Organisation_name__c).E_mail__c;
                eumir.CMPL123CME__Manufact_Phone__c = suuumap.get(UM.Manufacturer_Organisation_name__c).Phone__c;
                eumir.CMPL123CME__Manufact_Country__c = suuumap.get(UM.Manufacturer_Organisation_name__c).Country__c;
                eumir.CMPL123CME__Manufact_Street__c = suuumap.get(UM.Manufacturer_Organisation_name__c).Street__c;
                eumir.CMPL123CME__Manufact_Postcode__c = suuumap.get(UM.Manufacturer_Organisation_name__c).Postal_Code__c;
                eumir.CMPL123CME__Manufact_Street_Number__c = suuumap.get(UM.Manufacturer_Organisation_name__c).Street_number__c;
                eumir.CMPL123CME__Manufact_City_Name__c = suuumap.get(UM.Manufacturer_Organisation_name__c).City_Name__c;
                EUMIRListupdt.add(eumir);
    
            }
        }
    }
    EU_Recursive_Avoid.flag=false;
    if(!EUMIRListupdt.IsEmpty())
    {
        update EUMIRListupdt;
    }
}