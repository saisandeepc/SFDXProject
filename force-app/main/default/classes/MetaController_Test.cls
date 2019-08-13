@isTest
private class MetaController_Test{
  @testSetup
  static void setupTestData(){
    test.startTest();
    Account account_Obj = new Account(Name = 'Name792');
    Insert account_Obj; 
    test.stopTest();
  }
  static testMethod void test_createRemoteSiteSettings_UseCase1(){
    List<Account> account_Obj  =  [SELECT Name from Account];
    System.assertEquals(true,account_Obj.size()>0);
    MetaController obj01 = new MetaController();
    MetaController.createRemoteSiteSettings();
  }
  static testMethod void test_createService_UseCase1(){
    List<Account> account_Obj  =  [SELECT Name from Account];
    System.assertEquals(true,account_Obj.size()>0);
    MetaController obj01 = new MetaController();
    MetaController.createService();
  }
}