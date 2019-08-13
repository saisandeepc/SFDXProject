@istest
public class TestMydupeNames{
    static testmethod void TestDupes(){
        //Create Records from scratch
       Contact c   = new Contact();
       c.FirstName = 'Stephen';
       c.LastName  = 'David';
       c.Email     = 'stephcurry@gsw.com';
       insert c;
        //Create dupe lead
        Lead dupeLead      = new Lead();
        dupeLead.FirstName = 'David';
       dupeLead.LastName  = 'Curry';
       dupeLead.Company   = 'Golden State Warriors';
       dupeLead.Email     = 'stephcurry@gsw.com';
      
        try{
            insert dupeLead ;
        }
        catch(Exception e){
            system.debug('Expected Error');
        }
        // Try to find dupe lead
        list<lead> dupe =[select id from lead where LastName=:'David'];
        System.assertEquals(0, dupe.size());
        
        //time to break Trigger by inserting NON-Dupe
        lead NonDupe = new lead();
        NonDupe.LastName='SFDCLearner';
        NonDupe.Company='CloudE';
        NonDupe.Status='Open - Not Contacted';
        Insert NonDupe;
        
        // Try to find dupe lead
        list<lead> check =[select id from lead where LastName=:'SFDCLearner'];
        System.assertEquals(1, check.size());
    }
    }