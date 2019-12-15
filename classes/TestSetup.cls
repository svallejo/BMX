public virtual class TestSetup{
    private static final String WF_ACTION_API_NAME = 'CMPL123_WF_Action__c';
    private static final String WF_STATUS_API_NAME = 'CMPL123_WF_Status__c';
    private static final String ID_NAME = 'Id';

     public static CMPL123__Product__c createProduct(Boolean withId, String name, String code) {
        CMPL123__Product__c product = new CMPL123__Product__c(
                Name = name,
                CMPL123__Serial_No__c = '66666',
                CMPL123__Product_Code__c = code,
                CMPL123__Type__c = 'Drug',
                CMPL123__Active__c = true
        );
        if (withId) {
            insert product;
        }
        return product;
    }

    public static Action_Item__c createAIWithCC(Boolean withId, Id ccId) {
        Action_Item__c ai = new Action_Item__c();
        ai.change_control__c = ccId;
        ai.CMPL123_WF_Status__c = 'Open';
        ai.Action_Item__c = 'test';
        ai.CMPL123Task_Key_Value__c = '';
        if (withId) {
            insert ai;
        }
        return ai;
    }

    public static CMPL123CME__Complaint__c  createComplaint(Boolean withId) {
        CMPL123CME__Complaint__c complaintObj = new CMPL123CME__Complaint__c();
        complaintObj.CMPL123CME__Assigned_To__c = createUser(true).Id;
        complaintObj.CMPL123CME__Short_Description__c ='UnitTest';
        complaintObj.CMPL123CME__Initiator__c = createUser(true).Id;
        complaintObj.CMPL123CME__Supervisor__c = createUser(true).Id;
        complaintObj.CMPL123CME__Impact__c = 'Low';
        if (withId) {
            insert complaintObj;
        }
        return complaintObj;
    }

    public static CMPL123QMS__Change_Control__c  createCC(Boolean withId, Id recordTypeId) {
       CMPL123QMS__Change_Control__c cc = new CMPL123QMS__Change_Control__c();
        cc.Title__c = 'Test';
        cc.Change_Owner__c = createUser(true).id;
        cc.Origination__c = 'Corporate';
        cc.recordTypeId = recordTypeId;
        if (withId) {
            insert cc;
        }
        return cc;
    }

    public static Account  createAccount(Boolean withId) {
        Account acc = new Account();
        acc.name = 'test';
        if (withId) {
            insert acc;
        }
        return acc;
    }

    public static User createUser(Boolean withId){
        Profile stdProfile = [SELECT Id, Name FROM Profile WHERE Name ='System Administrator'];
        Blob blobKey = crypto.generateAesKey(128);
        String key = EncodingUtil.convertToHex(blobKey);
        User standard = new User(Alias = 'johnd',
                                Email = 'johndoe@test.com',
                                Emailencodingkey = 'UTF-8',
                                Firstname = 'John',
                                Lastname = 'Doe',
                                Languagelocalekey = 'en_US',
                                Localesidkey = 'en_US',
                                Profileid = stdProfile.Id,
                                Timezonesidkey ='America/Los_Angeles',
                                Username = 'test' + key.substring(0,15) + '@' + key.substring(16,22)+'.com'
                                );
        if(withId){
            insert standard;
        }
        return standard;
    }
}