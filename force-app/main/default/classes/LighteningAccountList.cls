public class LighteningAccountList {
	
    @AuraEnabled
    public static List<WrapperController.AccountList> getLigtAccountList(){
      
        List<WrapperController.AccountList> accList = new List<WrapperController.AccountList>();
        
        for(Account  acc : [SELECT Id, Name, Industry, Account_Website__c, CreatedBy.Name, 
                            CreatedDate FROM Account ORDER BY CreatedDate DESC]){
            
            WrapperController.AccountList ac = new WrapperController.AccountList();
            ac.id = acc.Id;
            ac.name = acc.Name;
            ac.industry = acc.Industry;
            ac.accountWebsite = acc.Account_Website__c;
            ac.createdBy = acc.CreatedBy.Name;
            ac.createdDate = String.valueOf(acc.CreatedDate);
                                
            accList.add(ac);
        }
        
        return accList;
    }
}