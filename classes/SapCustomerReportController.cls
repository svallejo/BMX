public class SapCustomerReportController {
    private static final String TWD_ROLE_CHANGE_COORDINATOR = 'Change Coordinator';
    public Boolean isUserCoordinatorOrOwner {get;set;}
    
    public SapCustomerReportController(){
        
    }
    
    @AuraEnabled
    public static Boolean doesUserHaveAccess(Id userId, Id recordId){
        String twdRole = [Select id, twd_role__c from User where id=:userId].twd_role__c;
        boolean isCoordinator = twdRole == null ? false : twdRole.equals(TWD_ROLE_CHANGE_COORDINATOR);
        CMPL123QMS__Change_Control__c cc = [select id, Change_Owner__c  from CMPL123QMS__Change_Control__c where id=:recordId];
        boolean isOwner = userId.equals(cc.Change_owner__c);
        System.debug('is coord ' + isCoordinator);
        System.debug('is owner ' + isOwner);

        return isCoordinator || isOwner;
    }
}