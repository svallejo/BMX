trigger Investigation_Eu_Mirupdate on CMPL123CME__Investigation__c (after insert,after update) {

    List<CMPL123CME__EU_MIR__c> EUMIRListupdt= new List<CMPL123CME__EU_MIR__c>();
    map<Id,CMPL123CME__Investigation__c> Inv_Code_Choice_1Map= new map<Id,CMPL123CME__Investigation__c>();
    string choice1;
    string choice2;
    string choice3;
    string choice4;
    string choice5;
    string choice6;
    Set<Id> fdchoise1= new Set<Id>();
    Set<Id> fdchoise2= new Set<Id>();
    Set<Id> fdchoise3= new Set<Id>();
    
    Set<Id> RootChoice1= new Set<Id>();
    Set<Id> RootChoice2= new Set<Id>();
    Set<Id> RootChoice3= new Set<Id>();
    
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
                choice6=inv.B_Investigation_Type_Code_Choice_6__c;
            }
            
            if(inv.C_Investigation_Findings_Code_Choice1__c!=null )
            {
                fdchoise1.add(inv.C_Investigation_Findings_Code_Choice1__c);
            }
            
            if(inv.C_Investigation_Findings_Code_Choice2__c!=null )
            {
                fdchoise2.add(inv.C_Investigation_Findings_Code_Choice2__c);
            }
            
            if(inv.C_Investigation_Findings_Code_Choice3__c!=null)
            {
                fdchoise3.add(inv.C_Investigation_Findings_Code_Choice3__c);
            }
            
            if(inv.D_Investigation_Conclusion_Choice1__c!=null)
            {
                RootChoice1.add(inv.D_Investigation_Conclusion_Choice1__c);
            }
            
            if(inv.D_Investigation_Conclusion_Choice2__c!=null)
            {
                RootChoice2.add(inv.D_Investigation_Conclusion_Choice2__c);
            }
            
            if(inv.D_Investigation_Conclusion_Choice3__c!=null)
            {
                RootChoice3.add(inv.D_Investigation_Conclusion_Choice3__c);
            }
            
        }
    }
 
    List<CMPL123CME__EU_MIR_Code_Choices__c> ChoiceCodedelete1=[SELECT Id,Name,CMPL123CME__Related_EU_MIR__c from CMPL123CME__EU_MIR_Code_Choices__c WHERE Name like '%B-Investigation %' and CMPL123CME__Related_EU_MIR__c IN:MIRId];
    List<CMPL123CME__EU_MIR_Code_Choices__c> ChoiceCodedelete2=[SELECT Id,Name,CMPL123CME__Related_EU_MIR__c from CMPL123CME__EU_MIR_Code_Choices__c WHERE Name like '%C-Investigation %' and CMPL123CME__Related_EU_MIR__c IN:MIRId];
    List<CMPL123CME__EU_MIR_Code_Choices__c> ChoiceCodedelete3=[SELECT Id,Name,CMPL123CME__Related_EU_MIR__c from CMPL123CME__EU_MIR_Code_Choices__c WHERE Name like '%D-Investigation %' and CMPL123CME__Related_EU_MIR__c IN:MIRId];
    
    if(!ChoiceCodedelete1.isEmpty())
    {
        delete ChoiceCodedelete1;
    }
    
    if(!ChoiceCodedelete2.isEmpty())
    {
        Delete ChoiceCodedelete2;
    }
    
    if(!ChoiceCodedelete3.isEmpty())
    {
        Delete ChoiceCodedelete3;
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
    
    if(choice2!=null && choice2!='')
    {
        string Choice='choice 2';
        string code= choice2.substring(0,3);    
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
    
    if(choice3!=null && choice3!='')
    {
        string Choice='choice 3';
        string code= choice3.substring(0,3);    
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
    
    if(choice4!=null && choice4!='')
    {
        string Choice='choice 4';
        string code= choice4.substring(0,3);    
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
    
    if(choice5!=null && choice5!='')
    {
        string Choice='choice 5';
        string code= choice5.substring(0,3);    
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
    
     if(choice6!=null && choice6!='')
    {
        string Choice='choice 6';
        string code= choice6.substring(0,3);    
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
    
    if(fdchoise1!=null)
    {
        string Choice='choice 1';
            
        List<CMPL123CME__EU_MIR_Code__c> codelist=[select id,name,CMPL123CME__Name_With_Code__c from CMPL123CME__EU_MIR_Code__c where Id=:fdchoise1];     
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
    
    if(fdchoise2!=null)
    {
        string Choice='choice 2';
            
        List<CMPL123CME__EU_MIR_Code__c> codelist=[select id,name,CMPL123CME__Name_With_Code__c from CMPL123CME__EU_MIR_Code__c where Id=:fdchoise2];     
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
  
    if(fdchoise3!=null)
    {
        string Choice='choice 3';
            
        List<CMPL123CME__EU_MIR_Code__c> codelist=[select id,name,CMPL123CME__Name_With_Code__c from CMPL123CME__EU_MIR_Code__c where Id=:fdchoise3];     
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
    
    if(RootChoice1!=null)
    {
        string Choice='choice 1';
            
        List<CMPL123CME__EU_MIR_Code__c> codelist=[select id,name,CMPL123CME__Name_With_Code__c from CMPL123CME__EU_MIR_Code__c where Id=:RootChoice1];     
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
    
    if(RootChoice2!=null)
    {
        string Choice='choice 2';
            
        List<CMPL123CME__EU_MIR_Code__c> codelist=[select id,name,CMPL123CME__Name_With_Code__c from CMPL123CME__EU_MIR_Code__c where Id=:RootChoice2];     
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
    
    if(RootChoice3!=null)
    {
        string Choice='choice 3';
            
        List<CMPL123CME__EU_MIR_Code__c> codelist=[select id,name,CMPL123CME__Name_With_Code__c from CMPL123CME__EU_MIR_Code__c where Id=:RootChoice3];     
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