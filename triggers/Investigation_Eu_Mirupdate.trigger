trigger Investigation_Eu_Mirupdate on CMPL123CME__Investigation__c (after insert,after update) {

    List<CMPL123CME__EU_MIR__c> EUMIRListupdt= new List<CMPL123CME__EU_MIR__c>();
    
    map<string,Id> Inv_Code_Choice_1Map= new map<string,Id>();
     
     for(CMPL123CME__Investigation__c inv:Trigger.new){
         
         if(inv.B_Investigation_Type_Code_Choice_1__c!=null){
           Inv_Code_Choice_1Map.put(inv.B_Investigation_Type_Code_Choice_1__c,inv.id);
           }
         if(inv.B_Investigation_Type_Code_Choice_2__c!=null){
            Inv_Code_Choice_1Map.put(inv.B_Investigation_Type_Code_Choice_2__c, inv.id);
            }
     }
     System.debug('Investgation choice1 values..'+Inv_Code_Choice_1Map);
     
    if(!Inv_Code_Choice_1Map.isEmpty()){
         
        map<Id,CMPL123CME__Investigation__c> Invstmap= new Map<Id,CMPL123CME__Investigation__c>();
        
        System.debug('Investgation_choice1values11..'+Invstmap);
        for(CMPL123CME__Investigation__c cmpinv:[SELECT Id,EU_MIR__c,B_Investigation_Type_Code_Choice_1__c,B_Investigation_Type_Code_Choice_2__c,CMPL123_WF_Status__c   FROM CMPL123CME__Investigation__c WHERE Id IN:Inv_Code_Choice_1Map.KeySet()]){
            if(cmpinv.CMPL123_WF_Status__c  == 'Closed - Done'){
            Invstmap.put(cmpinv.id,cmpinv);
            }
        }
        
        system.debug('Invstmap@@@values@@@'+Invstmap);
        
        for(CMPL123CME__Investigation__c Invest:[SELECT Id,EU_MIR__c from CMPL123CME__Investigation__c WHERE EU_MIR__c In:Invstmap.KeySet()]){
           system.debug('EUMIR Data@@@@'+Invest);
           
           CMPL123CME__EU_MIR__c umirchioce= new CMPL123CME__EU_MIR__c();
           umirchioce.id=Invest.EU_MIR__c ;
           umirchioce.CMPL123CME__B_Investigation_Type_Code_Choice_1__c= Invest.B_Investigation_Type_Code_Choice_1__c;
           EUMIRListupdt.add(umirchioce);
           
        }
    }
    
    if(!EUMIRListupdt.isEmpty()){
        update EUMIRListupdt;
        System.debug('EUMIRListupdt@@@@'+EUMIRListupdt);
    }
    
    
 }