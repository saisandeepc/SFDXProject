public class TestDog {

    public list<Dog__c> nlist {get;set;}    
    
    public TestDog()
    {
        nlist = new list<Dog__c>();  //New instance   //Constructor
        test();//Calling method 
    }
    
    public void test(){
        
        list<Dog__c> dlist=[Select id,name,Type__c from Dog__c];
        
        list<Dog__c> pdlist= new list<Dog__c>(); 
        list<Dog__c> arlist= new list<Dog__c>(); 
        list<Dog> Allrec= new list<Dog>();  //Will hold all Sobject records 
		for(Dog__c ass: dlist)//As our output(SOQL) is a list for loop will check each and every record based on our criteria
        {
            dog all=new dog();//Instance of dog class
            all.d=ass; //To class varible we are assigning loop variable            
            Allrec.add(all);
                        
            if(ass.type__c=='Street Dog')
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
        system.debug('dlist+++++++'+dlist.size());
   		system.debug('nlist+++++++'+nlist.size());     
        system.debug('pdlist+++++++'+pdlist.size());
        system.debug('arlist+++++++'+arlist.size());
        system.debug('Allrec+++++++'+Allrec.size());
    }
}