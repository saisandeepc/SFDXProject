@isTest
public class AssignmentForTestClassTest {
static testMethod void testResetName() {
    AssignmentForTestClass tc1 = new AssignmentForTestClass();
    tc1.name1 = 'Test1';
    tc1.resetName();
    tc1.name1 = 'Test2';
    tc1.resetName();  
    tc1.name2 = 'Test3';
    tc1.resetName();
  
    tc1.resetName();
}
    
  static testMethod void testProcess() {
    AssignmentForTestClass tc1 = new AssignmentForTestClass();
    //String call= 'Test1';
    tc1.processTest1('Test1');
    tc1.processTest1('Test5');
    tc1.processTest1('Test');
    
}  
    static testMethod void processTest2() {
    AssignmentForTestClass tc1 = new AssignmentForTestClass();
    //String call= 'Test1';
    tc1.processTest2('Test1');
    tc1.processTest2('Test5');
    tc1.processTest2('Test');
}
}