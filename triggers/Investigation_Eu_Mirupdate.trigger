trigger Investigation_Eu_Mirupdate on CMPL123CME__Investigation__c (after insert,after update) {

    List<CMPL123CME__EU_MIR__c> EUMIRListupdt= new List<CMPL123CME__EU_MIR__c>();
    map<Id,CMPL123CME__Investigation__c> Inv_Code_Choice_1Map= new map<Id,CMPL123CME__Investigation__c>();

    List<Id> MIRId= new List<Id>();
    LIst<string> choice_code= new List<String>();
    
    
    for(CMPL123CME__Investigation__c inv:Trigger.new)
    {   
        if(inv.CMPL123_WF_Status__c  == 'Closed - Done'){
            
            MIRId.add(inv.EU_MIR__c);
            if(inv.B_Investigation_Type_Code_Choice_1__c!=null && inv.B_Investigation_Type_Code_Choice_1__c!='')
            {
                choice_code.add('Choice 1' + inv.B_Investigation_Type_Code_Choice_1__c);
            }
            
            if(inv.B_Investigation_Type_Code_Choice_2__c!=null && inv.B_Investigation_Type_Code_Choice_2__c!='')
            {
                choice_code.add('Choice 2' + inv.B_Investigation_Type_Code_Choice_2__c);
            }
            
            if(inv.B_Investigation_Type_Code_Choice_3__c!=null && inv.B_Investigation_Type_Code_Choice_3__c!='')
            {
                choice_code.add('Choice 3' +inv.B_Investigation_Type_Code_Choice_3__c);
            }
            
            if(inv.B_Investigation_Type_Code_Choice_4__c!=null && inv.B_Investigation_Type_Code_Choice_4__c!='')
            {
                choice_code.add('Choice 4' +inv.B_Investigation_Type_Code_Choice_4__c);
            }
            
            if(inv.B_Investigation_Type_Code_Choice_5__c!=null && inv.B_Investigation_Type_Code_Choice_5__c!='')
            {
                choice_code.add('Choice 5' +inv.B_Investigation_Type_Code_Choice_5__c);
            }
            if(inv.B_Investigation_Type_Code_Choice_6__c!=null && inv.B_Investigation_Type_Code_Choice_6__c!='')
            {
                choice_code.add('Choice 6' +inv.B_Investigation_Type_Code_Choice_6__c);
            }
        }
        
    }
    //system.debug('MS::::'+choice_code[0].substring(8,12));
    List<CMPL123CME__EU_MIR_Code_Choices__c> cdchoicelist= new List<CMPL123CME__EU_MIR_Code_Choices__c>();
    map<string,string> choicecodmap= new map<string,string>();
    if(!choice_code.isEmpty())
    {
        for(string str:choice_code)
        {
        
            choicecodmap.put(str.substring(8,12).trim(),str.substring(0,8));
        }
        
        List<CMPL123CME__EU_MIR_Code__c> codelist=[select id,name,CMPL123CME__Name_With_Code__c from CMPL123CME__EU_MIR_Code__c where name IN:choicecodmap.keyset()];      
        system.debug('MS::codelist::'+codelist);
        for(CMPL123CME__EU_MIR_Code__c cd:codelist)
        {
            CMPL123CME__EU_MIR_Code_Choices__c cdchoice= new CMPL123CME__EU_MIR_Code_Choices__c();
            cdchoice.Name='B-Investigation Type Code'+' '+'-'+' '+choicecodmap.get(cd.name)+' '+'-'+' '+cd.name;
            cdchoice.CMPL123CME__Choice__c=choicecodmap.get(cd.name);
            cdchoice.CMPL123CME__Related_EU_MIR_Code__c=cd.Id;
            cdchoice.CMPL123CME__Related_EU_MIR__c=MIRId[0];
            cdchoicelist.add(cdchoice);
        }
    }
    
    system.debug('MS::cdchoicelist::'+cdchoicelist);
    if(!cdchoicelist.isEmpty())
    {
        insert cdchoicelist;
    }
 }