@isTest
public class Test_ChangecontrolTrigger {
    @isTest
    public static void BeforeUpdate(){
        Profile p = [select id from profile where name='Standard User'];
        
        User u = new User(alias = 'utest', email='utest@email.com',
                          emailencodingkey='UTF-8', lastname='Testing', TWD_Role__c='Change Control Editor', languagelocalekey='en_US',
                          localesidkey='en_US', profileid = p.Id, country='United States',
                          timezonesidkey='America/Los_Angeles', username='utestCmpl@email.com');
        insert u;
        
    }
}