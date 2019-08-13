public class NonRelatedContactApexClass {
    public list<Contact> nlist ;
    public list<ContactRelatedClass> Allrec{get;set;}
    public list<Contact> ListCont {get;set;}
    
    public string  Accid = apexpages.currentpage().getparameters().get('id');
    // System.debug('Accid___________'+Accid);
    // This acts as  a constructor in VF page
    public NonRelatedContactApexClass(ApexPages.StandardController controller) {    
        Allrec = new list<ContactRelatedClass>();
        ListCont =new list<Contact>();    
        nlist = [Select id,FirstName,LastName,Accountid from contact where accountid=null];   
        Relate();
    } 
    public void Relate(){    
        for(Contact co: nlist ){
            ContactRelatedClass Clr=new ContactRelatedClass(); 
            Clr.check=false;  
            Clr.cot=co;
            Allrec.add(Clr);
        }
    }
    Public void NewMethod(){   
    ListCont = new list<Contact>();
        for(ContactRelatedClass NeCo : Allrec){
            If(NeCo.check == True){
            NeCo.cot.Accountid =Accid ;
                ListCont.add(NeCo.cot);
                           
                //System.debug('NeCo ___________'+NeCo );  
        }
    }
    update ListCont;
    System.debug('Allrec___________'+Allrec);
    System.debug('ListCont___________'+ListCont);
    }
}