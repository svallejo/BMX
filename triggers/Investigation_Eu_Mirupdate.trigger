trigger Investigation_Eu_Mirupdate on CMPL123CME__Investigation__c (after insert,after update) {

    List<CMPL123CME__EU_MIR__c> EUMIRListupdt= new List<CMPL123CME__EU_MIR__c>();
    map<Id,CMPL123CME__Investigation__c> Inv_Code_Choice_1Map= new map<Id,CMPL123CME__Investigation__c>();
    for(CMPL123CME__Investigation__c inv:Trigger.new)
    {   
        if(inv.CMPL123_WF_Status__c  == 'Closed - Done'){
            
            Inv_Code_Choice_1Map.put(inv.EU_MIR__c,inv);
        }
    }   
    List<CMPL123CME__EU_MIR_Code_Choices__c> codchooselist=[select id,CMPL123CME__Related_EU_MIR__c from CMPL123CME__EU_MIR_Code_Choices__c where CMPL123CME__Related_EU_MIR__c IN:Inv_Code_Choice_1Map.keyset()];  
    if(!codchooselist.isEmpty())
    {
        delete codchooselist;
    }
    LIst<CMPL123CME__EU_MIR__c>  EMRlist=[select Id from CMPL123CME__EU_MIR__c where Id IN:Inv_Code_Choice_1Map.keyset()]; 
    for(CMPL123CME__EU_MIR__c em:EMRlist)
    {
        CMPL123CME__EU_MIR__c e= new CMPL123CME__EU_MIR__c();
        e.Id=em.Id;
        e.CMPL123CME__B_Investigation_Type_Code_Choice_1__c =Inv_Code_Choice_1Map.get(em.Id).B_Investigation_Type_Code_Choice_1__c;
        e.CMPL123CME__B_Investigation_Type_Code_Choice_2__c =Inv_Code_Choice_1Map.get(em.Id).B_Investigation_Type_Code_Choice_2__c;
        e.CMPL123CME__B_Investigation_Type_Code_Choice_3__c =Inv_Code_Choice_1Map.get(em.Id).B_Investigation_Type_Code_Choice_3__c;
        e.CMPL123CME__B_Investigation_Type_Code_Choice_4__c =Inv_Code_Choice_1Map.get(em.Id).B_Investigation_Type_Code_Choice_4__c;
        EUMIRListupdt.add(e);
    }
    if(!EUMIRListupdt.isEmpty()){
        update EUMIRListupdt;
    
    }
    
 }