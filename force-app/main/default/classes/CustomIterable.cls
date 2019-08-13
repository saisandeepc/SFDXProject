global class CustomIterable 
   implements Iterator<StudentApex__c>{ 

   List<StudentApex__c> accs {get; set;} 
   Integer i {get; set;} 

   public CustomIterable(){ 
        System.debug('CustomIterable +++++++++');
       //accs = [Select Name,Student_Name__c,DOB__c from StudentApex__c]; 
       accs = new List<StudentApex__c>();
       for(integer x=0;x<200;x++){
           accs.add(new StudentApex__c());
       }
       i = 0; 
   }   

   global boolean hasNext(){ 
       if(i >= accs.size()) {
           return false; 
       } else {
           return true; 
       }
   }    

   global StudentApex__c next(){ 
       // 8 is an arbitrary 
       // constant in this example
       // that represents the 
       // maximum size of the list.
       if(i == 200){return null;} 
       i++; 
       return accs[i-1]; 
   } 
}