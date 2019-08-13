//This trigger is not allowing me to save Clone opportunity Records Related to Account
trigger FindDupeByName on Account (Before insert, Before Update) {
    set<string> Dupe=new set<string>();
    For(Account ac: Trigger.new){
        Dupe.add(ac.name);
        }
    list<Account> accli = [Select id, name from account where name =:Dupe];
    For(account ac: Trigger.new){
        If(accli.size()>0){
        ac.name.AddError('Account name alerady exist');
        }
    }                                                
}