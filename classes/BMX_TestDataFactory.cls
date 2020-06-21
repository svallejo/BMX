/* 
* @why  : The test factory is all about creating the test data setup for all the business objects which are 
*         used inside the code
* @when : CreatedDate :   ModifiedDate : 
* @what : The test factory is all about creating the test data setup for all the business objects which are 
*         used inside the code. 
*/

@isTest
public class BMX_TestDataFactory {
    
    public static SObject createSObject(SObject sObj, Boolean doInsert) {
        SObject retObject = createSObject(sObj);
        if (doInsert) {
            //try{
            insert retObject;
            // System.debug('retObject======'+retObject);
            
            //}catch(Exception ex){
            //  System.debug('ex===>'+ex.getMessage());
            //}
            
        }
        return retObject;
    }
    
    public static SObject createSObject(SObject sObj) {
        // Check what type of object we are creating and add any defaults that are needed.
        String objectName = String.valueOf(sObj.getSObjectType());
        // Construct the default values class. Salesforce doesn't allow '__' in class names
        String defaultClassName = 'TestDataFactory.' + objectName.replaceAll('__(c|C)$|__', '') + 'Defaults';
        // If there is a class that exists for the default values, then use them
        if (Type.forName(defaultClassName) != null) {
            sObj = createSObject(sObj, defaultClassName);
        }
        return sObj;
    }
    
    public static SObject createSObject(SObject sObj, String defaultClassName) {
        // Create an instance of the defaults class so we can get the Map of field defaults
        Type t = Type.forName(defaultClassName);
        if (t == null) {
            Throw new TestDataFactoryException('Exception');
        }
        FieldDefaults defaults = (FieldDefaults)t.newInstance();
        addFieldDefaults(sObj, defaults.getFieldDefaults());
        return sObj;
    }
    
    public static SObject createSObject(SObject sObj, String defaultClassName, Boolean doInsert) {
        SObject retObject = createSObject(sObj, defaultClassName);
        if (doInsert) {
            insert retObject;
        }
        return retObject;
    }
    
    public static SObject[] createSObjectList(List<SObject> objs, Boolean doInsert) {
        
        if (doInsert) {
            insert objs;
        }
        return objs;
    }
    
    private static void addFieldDefaults(SObject sObj, Map<Schema.SObjectField, Object> defaults) {
        // Loop through the map of fields and if they weren't specifically assigned, fill them.
        Map<String, Object> populatedFields = sObj.getPopulatedFieldsAsMap();
        
        for (Schema.SObjectField field : defaults.keySet()) {
            if (!populatedFields.containsKey(String.valueOf(field))) {
                sObj.put(field, defaults.get(field));
            }
        }
    }
    
    
    // Update SObject
    public static SObject updateSObject(SObject sObj) {
        update sObj;
        return sObj;
    }
    
    // Update SObject List
    public static List<SObject> updateSObjectList(List<SObject> sObjList) {
        update sObjList;
        return sObjList;
    }      
    
    // Delete SObject
    public static void deleteSObject(SObject sObj) {
        delete sObj;
    } 
    
    public class TestDataFactoryException extends Exception {}
    
    // Use the FieldDefaults interface to set up values you want to default in for all objects.
    public Interface FieldDefaults {
        Map<Schema.SObjectField, Object> getFieldDefaults();
    }
    
    // To specify defaults for objects, use the naming convention [ObjectName]Defaults.
    // For custom objects, omit the __c from the Object Name
    
    // Default data for Questionnaire
    public class CMPL123CMEQuestionnaireDefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object>();
        }
    }
    
    // Default data for TGA
    public class CMPL123CMETGADefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                // need to do
            };
                }
    }
    
    // Default data for CVR
    public class CMPL123CMECVRDefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                CMPL123CME__CVR__c.CMPL123CME__Type_of_Report__c => 'Preliminary',
                    CMPL123CME__CVR__c.CMPL123CME__Date_Submitted__c => System.today()
                    };
                        }
    }
    
    // Default data for MEDDEV
    public class CMPL123CMEMEDDEVDefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                // need to do
            };
                }
    }
    
    // Default data for EMDR
    public class CMPL123CMEEMDRDefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
            };
                }
    }
    
    
    // Default data for Investigation_Items
    public class CMPL123CMEInvestigation_ItemsDefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object>();
        }
    }
    
    
    
    // Default data for Assessment Admin Item
    public class CMPL123CMEQuestions_Template_ItemDefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object>{
                CMPL123CME__Questions_Template_Item__c.CMPL123CME__Question_No__c => 1,
                    CMPL123CME__Questions_Template_Item__c.CMPL123CME__Weight__c => 0
                    };
                        }
    }
    
    /*123 Digital workflow setup */  
    
    // Default data for 123 Workflow
    public class CMPL123WF_RuleDefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object>();
        }
    }
    
    // Default data for 123 Workflow Action
    public class CMPL123WF_ActionDefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object>();
        }
    }
    
    // Default data for 123 Workflow Status
    public class CMPL123WF_StatusDefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object>();
        }
    }
    
    // Default data for 123 Workflow Step
    public class CMPL123WF_StepDefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object>();
        }
    }
    
    //Default data for TGA(TrackWise Digital Complaints)
    public class CMPL123WF_TGADefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object>{CMPL123CME__TGA__c.CMPL123CME__Report_Type__c => 'Initial' };
                }
    } 
    /*123 Digital workflow setup  ends here*/  
    
    /*------------BMX Data Starts here----------------------*/
    // Default data for Generic Report
    public class BMX_GenericReportDefaults implements FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
            };
                }
    }  
    
    
    public static Case__x getCaseExRecords(){
        
        Case__x csX = new Case__x(AccountId__c= '0014E00000SL3hAQAT',BatchExpDate_c__c = Date.today(),
                                  FirstL2EscalationDate_c__c = Date.today(),Reason__c = 'test',ActionCode_c__c = 'a1r4E000000PUNcQAO',
                                  ANALYZE_c__c = 'a1r4E000000PUNcQAO',AssetId__c = '02i6E000003jkkiQAA',SoftwareCode_c__c = 'a1r4E000000PUNcQAO',
                                  ContactId__c = '0033E00000VuDqAQAV',CreatedById__c = '00226000006qip2AAA',EntitlementId__c = '5508E000000269wQAA',
                                  ErrorCode_c__c = 'a1r4E000000PUNcQAO',LastModifiedById__c = '00226000006qip2AAA',L1Owner_c__c = '00226000006qip2AAA',
                                  L2Owner_c__c = '00226000006qip2AAA',OwnerId__c = '00226000006qip2AAA',ParentId__c = 'x006E000009PlP5QAK',
                                  RESULT_c__c = 'a1r4E000000PUNcQAO',SAMPLE_c__c = 'a1r4E000000PUNcQAO',SatisfactionCode_c__c = 'a1r4E000000PUNcQAO',
                                  ShipToLocation_c__c = '1376E000000CfiMQAS',FunctionalLocation_c__c = '02i2E000003jkkiQAA',ATC_c__c = 'test',
                                  BatchNumber_c__c = '1234',UDI_Code_c__c = '12-34',Type__c = 'TechnicalComplaint',ProductId__c = '01t22000004CcVaAAK',
                                  DueDate_c__c = Date.today(),CustomerContactDate_c__c = Date.today(),NoInvestJustif_c__c = 'a1r4E000000PUNcQAO',
                                  isCreatedOnSite_c__c = true,CaseHasWO_c__c = 'WO Open',BatchNumberUnknown_c__c = true,
                                  Opened_Date__c = Date.today(),Status__c = 'Closed',SIGcode_c__c = '12-34',Product_c__c = '01t22000004CcVaAAK',Product_Code_c__c='210147',
                                  Subject__c = 'test subject',SAPCustomerNumber_c__c = '7654',Priority__c = 'Test priority',
                                  PRE5_c__c = 'Yes',PRE6_c__c = 'Yes',PRE4_c__c = 'Yes',PRE2P2_c__c = 'Yes',
                                  PRE3P2_c__c = 'Yes',PRE3_1_c__c = 'Yes',PRE1_c__c = 'Yes',PRE2_1_c__c = 'Yes',
                                  Origin_c__c = 'Phone',PRE_YesNo_c__c = 'No',Description_c__c = 'test description',
                                  LastL2toL1DeescalationDate_c__c = Date.today(),InvQ6_c__c = 'Yes',InvQ5_c__c = 'Yes',
                                  InvQ4_c__c = 'Yes',InvQ3_c__c = 'Yes',InvQ2_c__c = 'Yes',InvQ1_c__c = 'Yes',
                                  InvestSubmittedBy_c__c = 'Test User',IsInternalCase_c__c = True,ExternalId = '5008E000006OzHYQA0',
                                  FirstL2OwnershipTaken_c__c = Date.today(),LastL2EscalationDate_c__c = Date.today());
        
        //Database.insertImmediate(csX);
        system.debug('==csX==='+csX);
        return csX;
    }
    
    public static Account__x getAccountExRecord(){
        Account__x accX = new Account__x(Name__c = 'Test Account',ExternalId = '0014E00000SL3hAQAT',
                                         Category_c__c = '612 - Pharma Non sterile',Region_c__c = 'EMEA',
                                        Global_Reporting_Hierarchy_Level_1_c__c= '0012E00000SL3hGQAT');
        return accX;
    }
    
    public static Contact__x getContactExRecord(){
        Contact__x conX = new Contact__x(FirstName__c = 'Test' , LastName__c = 'Contact' , ExternalId = '0033E00000VuDqAQAV');
        return conX;
    }
    
    public static Asset__x getAssetExRecord(){
        Asset__x assetX = new Asset__x( Name__c = 'Test Asset' , ExternalId = '02i6E000003jkkiQAA');
        return assetX;
    }
    
    public static CodeGroup_c__x getCodeGroupExRecord(){
        CodeGroup_c__x codGX = new CodeGroup_c__x(Name__c = 'Test code',Code_c__c = '1234' , ExternalId = 'a1r4E000000PUNcQAO');
        return codGX;
    }
    
    public static Entitlement__x getEntitlementExRecord(){
        Entitlement__x entitleX = new Entitlement__x(Name__c = 'Test entitlement' , ExternalId = '5508E000000269wQAA');
        return entitleX;
    }
    
    public static User__x getUserExRecord(){
        User__x userX = new User__x(FirstName__c = 'Test' , LastName__c = 'user' , ExternalId = '00226000006qip2AAA');
        return userX;
    }
    
    public static Product2__x getProductExRecord(){
        Product2__x prodX = new Product2__x(Name__c = 'Test Product',ExternalId = '01t22000004CcVaAAK',ProductCode__c= '6203306');
        return prodX;
    }
    
    public static Location__x getLocationExRecord(){
        Location__x locX = new Location__x(Name__c = 'Test Location', VisitorAddressId__c = '1306E0000004CCUQA2',ExternalId = '1376E000000CfiMQAS');
        return locX;
    }
    
    public static Case getCaseRecord(){
        Case cs = new Case(Status = 'New',Origin = 'Email');
        return cs;
    }
    
    public static CaseComment__x getCaseCommentExRecord(){
        
        CaseComment__x caseCmnt = new CaseComment__x(ParentId__c = '5007E000006OyrBQAS',CommentBody__c= 'test body', ExternalId = '00a8E000000oGmsQAE');
        return caseCmnt;
    }
    
    public static WorkOrder__x getWorkOrdrExRecord(){
        
        WorkOrder__x workordr = new WorkOrder__x (CaseId__c = '5007E000006OyrBQAS',Status__c = 'test',Categories_c__c = 'test category',SAP_ServiceOrderType_c__c = 'test SAP service order type',SubCategory_c__c = 'test sub-category',Subject__c = 'test subject', ExternalId = '0WO3E000000D8GsWAK');
        return workordr ;
    }
    
    public static ProductConsumed__x getProdConsumedExRecord(){
        
        ProductConsumed__x prodConsumed = new ProductConsumed__x (WorkOrderId__c = '0WO3E000000D8GsWAK',QuantityConsumed__c = 2 , ExternalId = '0Gv7E0000004DGYSA2');
        return prodConsumed ;
    }
    
    public static ServiceAppointment__x getServiceAppointmentExRecord(){
        
        ServiceAppointment__x serviceAppoint = new ServiceAppointment__x(WorkOrder_c__c = '0WO3E000000D8GsWAK',Description__c = 'test description',Status__c = 'test status', ExternalId = '08p6E0000004OYiQAM');
        return serviceAppoint ;
    }
}