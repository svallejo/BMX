trigger Investigation_Eu_Mirupdate on CMPL123CME__Investigation__c (after insert,after update) {
    
    Map<string,Id> Inv_Code_Choice_1Map=new Map<string,Id>();
	 
	 for(CMPL123CME__Investigation__c inv:Trigger.new){
	     if(inv.B_Investigation_Type_Code_Choice_1__c!=null){
		     Inv_Code_Choice_1Map.put(inv.B_Investigation_Type_Code_Choice_1__c,inv.id);
		 }
	 }
	 if(Inv_Code_Choice_1Map.isEmpty()){
	     map<String,CMPL123CME__Investigation__c> Invstmap= new Map<String,CMPL123CME__Investigation__c>();
		 list<CMPL123CME__Investigation__c> investList=[SELECT Id,EU_MIR__c,B_Investigation_Type_Code_Choice_1__c,Workflow_Status_For_CRM__c FROM CMPL123CME__Investigation__c WHERE Workflow_Status_For_CRM__c ='Closed - Done' AND EU_MIR__c In:Inv_Code_Choice_1Map.Keyset()];
         for(CMPL123CME__Investigation__c cmpinv:Investlist){
             if(cmpinv.CMPL123_WF_Status__c == 'Closed - Done'){
             Invstmap.put(cmpinv.B_Investigation_Type_Code_Choice_1__c,cmpinv);
             }
         }                                  
	 }
}