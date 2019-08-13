Trigger AccountPhoneUpdate  on account( after update){
    set<id> accid =new set<id>();
    For(Account a : trigger.new){
        If(trigger.oldmap.get(a.id).phone != a.Phone){
            accid.add(a.id);
            }
    }
    list<contact> ContacttoUpdate = [select id,name,phone,accountid from contact where accountid=:accid ];
    
    For(Contact c : ContacttoUpdate){
       c.phone=Trigger.newmap.get(c.accountid).phone;  
    }
    Update ContacttoUpdate;
}