@isTest
public Class Test_ActionItemTrigger{
    
    Static testmethod void ActionItemTest(){
        try{
        
        Profile p = [select id from profile where name='System Administrator'];
        
        User u = new User(alias = 'saham', email='shabhir.ahamed@ext.biomerieux.com',
                          emailencodingkey='UTF-8', lastname='MyTesting', TWD_Role__c='Change Coordinator', languagelocalekey='en_US',
                          localesidkey='en_US', profileid = p.Id, country='United States',
                          timezonesidkey='America/Los_Angeles', username='utestCmpl@email.com');
        insert u;
        
        CMPL123QMS__Change_Control__c ccobj=new CMPL123QMS__Change_Control__c();
        ccobj.Title__c='Test';
        ccobj.Change_Owner__c=u.id;
        ccobj.CMPL123_WF_Status__c='Open';
        ccobj.Origination__c='Corporate';
        ccobj.Risk_Assessment__c='NO';
        ccobj.Due_Date__c=system.today()+10;
        Insert ccobj;
        
        List<Action_Item__c> acclist=new list<Action_Item__c>();  
            
        Action_Item__c acItem=new Action_Item__c();
        acItem.Change_Control__c=ccobj.id;
        acItem.Assignee__c=u.Id;
        acItem.Required__c=TRUE;
        acItem.Quality_Approver__c=u.Id;
        acItem.Approver_1__c=u.id;
        acItem.Approver_2__c=u.id;
        acItem.Approver_3__c=u.id;
        acItem.Approver_4__c=u.id;
        acItem.Approver_5__c=u.id;
        acItem.Approver_6__c=u.id;
        acclist.add(acItem);
        insert acclist;
        }
        catch(Exception e){
            system.debug('get the Error message'+e.getMessage());
        }
    }
}