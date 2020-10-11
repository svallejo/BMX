trigger Investigation_Eu_Mirupdate on CMPL123CME__Investigation__c (after insert,after update) {

    List<CMPL123CME__EU_MIR__c> EUMIRListupdt= new List<CMPL123CME__EU_MIR__c>();
    map<Id,CMPL123CME__Investigation__c> Inv_Code_Choice_1Map= new map<Id,CMPL123CME__Investigation__c>();
    string choice1;
    string choice2;
    string choice3;
    string choice4;
    string choice5;
    string choice6;
    List<Id> MIRId= new List<Id>();
    for(CMPL123CME__Investigation__c inv:Trigger.new)
    {   
        if(inv.CMPL123_WF_Status__c  == 'Closed - Done'){
            
            MIRId.add(inv.EU_MIR__c);
            if(inv.B_Investigation_Type_Code_Choice_1__c!=null && inv.B_Investigation_Type_Code_Choice_1__c!='')
            {
                choice1=inv.B_Investigation_Type_Code_Choice_1__c;
            }
            
            if(inv.B_Investigation_Type_Code_Choice_2__c!=null && inv.B_Investigation_Type_Code_Choice_2__c!='')
            {
                choice2=inv.B_Investigation_Type_Code_Choice_2__c;
            }
            
            if(inv.B_Investigation_Type_Code_Choice_3__c!=null && inv.B_Investigation_Type_Code_Choice_3__c!='')
            {
                choice3=inv.B_Investigation_Type_Code_Choice_3__c;
            }
            
            if(inv.B_Investigation_Type_Code_Choice_4__c!=null && inv.B_Investigation_Type_Code_Choice_4__c!='')
            {
                choice4=inv.B_Investigation_Type_Code_Choice_4__c;
            }
            
            if(inv.B_Investigation_Type_Code_Choice_5__c!=null && inv.B_Investigation_Type_Code_Choice_5__c!='')
            {
                choice5=inv.B_Investigation_Type_Code_Choice_5__c;
            }
            if(inv.B_Investigation_Type_Code_Choice_6__c!=null && inv.B_Investigation_Type_Code_Choice_6__c!='')
            {
                choice5=inv.B_Investigation_Type_Code_Choice_6__c;
            }
        }
    }
    List<CMPL123CME__EU_MIR_Code_Choices__c> cdchoicelist= new List<CMPL123CME__EU_MIR_Code_Choices__c>();
    if(choice1!=null && choice1!='')
    {
        string Choice='choice 1';
        string code= choice1.substring(0,3);    
        List<CMPL123CME__EU_MIR_Code__c> codelist=[select id,name,CMPL123CME__Name_With_Code__c from CMPL123CME__EU_MIR_Code__c where name=:code ];     
        for(CMPL123CME__EU_MIR_Code__c cd:codelist)
        {
            CMPL123CME__EU_MIR_Code_Choices__c cdchoice= new CMPL123CME__EU_MIR_Code_Choices__c();
            cdchoice.Name='B-Investigation Type Code'+' '+'-'+' '+Choice+' '+'-'+' '+cd.name;
            cdchoice.CMPL123CME__Choice__c=Choice;
            cdchoice.CMPL123CME__Related_EU_MIR_Code__c=cd.Id;
            cdchoice.CMPL123CME__Related_EU_MIR__c=MIRId[0];
            cdchoicelist.add(cdchoice);
        }
    }
    if(!cdchoicelist.isEmpty())
    {
        insert cdchoicelist;
    }
 }