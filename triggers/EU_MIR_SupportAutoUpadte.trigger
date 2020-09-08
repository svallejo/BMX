trigger EU_MIR_SupportAutoUpadte on CMPL123CME__EU_MIR__c (after insert,after update) 
{
    List<CMPL123CME__EU_MIR__c> EUMIRListupdt= new List<CMPL123CME__EU_MIR__c>();
    List<CMPL123CME__EU_MIR__c> EUMIRListupdt1= new List<CMPL123CME__EU_MIR__c>();
    List<CMPL123CME__EU_MIR__c> EUMIRListupdt2= new List<CMPL123CME__EU_MIR__c>();
    if(EU_Recursive_Avoid.flag)
    {
        
        Map<string,Id> eu_manfMap=new Map<string,Id>();
        Map<string,Id> eu_AuthMap=new Map<string,Id>();
        Map<string,Id> eu_submMap=new Map<string,Id>();
    
        for(CMPL123CME__EU_MIR__c eum:Trigger.new)
        {
            if(eum.Manufacturer_Organisation_name__c !=null)
            {
                eu_manfMap.put(eum.Manufacturer_Organisation_name__c,eum.Id);
            }
            if(eum.Org_Name_of_Authorised_Representative__c !=null)
            {
                eu_AuthMap.put(eum.Org_Name_of_Authorised_Representative__c,eum.Id);
            }
            if(eum.Registered_commercial_name_of_company__c !=null)
            {
                eu_submMap.put(eum.Registered_commercial_name_of_company__c,eum.Id);
            }
        }
        system.debug('eu_manfMap ::'+eu_manfMap);
        if(!eu_manfMap.isEmpty())
        {
            map<string,EUMIR_support__c> suuumap=new map<string,EUMIR_support__c>();
            List<EUMIR_support__c> EmsupportList=[Select Id,organisation_Name__c,Contact_first_Name__c,Contact_last_name__c,Country__c,E_mail__c,Phone__c,Postal_Code__c,Street__c,
            Street_number__c,Type__c,City_Name__c  from EUMIR_support__c WHERE organisation_Name__c IN:eu_manfMap.keyset() AND Type__c='Manufacturer'];
            
            for(EUMIR_support__c emsup:EmsupportList)
            {
                suuumap.put(emsup.organisation_Name__c,emsup);
            }
            
            List<CMPL123CME__EU_MIR__c> emulist=[SELECT Id,Manufacturer_Organisation_name__c,CMPL123CME__Manufact_Contact_First_Name__c,CMPL123CME__Manufact_Contact_Last_Name__c,CMPL123CME__Manufact_E_Mail__c,
            CMPL123CME__Manufact_Phone__c,CMPL123CME__Manufact_Country__c,CMPL123CME__Manufact_Street__c,CMPL123CME__Manufact_Street_Number__c,
            CMPL123CME__Manufact_Address_Complement__c,CMPL123CME__Manufact_City_Name__c,CMPL123CME__Manufact_Postcode__c from CMPL123CME__EU_MIR__c WHERE Id IN:eu_manfMap.values()];
            
            for(CMPL123CME__EU_MIR__c UM:emulist)
            {
                CMPL123CME__EU_MIR__c eumir=new CMPL123CME__EU_MIR__c();
                eumir.Id=UM.Id;
                eumir.CMPL123CME__Manufact_Organisation_Name__c = suuumap.get(UM.Manufacturer_Organisation_name__c).organisation_Name__c;
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
        system.debug('Manfracture List from Support::'+EUMIRListupdt);
        system.debug('eu_AuthMap values::'+eu_AuthMap);
        
        if(!eu_AuthMap.isEmpty())
        {
            map<string,EUMIR_support__c> suuumap1=new map<string,EUMIR_support__c>();
            List<EUMIR_support__c> EmsupportList1=[Select Id,organisation_Name__c,Contact_first_Name__c,Contact_last_name__c,Country__c,E_mail__c,Phone__c,Postal_Code__c,Street__c,
            Street_number__c,Type__c,City_Name__c  from EUMIR_support__c WHERE organisation_Name__c IN:eu_AuthMap.keyset() AND Type__c='Authorized'];
            
            for(EUMIR_support__c emsup1:EmsupportList1){
                suuumap1.put(emsup1.organisation_Name__c,emsup1);
            }
            List<CMPL123CME__EU_MIR__c> emulist1=[SELECT Id,Org_Name_of_Authorised_Representative__c,CMPL123CME__Author_Contact_First_Name__c,CMPL123CME__Author_Contact_Last_Name__c,CMPL123CME__Author_E_mail__c,
            CMPL123CME__Author_Phone__c,CMPL123CME__Author_Country__c,CMPL123CME__Author_Street__c,CMPL123CME__Author_Street_Number__c,
            CMPL123CME__Author_Address_Complement__c,CMPL123CME__Author_City_Name__c,CMPL123CME__Author_Postcode__c from CMPL123CME__EU_MIR__c WHERE Id IN:eu_AuthMap.values()];
            
            
            for(CMPL123CME__EU_MIR__c UM:emulist1)
            {
                CMPL123CME__EU_MIR__c eumir1=new CMPL123CME__EU_MIR__c();
                eumir1.Id=UM.Id;
                eumir1.CMPL123CME__Org_Name_Of_Authorised_Representative__c =suuumap1.get(UM.Org_Name_of_Authorised_Representative__c).organisation_Name__c;
                eumir1.CMPL123CME__Author_Contact_First_Name__c=suuumap1.get(UM.Org_Name_of_Authorised_Representative__c).Contact_first_Name__c;
                eumir1.CMPL123CME__Author_Contact_Last_Name__c = suuumap1.get(UM.Org_Name_of_Authorised_Representative__c).Contact_last_name__c;
                eumir1.CMPL123CME__Author_E_mail__c = suuumap1.get(UM.Org_Name_of_Authorised_Representative__c).E_mail__c;
                eumir1.CMPL123CME__Author_Phone__c = suuumap1.get(UM.Org_Name_of_Authorised_Representative__c).Phone__c;
                eumir1.CMPL123CME__Author_Country__c = suuumap1.get(UM.Org_Name_of_Authorised_Representative__c).Country__c;
                eumir1.CMPL123CME__Author_Street__c = suuumap1.get(UM.Org_Name_of_Authorised_Representative__c).Street__c;
                eumir1.CMPL123CME__Author_Postcode__c = suuumap1.get(UM.Org_Name_of_Authorised_Representative__c).Postal_Code__c;
                eumir1.CMPL123CME__Author_Street_Number__c = suuumap1.get(UM.Org_Name_of_Authorised_Representative__c).Street_number__c;
                eumir1.CMPL123CME__Author_City_Name__c = suuumap1.get(UM.Org_Name_of_Authorised_Representative__c).City_Name__c;
                EUMIRListupdt1.add(eumir1);
    
            }

        }
        system.debug('Author List from Support::'+EUMIRListupdt);
        system.debug('eu_submMapt::'+eu_submMap);
        
        if(!eu_submMap.isEmpty())
        {
            map<string,EUMIR_support__c> suuumap2=new map<string,EUMIR_support__c>();
            List<EUMIR_support__c> EmsupportList2=[Select Id,organisation_Name__c,Contact_first_Name__c,Contact_last_name__c,Country__c,E_mail__c,Phone__c,Postal_Code__c,Street__c,
            Street_number__c,Type__c,City_Name__c  from EUMIR_support__c WHERE organisation_Name__c IN:eu_submMap.keyset() AND Type__c='Submitters'];

            for(EUMIR_support__c emsup2:EmsupportList2)
            {
                suuumap2.put(emsup2.organisation_Name__c,emsup2);
            }
            List<CMPL123CME__EU_MIR__c> emulist2=[SELECT Id,Registered_commercial_name_of_company__c,CMPL123CME__Submitter_Contact_First_Name__c,CMPL123CME__Submitter_Contact_Last_Name__c,CMPL123CME__Submitter_E_Mail__c,
            CMPL123CME__Submitter_Phone__c,CMPL123CME__Submitter_Country__c,CMPL123CME__Submitter_Street__c,CMPL123CME__Submitter_Street_Number__c,
            CMPL123CME__Submitter_Address_Complement__c,CMPL123CME__Submitter_City_Name__c,CMPL123CME__Submitter_Postcode__c from CMPL123CME__EU_MIR__c WHERE Id IN:eu_submMap.values()];


            for(CMPL123CME__EU_MIR__c UM:emulist2)
            {
                CMPL123CME__EU_MIR__c eumir2=new CMPL123CME__EU_MIR__c();
                eumir2.Id=UM.Id;
                eumir2.CMPL123CME__Registered_Commercial_Name_Of_Company__c =suuumap2.get(UM.Registered_commercial_name_of_company__c).organisation_Name__c;
                eumir2.CMPL123CME__Submitter_Contact_First_Name__c=suuumap2.get(UM.Registered_commercial_name_of_company__c).Contact_first_Name__c;
                eumir2.CMPL123CME__Submitter_Contact_Last_Name__c = suuumap2.get(UM.Registered_commercial_name_of_company__c).Contact_last_name__c;
                eumir2.CMPL123CME__Submitter_E_Mail__c = suuumap2.get(UM.Registered_commercial_name_of_company__c).E_mail__c;
                eumir2.CMPL123CME__Submitter_Phone__c = suuumap2.get(UM.Registered_commercial_name_of_company__c).Phone__c;
                eumir2.CMPL123CME__Submitter_Country__c = suuumap2.get(UM.Registered_commercial_name_of_company__c).Country__c;
                eumir2.CMPL123CME__Submitter_Street__c = suuumap2.get(UM.Registered_commercial_name_of_company__c).Street__c;
                eumir2.CMPL123CME__Submitter_Postcode__c = suuumap2.get(UM.Registered_commercial_name_of_company__c).Postal_Code__c;
                eumir2.CMPL123CME__Submitter_Street_Number__c = suuumap2.get(UM.Registered_commercial_name_of_company__c).Street_number__c;
                eumir2.CMPL123CME__Submitter_City_Name__c = suuumap2.get(UM.Registered_commercial_name_of_company__c).City_Name__c;
                EUMIRListupdt2.add(eumir2);

            }
        }
        system.debug('submitt List from Support::'+EUMIRListupdt2);
        EU_Recursive_Avoid.flag=false;
        if(!EUMIRListupdt.IsEmpty())
        {
            update EUMIRListupdt;
        }
        if(!EUMIRListupdt1.IsEmpty())
        {
            update EUMIRListupdt1;
        }
        if(!EUMIRListupdt2.IsEmpty())
        {
            update EUMIRListupdt2;
        }
    }
}