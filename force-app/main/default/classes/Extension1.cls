public with sharing class Extension1 {

    public Extension1(ApexPages.StandardController controller) {
        system.debug('In Constructor');
    }
    
    public Integer myVar {
               get { 
                   system.debug('SSSSSSSSSSSSSSSSS');
                   myVar = 1;
                   return myVar; 
               }
               set { 
                   System.debug('myVar set to ' + myVar);
                   //myVar = 1;  
               }
           }
           
           
     public void sampleAction(){
         system.debug('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS in ext 1');
     }
}