trigger t1 on Contact (before insert,before update) {

for(contact c : trigger.new)
        {
        if(c.email != null && c.phone!=null)      
        c.ISVALIDCONTACT__c=true;        
  
        if( c.email == null || c.phone==null)
        c.ISVALIDCONTACT__c=false;

        }
}