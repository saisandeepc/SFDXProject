/*
 * Description: This class is used to implument barun sir methods.
 */
public class BarunClass {
    
    // This method Will return only attachment and file supported object name and label map and excludes allready selected objects
    public static List<MyWrapperClass.SelectListInner> getFileSupportedObjects(){
        
          /*
        String pName;
        if(providerId != null && providerId != ''){
             //pName = [SELECT Name FROM Cloud_Storage_Provider__c WHERE Id =:providerId].Name;
        }     
        
     
        //Exclude objects that are already setup in custom settings
        for(Xfile_Manage_Folder_Hierarchy__c fh : Xfile_Manage_Folder_Hierarchy__c.getAll().values()){
           
           if(fh.Is_Active__c){
               if(fh.Provider_Name__c == pName){
    
                   XfileWrapperController.SelectListInner inn = new XfileWrapperController.SelectListInner();
                   inn.label =  Schema.getGlobalDescribe().get(fh.Name).getDescribe().getLabel();
                   inn.value = fh.Name;
                   inn.isExist = true;
                   sObjectList.add(inn);
                   
               }
    
               excludeObjectsSet.add(fh.Name.toLowerCase());
           }    
                             
       }*/
       
        List<MyWrapperClass.SelectListInner> sObjectList = new List<MyWrapperClass.SelectListInner>();
        Set<String> excludeObjectsSet = XfilesStatic.EXCULDE_OBJECT_SET;
        
        List<Map<String, String>> fileSupportedObjectMap = new List<Map<String, String>>();
        
        Set<Schema.SObjectType> attachableTypes =  new Set<Schema.SObjectType>(Schema.SObjectType.attachment.fields.parentId.getReferenceTo());
        
        Map<String,Schema.SObjectType> shemaDet = Schema.getGlobalDescribe();
        
        Map<String, String> labelApiMap = new Map<String, String>();
        
        for(String obj : shemaDet.keySet()){
            Schema.DescribeSObjectResult r = Schema.getGlobalDescribe().get(obj).getDescribe();
            if(!excludeObjectsSet.contains(r.getName().toLowerCase()) && (attachableTypes.contains(r.getSobjectType()) || r.isFeedEnabled())){
                MyWrapperClass.SelectListInner inn = new MyWrapperClass.SelectListInner();
                inn.label =  r.getLabel();
                inn.value = r.getName();
                inn.isExist = false;
                sObjectList.add(inn);
            }    
            
        } 
        
        // Sort the object list
        Map<String ,MyWrapperClass.SelectListInner> objDetMap = new Map<String, MyWrapperClass.SelectListInner>();
        List<String> objNameList = new List<String>();
        
        for(MyWrapperClass.SelectListInner inn : sObjectList){
            
            objNameList.add(inn.label);
            objDetMap.put(inn.label, inn);
        } 
        
        objNameList.sort();
        sObjectList = new List<MyWrapperClass.SelectListInner>();
        for(String objnm : objNameList){
            sObjectList.add(objDetMap.get(objnm)); 
        }
        System.debug('----sObjectList--'+sObjectList);
        return sObjectList;
    }
}