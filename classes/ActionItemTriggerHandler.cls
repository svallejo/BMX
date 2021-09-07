Public Class ActionItemTriggerHandler {
   
   Public static void BeforeUpdate(list<Action_Item__c> actionList){
   
    Set<Id> parentIds=new Set<Id>();

   
        for(Action_Item__c aid:actionList){
		
            parentIds.add(aid.Quality_Approver__c);
            parentIds.add(aid.Approver_1__c);
            parentIds.add(aid.Approver_2__c);
            parentIds.add(aid.Approver_3__c);
            parentIds.add(aid.Approver_4__c);
            parentIds.add(aid.Approver_5__c);
            parentIds.add(aid.Approver_6__c); 
        }
	
    Map<Id,User> parentMap=new Map<Id,User>();
    parentMap.putAll([Select Id,TWD_Role__c from User 
                     where TWD_Role__c!='Change Control Editor' AND id IN :parentIds]);

    for (Action_Item__c ac : actionList)
    {
       if (parentMap.get(ac.Quality_Approver__c) !=null)
       { 
          ac.Quality_Approver__c.addError('User selected in "Quality Approver" does not have the needed role. Select another user');
       }
       
       if (parentMap.get(ac.Approver_1__c) !=null)
       { 
          ac.Approver_1__c.addError('User selected in "Approver 1" does not have the needed role. Select another user');
       }
       
       if (parentMap.get(ac.Approver_2__c) !=null)
       { 
          ac.Approver_2__c.addError('User selected in "Approver 2" does not have the needed role. Select another user');
       }
       
       if (parentMap.get(ac.Approver_3__c) !=null)
       { 
          ac.Approver_3__c.addError('User selected in "Approver 3" does not have the needed role. Select another user');
       }
       
       if (parentMap.get(ac.Approver_4__c) !=null)
       { 
          ac.Approver_4__c.addError('User selected in "Approver 4" does not have the needed role. Select another user');
       }
       
       if (parentMap.get(ac.Approver_5__c) !=null)
       { 
          ac.Approver_5__c.addError('User selected in "Approver 5" does not have the needed role. Select another user');
       }
       
       if (parentMap.get(ac.Approver_6__c) !=null)
       { 
          ac.Approver_6__c.addError('User selected in "Approver 6" does not have the needed role. Select another user');
       }
       
     }
   
   }

}