trigger PreventAddandDeleteTasks on Task (before insert, before delete) {
    
    //User should not be able to add or delete any Tasks after Action Plan is approved
    
    if(Trigger.isInsert){
        
        TaskPreventionHandler.preventTaskAddAndDelete(Trigger.new, 'insert');
            
    }else if(Trigger.isDelete){
        
        TaskPreventionHandler.preventTaskAddAndDelete(Trigger.old, 'delete');
           
    }    



}