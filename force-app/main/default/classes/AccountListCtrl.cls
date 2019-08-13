public class AccountListCtrl {
    @AuraEnabled
    public static List<Account> getAccounts(){     
        List<Account> accList = [Select Id, Name, AccountNumber, AccountSource, Site, AnnualRevenue, NumberOfEmployees from Account];
        return accList;
    }
    
    @AuraEnabled
    public static List<Account> findByName(String searchKey, Account[] accList) {
        Set<Id> recordIds = new Map<Id, Account>(getAccounts()).keySet();
        system.debug('ACCOUNT LIST' + accList);
        String name = '%' + searchKey + '%';
        return [Select Id, Name, AccountNumber, AccountSource, Site, AnnualRevenue, NumberOfEmployees from Account WHERE (Name LIKE :name OR AccountNumber LIKE :name OR Site LIKE :name OR AccountSource LIKE :name) AND Id IN:recordIds LIMIT 50];
    }
}