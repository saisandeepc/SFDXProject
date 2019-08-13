@isTest 
public class TestDiscountChangesRecTriggerClass{
    static testMethod void testDiscountChanges() {
        
        list<Opportunity> AllOpp = new list<Opportunity>();        
        // Let's create our records from scratch!
        for(Integer i=0;i<200;i++){ 
            Opportunity TeOpp = new Opportunity ();
            TeOpp.Name='Test Opportunity'+i;
            TeOpp.CloseDate=date.today()+10;
            TeOpp.StageName='Prospecting';
            TeOpp.Discount__c=10;                            
            AllOpp.add(TeOpp);
        } 
        insert AllOpp ;                          
        // AllOpp=[Select id,Name,CloseDate,Discount__c from Opportunity]; No need of SOQL
        for(Opportunity opp : AllOpp){
            opp.Discount__c =15;
        }
        update AllOpp ;                               
    }              
    
}