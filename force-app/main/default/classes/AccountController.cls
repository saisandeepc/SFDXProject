/*
    Description: This class is used for getting accounts.
*/
public class AccountController {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        
        List<Account> accList = new List<Account>();
        
            accList = [SELECT Name FROM Account];
        	System.debug('--accList.size()-------'+accList.size());
        if(accList.size() == 0){
            System.debug('--accList-------'+accList);
          throw new AuraHandledException('accList');  
        }
        
        return accList;
    }
}