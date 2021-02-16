public class Childinvest_Eumir_Update
{
    //@InvocableMethod
    public static void ChildInvest_JustificationUpdate(List<CMPL123CME__Investigation__c> InvestList) 
    {
        map<Id,CMPL123CME__Investigation__c> MIRInvestmap= new map<Id,CMPL123CME__Investigation__c>();
        
        List<CMPL123CME__Investigation__c> Childinvrecords = [SELECT id,CMPL123_WF_Status__c,EU_MIR__c,BMX_Investigation_Answer__c,Justification_for_Annex_B__c,Justification_for_Annex_C__c,Justification_for_Annex_D__c,B_Investigation_Type_Code_Choice_1__c,B_Investigation_Type_Code_Choice_2__c,B_Investigation_Type_Code_Choice_3__c,B_Investigation_Type_Code_Choice_4__c,B_Investigation_Type_Code_Choice_5__c,B_Investigation_Type_Code_Choice_6__c,C_Investigation_Findings_Code_Choice1__c,C_Investigation_Findings_Code_Choice2__c,C_Investigation_Findings_Code_Choice3__c,D_Investigation_Conclusion_Choice1__c,D_Investigation_Conclusion_Choice2__c,D_Investigation_Conclusion_Choice3__c FROM CMPL123CME__Investigation__c WHERE Master_Investigation__c IN: InvestList];
        system.debug('MS::ChildInvestlist::'+Childinvrecords);
        
        for(CMPL123CME__Investigation__c inv :Childinvrecords)   
        {
           
          if(inv.CMPL123_WF_Status__c  == 'Closed - Done')
          {           
                if(String.isNotBlank(inv.Justification_for_Annex_B__c) || String.isNotBlank(inv.Justification_for_Annex_C__c) || String.isNotBlank(inv.Justification_for_Annex_D__c))
                {            
                    MIRInvestmap.put(inv.EU_MIR__c,inv);
                }
                
          }
        }
        
        system.debug('MIRInvestmap::'+MIRInvestmap);
        system.debug('Childinvrecords MSR::'+Childinvrecords);
        
        List<CMPL123CME__EU_MIR__c> EMIRlistupdt= new List<CMPL123CME__EU_MIR__c>();
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
            system.debug('EMIRlistupdt MSR::'+EMIRlistupdt);
            if(!EMIRlistupdt.isEmpty())
            {
                update EMIRlistupdt;
            }
    }
    
   /** public class ChildInvestWrapper{
    
        @InvocableVariable
        public Id ChildInvestId;
   ***/
   
    }