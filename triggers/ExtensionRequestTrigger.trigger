trigger ExtensionRequestTrigger on Extension_Request_Change_Control__c (before update){

    Set<Id> parentIds=new Set<Id>();

    if(trigger.isbefore && trigger.isupdate)
    {
        for(Extension_Request_Change_Control__c et:Trigger.new){
            parentIds.add(et.Approver__c);
           
            
        }
    }
    Map<Id,User> parentMap=new Map<Id,User>();

    parentMap.putAll([Select Id,TWD_Role__c from User 
                     where TWD_Role__c!='Change Control Editor' AND id IN :parentIds]);

    for (Extension_Request_Change_Control__c ac : Trigger.new)
    {
       if (parentMap.get(ac.Approver__c) !=null)
       { 
          ac.Approver__c.addError('User selected in Approver" does not have the needed role. Select another user');
       }
       
    }   
    }