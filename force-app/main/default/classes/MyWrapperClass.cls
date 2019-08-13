/*
	Description: This is a class used for reaturning inner classes to front end to overcome NameSpace Issues.
*/
 
global class MyWrapperClass {
    
    //Class used to reaturn object list in searting order 
	global class SelectListInner{

        @AuraEnabled global String value;
        @AuraEnabled global String label;
        @AuraEnabled global Boolean isExist;
    } 
    
}