@isTest
public class Test_LighteningAccountList{
    
    @isTest static void testGetLigtAccountList() { 
     
        Account ac  = new Account();
        ac.Name = 'Test';
        insert ac;
        
        //WrapperController.AccountList 
        LighteningAccountList.getLigtAccountList();
    
    }

}