//trigger EU_MIR_InvestigationUpdate on CMPL123CME__EU_MIR__c (After insert,After update) {
trigger EU_MIR_InvestigationUpdate on CMPL123CME__EU_MIR__c (After insert) {

    if(EU_INV_Recursive_Avoid.flag1)
    {
    map<Id,Id> cmptmap= new map<Id,Id>();
    for(CMPL123CME__EU_MIR__c mir:Trigger.new)
    {
        if(mir.CMPL123CME__Complaint__c!=null && mir.CMPL123CME__Type_Of_Report__c=='Initial' )
        {
          System.debug('@@@@@'+' Inside the initial loop');

            cmptmap.put(mir.CMPL123CME__Complaint__c,mir.Id);
        }
    }
    map<Id,Id> Invstmap= new Map<Id,Id>();
    //List<CMPL123CME__Investigation__c> Investlist=[SELECT Id,CMPL123CME__Complaint__c,EU_MIR__c,CMPL123_WF_Status__c FROM CMPL123CME__Investigation__c WHERE CMPL123CME__Complaint__c IN:cmptmap.keyset()];
    List<CMPL123CME__Investigation__c> Investlist =[SELECT Id,CMPL123CME__Complaint__c,EU_MIR__c,CMPL123_WF_Status__c FROM CMPL123CME__Investigation__c WHERE (NOT CMPL123_WF_Status__c like '%Closed%')AND CMPL123CME__Complaint__c IN:cmptmap.keyset()];
    System.debug('@@@@@'+' Investlist count');
    List<CMPL123CME__Investigation__c> InvestUptlist= new List<CMPL123CME__Investigation__c>();
    for(CMPL123CME__Investigation__c inv:Investlist){
       // if(inv.CMPL123_WF_Status__c != 'Closed - Canceled'|| inv.CMPL123_WF_Status__c!= 'Closed - Done')
        //{   
                 System.debug('@@@@@ if condition' + inv.CMPL123_WF_Status__c);
                 System.debug('@@@@@ if condition' + inv.id);

            Invstmap.put(inv.CMPL123CME__Complaint__c,inv.Id);
            CMPL123CME__Investigation__c  inst= new CMPL123CME__Investigation__c();
            inst.Id=inv.Id;
            inst.EU_MIR__c=cmptmap.get(inv.CMPL123CME__Complaint__c);
            InvestUptlist.add(inst);
        //}
    }
    EU_INV_Recursive_Avoid.flag1=false;
    if(!InvestUptlist.isEmpty())
    {
        update InvestUptlist;
    }
    
    List<CMPL123CME__EU_MIR__c> MirUptlist= new List<CMPL123CME__EU_MIR__c>();
    List<CMPL123CME__EU_MIR__c> MirList=[SELECT id,CMPL123CME__Complaint__c,Investigation_Evaluation__c FROM CMPL123CME__EU_MIR__c WHERE Id IN:cmptmap.values()];
    for(CMPL123CME__EU_MIR__c eumir:MirList)
    {       
        CMPL123CME__EU_MIR__c m= new CMPL123CME__EU_MIR__c();
        m.Id=eumir.Id;
        m.Investigation_Evaluation__c=Invstmap.get(eumir.CMPL123CME__Complaint__c);
        MirUptlist.add(m);
    }
    EU_INV_Recursive_Avoid.flag1=false;
    if(!MirUptlist.isEmpty())
    {
        update MirUptlist;
    }
  } 
 }