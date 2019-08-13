trigger PopConOwnerEmail on Contact (before insert, before update) {
    
    List<id> ownerids = new List<id>();
    
    for(Contact acc: trigger.new) {
      ownerids.add(acc.ownerid);   
    }
    
    Map<Id, String> mapOwnerEmail = new Map<Id, String>();
    for(User owner: [SELECT id, email FROM User WHERE id IN:ownerids ]) {
      mapOwnerEmail.put(owner.id, owner.email);
    }
    
    for(Contact acc: trigger.new) {
      acc.Email = mapOwnerEmail.get(acc.ownerid);   
    }
}