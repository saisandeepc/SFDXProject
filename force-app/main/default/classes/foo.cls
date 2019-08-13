global class foo implements iterable<StudentApex__c>{
   global Iterator<StudentApex__c> Iterator(){
     system.debug('Foo Class++++++++++');
      return new CustomIterable();
   }
}