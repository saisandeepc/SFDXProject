Trigger Same2 on Contact(Before Update, after update ){
for (Contact c : Trigger.newMap.values()) {  
  if (Trigger.oldMap.get(c.id).LastName != Trigger.newMap.get(c.id).LastName) {
    c.Lastname.adderror('Do not change last name');
    System.debug('=== the last name has changed!!');
    //handle the name change somehow   
  }
 }
}