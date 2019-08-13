/**
#    Test Class for CepTrainContactInfoController    
**/

@isTest
private class testCepTrainContactInfoController {

    static testMethod void contactInfo(){
        
    CepTrainContactInfoController conInfo = new CepTrainContactInfoController();
 
    Contact c = new Contact();
    c.LastName = 'TestContact';
    c.title= 'TestTitle';
    insert c;    
            
    conInfo.saveContactRecord();
    conInfo.searchContactRecords();
    }
}