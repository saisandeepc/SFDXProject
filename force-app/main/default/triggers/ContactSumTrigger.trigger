trigger ContactSumTrigger on Contact (after delete, after insert, after undelete, after update) {
    //con contain list of old and new contact records
    list<Contact> cons;
    if (Trigger.isDelete) 
        cons = Trigger.old;
    else
        cons = Trigger.new;
    system.debug('01cons++++++++'+cons);     
    // get list of accounts
    //acctIds hold all contact id's(All contact records) related to account
    // Set of ID new instance
    Set<ID> acctIds = new Set<ID>();
    for (Contact con : cons) {
        acctIds.add(con.AccountId);
    }    
    system.debug('02acctIds ++++++++'+acctIds );     
    Map<ID, Contact> contactsForAccounts = new Map<ID, Contact>([select Id,AccountId from Contact where AccountId in :acctIds]);//Accounts Related contacts
    system.debug('03contactsForAccounts++++++++'+contactsForAccounts );
    Map<ID, Account> acctsToUpdate = new Map<ID, Account>([select Id,Total_No_of_Related_Contact_s__c from Account where Id in :acctIds]);
    system.debug('04acctsToUpdate ++++++++'+acctsToUpdate );                                                             
    for (Account acct : acctsToUpdate.values()) {
        Set<ID> conIds = new Set<ID>();
        for (Contact con : contactsForAccounts.values()) {
            if (con.AccountId == acct.Id){
                conIds.add(con.Id);
            }
        }
        system.debug('05conIds ++++++++'+conIds );    
        if (acct.Total_No_of_Related_Contact_s__c != conIds.size()){
            acct.Total_No_of_Related_Contact_s__c = conIds.size();
        }        
    }    
    update acctsToUpdate.values();
    system.debug('06acctsToUpdate ++++++++'+acctsToUpdate);
}