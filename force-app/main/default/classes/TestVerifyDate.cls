/*
 * Description:- This class is used as test class for VerifyDate class
 */
@isTest
public class TestVerifyDate {
	 
    @isTest static void CheckDatesTest(){
        //if date2 is within the next 30 days of date1, use date2.  
        VerifyDate.CheckDates(date.valueOf('2018-06-23'), date.valueOf('2018-06-23'));
        //else 
        VerifyDate.CheckDates(date.valueOf('2018-06-23'), date.valueOf('2018-07-23'));
    }
}