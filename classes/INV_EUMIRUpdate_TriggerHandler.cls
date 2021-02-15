public class INV_EUMIRUpdate_TriggerHandler{

@future
public static void updateINVEUMIR(List<Id> invIdList)
{

    map<Id,CMPL123CME__Investigation__c> MIRInvestmap= new map<Id,CMPL123CME__Investigation__c>();

    List<CMPL123CME__Investigation__c> Chinvrecords = [SELECT id,CMPL123_WF_Status__c,EU_MIR__c,Master_Investigation__c,BMX_Investigation_Answer__c,Justification_for_Annex_B__c,Justification_for_Annex_C__c,Justification_for_Annex_D__c FROM CMPL123CME__Investigation__c WHERE Master_Investigation__c IN : invIdList ];
    system.debug('MasterInvChildrecords...MSR:::'+Chinvrecords);
    for(CMPL123CME__Investigation__c inv :Chinvrecords)   
    {
      if(inv.CMPL123_WF_Status__c  == 'Closed - Done')
      {           
            
            if(String.isNotBlank(inv.Justification_for_Annex_B__c) || String.isNotBlank(inv.Justification_for_Annex_C__c) || String.isNotBlank(inv.Justification_for_Annex_D__c))
            {            
                MIRInvestmap.put(inv.EU_MIR__c,inv);
            }
            
        }
    }
        List<CMPL123CME__EU_MIR__c> EMIRlistupdt= new List<CMPL123CME__EU_MIR__c>();
        system.debug('EMIRlistupdt...MSR:::'+EMIRlistupdt);
        system.debug('MIRInvestmap@@@MIRID@@InvestValues::'+MIRInvestmap);
        if(!MIRInvestmap.isEmpty())
        {
            List<CMPL123CME__EU_MIR__c> EMIRlist=[select id,CMPL123CME__Explain_If_Investigation_Code_Missing__c,CMPL123CME__Manufacturer_s_Evaluation__c from CMPL123CME__EU_MIR__c where Id IN:MIRInvestmap.keyset()];
            for(CMPL123CME__EU_MIR__c emr: EMIRlist)
            {
                CMPL123CME__EU_MIR__c mr= new CMPL123CME__EU_MIR__c();
                mr.Id=emr.Id;
               // mr.CMPL123CME__Explain_If_Investigation_Code_Missing__c= MIRInvestmap.get(emr.Id).Justification_for_Annex_B__c+MIRInvestmap.get(emr.Id).Justification_for_Annex_C__c+MIRInvestmap.get(emr.Id).Justification_for_Annex_D__c;
                mr.CMPL123CME__Explain_If_Investigation_Code_Missing__c= ((MIRInvestmap.get(emr.Id).Justification_for_Annex_B__c==null)?'':MIRInvestmap.get(emr.Id).Justification_for_Annex_B__c)+' '+'/'+' '+((MIRInvestmap.get(emr.Id).Justification_for_Annex_C__c==null)?'':MIRInvestmap.get(emr.Id).Justification_for_Annex_C__c)+' '+'/'+' '+((MIRInvestmap.get(emr.Id).Justification_for_Annex_D__c==null)?'':MIRInvestmap.get(emr.Id).Justification_for_Annex_D__c);
                mr.CMPL123CME__Manufacturer_s_Evaluation__c=MIRInvestmap.get(emr.Id).BMX_Investigation_Answer__c;
                EMIRlistupdt.add(mr);
            }
        }
        if(!EMIRlistupdt.isEmpty() && EMIRlistupdt.size()>0)
        {
            update EMIRlistupdt;
        }
    
   }

 
}