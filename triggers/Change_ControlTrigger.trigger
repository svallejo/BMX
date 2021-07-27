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
            ParentIds.add(Ch.Quality_Approver__c);
            ParentIds.add(Ch.Release_Approver_1__c);
            ParentIds.add(Ch.Release_Approver_2__c);
            ParentIds.add(Ch.Release_Approver_3__c);
            ParentIds.add(Ch.Release_Approver_4__c);
            ParentIds.add(Ch.Release_Approver_5__c);
            ParentIds.add(Ch.Release_Approver_6__c);
            ParentIds.add(Ch.Release_QA_Approver__c);
            ParentIds.add(Ch.Assigned_To__c);
            ParentIds.add(Ch.Quality_Contact__c);
            ParentIds.add(Ch.Supervisor_Manager__c);
            ParentIds.add(Ch.CMPL123QMS__QA_Contact__c);
            ParentIds.add(Ch.CMPL123QMS__Main_Contact__c);
            ParentIds.add(Ch.CMPL123QMS__Management_Approved_By__c);
            ParentIds.add(Ch.CMPL123QMS__Manager__c);
            
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
          c.CRB_Approver_1__c.addError('User selected in "CRB Approver 1" does not have the needed role. Select another user');
       }
       
        // if the parent id is in the map, that means the record save fails
       if (parentMap.get(c.CRB_Approver_2__c) !=null)
       { 
          c.CRB_Approver_2__c.addError('User selected in "CRB Approver 2" does not have the needed role. Select another user');
       }
       
       if (parentMap.get(c.CRB_Approver_3__c) !=null)
       { 
          c.CRB_Approver_3__c.addError('User selected in "CRB Approver 3" does not have the needed role. Select another user');
       }
       
       if (parentMap.get(c.CRB_Approver_4__c) !=null)
       { 
          c.CRB_Approver_4__c.addError('User selected in "CRB Approver 4" does not have the needed role. Select another user');
       }
       
       if (parentMap.get(c.CRB_Approver_5__c) !=null)
       { 
          c.CRB_Approver_5__c.addError('User selected in "CRB Approver 5" does not have the needed role. Select another user');
       }
       
       if (parentMap.get(c.CRB_Approver_6__c) !=null)
       { 
          c.CRB_Approver_6__c.addError('User selected in "CRB Approver 6" does not have the needed role. Select another user');
       }
        
	   if (parentMap.get(c.Quality_Approver__c) !=null)
       { 
          c.Quality_Approver__c.addError('User selected in "CRB Quality Approver" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.Quality_Approver__c) !=null)
       { 
          c.Quality_Approver__c.addError('User selected in "CRB Quality Approver" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.Release_Approver_1__c) !=null)
       { 
          c.Release_Approver_1__c.addError('User selected in "Release Approver 1" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.Release_Approver_2__c) !=null)
       { 
          c.Release_Approver_2__c.addError('User selected in "Release Approver 2" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.Release_Approver_3__c) !=null)
       { 
          c.Release_Approver_3__c.addError('User selected in "Release Approver 3" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.Release_Approver_4__c) !=null)
       { 
          c.Release_Approver_4__c.addError('User selected in "Release Approver 4" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.Release_Approver_5__c) !=null)
       { 
          c.Release_Approver_5__c.addError('User selected in "Release Approver 5" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.Release_Approver_6__c) !=null)
       { 
          c.Release_Approver_6__c.addError('User selected in "Release Approver 6" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.Release_QA_Approver__c) !=null)
       { 
          c.Release_QA_Approver__c.addError('User selected in "Release QA Approver " does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.Assigned_To__c) !=null)
       { 
          c.Assigned_To__c.addError('User selected in "Final Approver 1" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.Quality_Contact__c) !=null)
       { 
          c.Quality_Contact__c.addError('User selected in "Final Approver 2" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.Supervisor_Manager__c) !=null)
       { 
          c.Supervisor_Manager__c.addError('User selected in "Final Approver 3" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.CMPL123QMS__QA_Contact__c) !=null)
       { 
          c.CMPL123QMS__QA_Contact__c.addError('User selected in "Final (QA) Approver" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.CMPL123QMS__Main_Contact__c) !=null)
       { 
          c.CMPL123QMS__Main_Contact__c.addError('User selected in "Final Approver 4" does not have the needed role. Select another user.');
       }
           
       if (parentMap.get(c.CMPL123QMS__Management_Approved_By__c) !=null)
       { 
          c.CMPL123QMS__Management_Approved_By__c.addError('User selected in "Final Approver 5" does not have the needed role. Select another user.');
       }
        
       if (parentMap.get(c.CMPL123QMS__Manager__c) !=null)
       { 
          c.CMPL123QMS__Manager__c.addError('User selected in "Final Approver 6" does not have the needed role. Select another user.');
       }
    }
}