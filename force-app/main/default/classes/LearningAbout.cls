public class LearningAbout {
    Public String Exce{get;Set;}
   
    Public PageReference InsertRecords(){
    //Inserting contact record
    Account a= new Account();
    a.Name='Sandeep1';
    exce=InsertRecordClass.AccountRecords(a);   
    System.debug('====AccountRecord===='+a); 
    
    //Inserting contact record
    contact c = new contact();
    c.LastName='SandeepContact2'; 
    c.MobilePhone='1234567890';   
     exce=exce+'-----s'+InsertRecordClass.ContactRecords(c);     
     System.debug('====ContactRecord===='+c);
        return Null;
 }        
}