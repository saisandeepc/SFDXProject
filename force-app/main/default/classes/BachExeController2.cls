Public class BachExeController2 {
    List<StudentApex__c> studentsList=new List<StudentApex__c>(); 
    
    public PageReference MyMethod() {     
         VFButtonBatchClass bcn = new VFButtonBatchClass(studentsList);
         Database.executeBatch(bcn,60);
        return null;
    }
}