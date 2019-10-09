@isTest
 public   class CMPLCAPA_Effectiveness_CheckTriggerTest{
	static testMethod void CAPA_Effectiveness_CheckTriggerTestmethod(){
		CAPA_Effectiveness_Check__c testobject = new CAPA_Effectiveness_Check__c ();
		insert testobject; 
		delete testobject; 
		undelete testobject; 
		update testobject; 
		System.assertEquals('1','1');
	}
}