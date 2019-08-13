public class AccountHandler {
    public static Account insertNewAccount(String AccountName){
        Account acct = new Account(Name=AccountName);
        System.debug('acct Value______________'+acct);
        try {      
            //Calling method will Insert Account:-AccountHandler.insertNewAccount('Sandeep');
            Insert acct ;
                } catch (DMLException e){
                return null;
            }
        return acct; 
    }
}