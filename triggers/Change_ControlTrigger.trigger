trigger Change_ControlTrigger on CMPL123QMS__Change_Control__c (before update) {
   
   List<Id> UserId=new list<Id>();
   for(CMPL123QMS__Change_Control__c ch:trigger.New){
        UserId.add(ch.CRB_Approver_1__c);
   }

  if(Trigger.isUpdate){
      list<CMPL123QMS__Change_Control__c> ChangeControlist=[SELECT Id,CRB_Approver_1__c from CMPL123QMS__Change_Control__c 
      WHERE CRB_Approver_1__c IN:UserId];
      for(CMPL123QMS__Change_Control__c c:ChangeControlist){
          
      }
      
  }
}