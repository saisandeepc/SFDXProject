public with sharing class Extension2 {

    public Extension2(ApexPages.StandardController controller) {
        system.debug('in EXT COnstr 2');
    }

     public void sampleAction(){
         system.debug('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSS in ext 2');
     }
     
    public Integer myVar {
               get { 
                   system.debug('SSSSSSSSSSSSSSSSS 2222');
                   myVar = 1212121;
                   return myVar; 
               }
               set { 
                   System.debug('myVar set to ' + myVar);
                   //myVar = 1;  
               }
           }     
}