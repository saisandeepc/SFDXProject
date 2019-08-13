trigger AutoContact on Account (after insert) {
    list<contact> contacts = new  list<contact>();
    for(Account ac : trigger.new){
    contact co = new contact();
    co.LastName='TriggerContact';
    co.accountId=ac.id;
    contacts.add(co);
    }
    insert contacts;
}