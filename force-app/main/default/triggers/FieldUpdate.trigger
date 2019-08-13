trigger FieldUpdate on Practice__c (Before Insert, Before Update) {
    For(Practice__c pa:Trigger.new){
        If(pa.Second_Number__c != Null){
            pa.First_Number__c=pa.Second_Number__c; 
         }
    }
}