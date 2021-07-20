trigger Change_ControlTrigger on CMPL123QMS__Change_Control__c (before update){

    Set<Id> parentIds=new Set<Id>();

    if(trigger.isbefore && trigger.isupdate)
    {
        for(CMPL123QMS__Change_Control__c ch:Trigger.new){
            parentIds.add(ch.CRB_Approver_1__c);
            parentIds.add(ch.CRB_Approver_2__c);
            parentIds.add(ch.CRB_Approver_3__c);
            parentIds.add(ch.CRB_Approver_4__c);
            parentIds.add(ch.CRB_Approver_5__c);
            parentIds.add(ch.CRB_Approver_6__c);
        }
    }

    Map<Id,User> parentMap=new Map<Id,User>();

    parentMap.putAll([Select Id,TWD_Role__c from User 
                     where TWD_Role__c!='Change Control Editor' AND id IN :parentIds]);

    for (CMPL123QMS__Change_Control__c c : Trigger.new)
    {
       // if the parent id is in the map, that means the record save fails
       if (parentMap.get(c.CRB_Approver_1__c) !=null)
       { 
          c.CRB_Approver_1__c.addError('User selected in "CRB Approver 1" doesnt have the needed role. Select another user');

       }
       
        // if the parent id is in the map, that means the record save fails
       if (parentMap.get(c.CRB_Approver_2__c) !=null)
       { 
          c.CRB_Approver_2__c.addError('User selected in "CRB Approver 2" doesnt have the needed role. Select another user');

       }
       
       if (parentMap.get(c.CRB_Approver_3__c) !=null)
       { 
          c.CRB_Approver_3__c.addError('User selected in "CRB Approver 3" doesnt have the needed role. Select another user');

       }
       
       if (parentMap.get(c.CRB_Approver_4__c) !=null)
       { 
          c.CRB_Approver_4__c.addError('User selected in "CRB Approver 4" doesnt have the needed role. Select another user');

       }
       
       if (parentMap.get(c.CRB_Approver_5__c) !=null)
       { 
          c.CRB_Approver_5__c.addError('User selected in "CRB Approver 5" doesnt have the needed role. Select another user');

       }
       
       if (parentMap.get(c.CRB_Approver_6__c) !=null)
       { 
          c.CRB_Approver_6__c.addError('User selected in "CRB Approver 6" doesnt have the needed role. Select another user');

       }

    }
}