public class MixedObjectVFController {

public static List<List<String>> getObjectList(){
  List<List<String>> strList = new List<List<String>>();
    List<Employee__c> emp= [select name,Name__c,Number_of_Employees__r.Department_Code__c from Employee__c ORDER BY Name ASC];

    for(Employee__c em : emp){
        List<String> tempList = new List<String>(); 
        tempList.add(em.name);
        tempList.add(em.Name__c);
        tempList.add(em.Number_of_Employees__r.Department_Code__c );
        strList.add(tempList);
    }
    return strList;
} }