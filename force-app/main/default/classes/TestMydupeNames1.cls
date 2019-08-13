@istest
public class TestMydupeNames1{
    static testmethod void TestDupes(){
        //Create Records from scratch
       contact c = new contact();
       c.FirstName = 'SFDC';
       c.LastName = 'David';
       c.Email = 'sfdcdavid@gmail.com';
       insert c;
        //Create dupe lead
        Lead dupeLead      = new Lead();
        dupeLead.FirstName = 'SFDC';
       dupeLead.LastName  = 'David';
       dupeLead.Company   = 'Golden State Warriors';  
        try{
            insert dupeLead ;
        }
        catch(Exception e){
            system.debug('Expected Error');
        }
        // Try to find dupe lead
        list<lead> dupe =[select id from lead where LastName='David'];
        System.assertEquals(0, dupe.size());
        
        //time to break Trigger by inserting NON-Dupe
        lead NonDupe = new lead();
        NonDupe.LastName='SFDCLearner';
        NonDupe.Company='CloudE';
        NonDupe.Status='Open - Not Contacted';
        Insert NonDupe;
        
        // Try to find dupe lead
        list<lead> a=[select id from lead where LastName='SFDCLearner'];
        System.assertEquals(1, a.size());
    }
    }