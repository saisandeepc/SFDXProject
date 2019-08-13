/**
#
#
#
#
**/

@isTest
private class TestCepTrainAssig1Cont{
    
    static testMethod void SaveContactRecord(){
        
        /* Creating Test Data */
        Account a = new Account();
        a.Name='TestAccount';
        Insert a;
        
        /**Inserting Retated contact**/
        Contact c = new Contact();
        c.LastName = 'TestContact';
        c.Accountid = a.id;
        insert c;
         
        /** Calling Constructor **/        
        CepTrainAssig1Cont cep = new CepTrainAssig1Cont();
        
        /** Validate for Expected Result **/
        System.assertEquals(cep.accList.Size(), 1);
        
        /**Calling method**/
        cep.getAccountlist();
        /**Assigning value to selected account**/             
        cep.SelectedAccount = a.id;
        cep.relatedContactRecs(); 
        
        /** Validate for Expected Result **/
        System.assertEquals(cep.searchResult.Size(), 1);
        
       // System.assertEquals(expected, actual);        
    }

}