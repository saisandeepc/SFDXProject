/*
* Description:- This class is test class for TaskUtil
*/ 
@isTest
private class TaskUtilTest {
    
    @isTest static void getTaskPriorityTest(){
        
        String pri;
        
        //Use Case 1
        pri = TaskUtil.getTaskPriority('ca');
        System.assertEquals('High', pri);
        
        //Use Case 2
        pri = TaskUtil.getTaskPriority('sa');
        System.assertEquals('Normal', pri);
         
        //Use Case 3
        pri = TaskUtil.getTaskPriority('');
        System.assertEquals(null, pri);
    } 
}