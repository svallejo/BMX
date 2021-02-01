public class EU_MIR_InvestigationHandler {
    
    public static void populateInvistigationId(List<CMPL123CME__EU_MIR__c> newList){
    
        try 
        {
            Set<Id> complaintIds = new Set<Id>(); 
            for(CMPL123CME__EU_MIR__c mir:newList){
                 if(mir.CMPL123CME__Complaint__c !=null && (mir.CMPL123CME__Type_Of_Report__c == 'Initial'|| mir.CMPL123CME__Type_Of_Report__c=='Follow up') ){
                    System.debug('@@@@@'+' Inside the initial loop');
                    complaintIds.add(mir.CMPL123CME__Complaint__c);
                    //cmptmap.put(mir.CMPL123CME__Complaint__c,mir.Id);
                 }

            }
            
            system.debug('MSR::complaintIds...'+complaintIds);
            
            if(!complaintIds.isEmpty())
            {
                Map<Id, Id> complainIdToInvstIdMap = new Map<Id, Id>();
                for(CMPL123CME__Investigation__c inv:[SELECT Id,CMPL123CME__Complaint__c,EU_MIR__c,CMPL123_WF_Status__c FROM CMPL123CME__Investigation__c WHERE (NOT CMPL123_WF_Status__c like '%Closed%') AND CMPL123CME__Complaint__c IN:complaintIds]){
                    complainIdToInvstIdMap.put(inv.CMPL123CME__Complaint__c, inv.Id);
                }
                if(!complainIdToInvstIdMap.isEmpty()){
                    List<CMPL123CME__Investigation__c> invstList = new List<CMPL123CME__Investigation__c>();
                    List<CMPL123CME__EU_MIR__c> eumirList = new List<CMPL123CME__EU_MIR__c>();
                    for(CMPL123CME__EU_MIR__c mir:newList){
                        if(mir.CMPL123CME__Complaint__c !=null && (mir.CMPL123CME__Type_Of_Report__c == 'Initial'|| mir.CMPL123CME__Type_Of_Report__c=='Follow up')){
                        
                            invstList.add(new CMPL123CME__Investigation__c(Id = complainIdToInvstIdMap.get(mir.CMPL123CME__Complaint__c), EU_MIR__c = mir.Id));
                            
                            eumirList.add(new CMPL123CME__EU_MIR__c(Id = mir.Id, Investigation_Evaluation__c = complainIdToInvstIdMap.get(mir.CMPL123CME__Complaint__c)));
                        }
                    }
                    if(!eumirList.isEmpty())
                       update eumirList;
                    if(!invstList.isEmpty())
                        update invstList;
                }
            }
        } catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
    
    }
    
    
 }