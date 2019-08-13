//Wraper Class
public class apexDogObjectRec {

    public list<Dog__c> nlist {get;set;}
    public list<Dog__c> pdlist{get;set;}//Property
    public list<Dog__c> arlist{get;set;}
    public list<Dog> Allrec{get;set;}
    list<Dog__c> dlist=[Select id,name,Type__c from Dog__c];
    
    public apexDogObjectRec()
    {
        nlist = new list<Dog__c>();  //New instance reference to Sobject  
        pdlist= new list<Dog__c>();                  //Constructor
        arlist= new list<Dog__c>();
        Allrec= new list<Dog>();    //New instance reference to Class object Not Sobject
        test();  //Calling Method 
    }
    
    public void test(){     
    for(Dog__c ass: dlist)//As our output(SOQL) is a list. Forloop will check each and every record based on our criteria
        {
            dog all=new dog();//Instance of dog class
            all.d=ass; //To class variable we are assigning loop variable
            Allrec.add(all);    
        if(ass.type__c=='Street Dog') //Condition is specified here
            {
               nlist.add(ass);               
            } 
        else if(ass.type__c=='Pet Dog')
            {
              pdlist.add(ass);  
            } 
             else
            {
              arlist.add(ass);  
            }
         }  
       }
 public PageReference save() {
    system.debug('nlist+++++++++++'+nlist); 
    upsert nlist;
    system.debug('pdlist+++++++++++'+pdlist);
    upsert pdlist;
   // system.debug('arlist+++++++++++'+arlist);
    upsert arlist;
    
        return null;
    }
   }