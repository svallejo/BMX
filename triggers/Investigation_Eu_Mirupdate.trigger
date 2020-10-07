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
     
     if(Inv_Code_Choice_1Map.isEmpty()){
         
        map<String,CMPL123CME__Investigation__c> Invstmap= new Map<string,CMPL123CME__Investigation__c>();
        for(CMPL123CME__Investigation__c cmpinv:[SELECT Id,EU_MIR__c,B_Investigation_Type_Code_Choice_1__c,B_Investigation_Type_Code_Choice_2__c,Workflow_Status_For_CRM__c FROM CMPL123CME__Investigation__c WHERE Workflow_Status_For_CRM__c ='Closed - Done' AND  B_Investigation_Type_Code_Choice_1__c In:Inv_Code_Choice_1Map.KeySet()]){
            if(cmpinv.CMPL123_WF_Status__c == 'Closed - Done'){
            Invstmap.put(cmpinv.B_Investigation_Type_Code_Choice_1__c,cmpinv);
            }
        }
        system.debug('Invstmap@@@values@@@'+Invstmap);
        List<CMPL123CME__Investigation__c> emulist= [Select id,EU_MIR__c,B_Investigation_Type_Code_Choice_1__c from CMPL123CME__Investigation__c WHERE Id in:Invstmap.values()];
        
        for(CMPL123CME__Investigation__c invst:emulist){
             
             CMPL123CME__EU_MIR__c umir=new CMPL123CME__EU_MIR__c();
             umir.id=invst.id;
             umir.CMPL123CME__B_Investigation_Type_Code_Choice_1__c= invst.B_Investigation_Type_Code_Choice_1__c;
             EUMIRListupdt.add(umir);
        }
     
    }
    if(!EUMIRListupdt.isEmpty()){
    update EUMIRListupdt;
    }
 }