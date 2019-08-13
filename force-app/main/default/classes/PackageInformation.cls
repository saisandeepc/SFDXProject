public class PackageInformation {
   
    public String display { get; set; }
    
    list<Package__c> pak=new list<Package__c>();//2.LIST OF PACKAGES INSTANCE
    
     public PackageInformation(){
        pak=[select Destination__c,name,Cost__c,Expired__c,Seats__c from Package__c where Expired__c=false];//4.Constructor
     }   
    
    public list<Package__c> getAvailablePackages(){
        return pak;                                        //3.Property get method
    }
     
    public PageReference AvailablePackages() {
    pak=[select Destination__c,name,Cost__c,Expired__c,Seats__c from Package__c where Expired__c=false];//Command Button Method(output)//7//
        return null;
    }
    
    public PageReference ExpiredPackages() {
    pak=[select Destination__c,name,Cost__c,Expired__c,Seats__c from Package__c where Expired__c=true]; //Command Button Method(output)//8//      
        return null;
    } 
     public PageReference search() {
     
     String query='select id,Package__c.Destination__c,Package__c.name,Package__c.Cost__c,Package__c.Expired__c,Package__c.Seats__c  from Package__c where Package__c.Destination__c like \'%'+Display+'%\'';          
     system.debug('query++++++++++++'+query);
    pak=Database.query(query);
        return null;
    }          
}