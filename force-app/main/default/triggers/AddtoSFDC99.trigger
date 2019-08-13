//Trigger will automaticaly relate contact to AddtoSFDC99  Account
trigger AddtoSFDC99 on Contact (before insert) {
for(contact c : trigger.new){
  
    c.accountid='0012800000kxafF';
    
    }
}