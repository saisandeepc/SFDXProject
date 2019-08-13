//contactInfo Vf Page Controller 

public with sharing class CepTrainContactInfoController {

    public String lastname { get; set; }
    public String pgtitle { get; set; }
    public List<Contact> conList { get; set; }    
    
    
    public void saveContactRecord() {
    
        Contact con = new Contact();
        con.LastName = lastname;
        con.title = pgtitle;
        Database.SaveResult dsr;
        try{
        dsr = Database.insert(con); // 
        }Catch(Exception e){
            System.debug('==DML Exception='+e);
        }
        if(dsr.isSuccess()){      
             
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.CONFIRM,'Contact record crearted'));  
          /*ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.INFO,'Info Message'));
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.WARNING,'Worning Message'));
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR,'Error Message'));
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.FATAL,'Fatel Message'));*/

        }
                          
    }
    
    public void searchContactRecords(){
    
        conList = new List<Contact>();
        //Querrying owner of Contact[Select LastName,c.Owner.Email, c.Owner.Name, c.Owner.Username, c.OwnerId From Contact c]
        conList = [Select LastName,Email,CreatedDate,c.Owner.Name From Contact c WHERE LastName =:lastname ];  
        
    }
}