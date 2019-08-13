@isTest 
public class TestAccountUpdate {

    static testMethod void UpdateContacts() {
    
    Account a = new Account(name = 'TriggerAccount',phone = '9390494823');          
    Insert a;
    
    Contact c1 = new contact(LastName = 'TriggerContact',AccountId= a.Id,Phone = '9390494823');      
    Contact c2 = new contact(LastName = 'TriggerContact',AccountId= a.Id,Phone = '9390494823'); 
    
    List<contact> cali = new List<contact>();
    cali.add(c1);
    cali.add(c2);
    insert cali;
    
    a.Phone = '9390494824';  
    update a;
                         
    }
}