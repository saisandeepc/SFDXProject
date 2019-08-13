/****Controller*******/
public with sharing class CepTrainAssig1Cont {
        
    public List<Account> accList {get;set;}
    public String selectedAccount {get;set;}
    Public List<Contact> searchResult {get;set;}
    
    public CepTrainAssig1Cont() {
        accList =new List<Account>([SELECT ID,Name FROM Account LIMIT 100]);      
      //  accList =[SELECT ID,Name FROM Account LIMIT 10];
        SelectedAccount ='';
    }
    
    public List<SelectOption> getAccountlist() {
    
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','----None---'));
        
        for(Account acli : accList ){
            options.add(new SelectOption(acli.id,acli.Name));
        }
        return options ;
    } 
    
    public void relatedContactRecs(){
    
   // System.debug('In SelectedAccount'+SelectedAccount);    
    searchResult = new List<Contact>();
    searchResult = [SELECT Account.Name,LastName,Email,CreatedDate,c.Owner.Name FROM Contact c WHERE Accountid =: SelectedAccount];
    
    }
}