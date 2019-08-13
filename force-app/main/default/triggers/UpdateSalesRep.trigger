trigger UpdateSalesRep on Account (before insert,before update) {
Set<Id> setAccOwner = new Set<Id>();
for(Account Acc: trigger.new)
    {
    setAccOwner.add(Acc.OwnerId);
    }
Map<Id,User> User_map = new Map<Id,User>([select Name from User where id in:setAccOwner]);
 system.debug('User_map +++++++'+User_map );
for(Account Acc: Trigger.new)
    {
    User usr=User_map.get(Acc.OwnerId);
    Acc.sales_Rep__c=usr.Name;
     system.debug('Acc +++++++'+Acc);
    }  
}