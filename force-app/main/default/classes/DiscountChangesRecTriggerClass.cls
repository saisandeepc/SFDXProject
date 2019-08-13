Public class DiscountChangesRecTriggerClass{
    Public static void DiscountChange(list<Opportunity> NewOpp, Map<Id,Opportunity> OldMapOpp){
    
    list<Discount_Change__c> lidc = new list<Discount_Change__c>();
    
     for(Opportunity opp: NewOpp){
        // This is a way to get old record  values using oldmap(as map contain key(id) and value(records)
        if(OldMapOpp.get(opp.id).Discount__c != opp.Discount__c){           
            Discount_Change__c dc=new Discount_Change__c();
            dc.Previous_Discount__c=OldMapOpp.get(opp.id).Discount__c;
            dc.Current_Discount__c=opp.Discount__c;
            dc.Opp_Discount_Changed__c=opp.id;
            lidc.add(dc);
            system.debug('Discount_Change__c_________'+dc);           
        } 
    }
    system.debug('lidc_________'+lidc);
    insert lidc ;// Why DML is outside of loop? 
    }
}