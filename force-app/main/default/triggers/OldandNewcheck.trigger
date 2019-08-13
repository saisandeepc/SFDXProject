Trigger OldandNewcheck on Opportunity(Before insert, Before Update){
    for(Opportunity opp : Trigger.new){
        //Create an old and new map so that we can compare values
        Opportunity oldOpp = Trigger.oldMap.get(opp.ID);    
        Opportunity newOpp = Trigger.newMap.get(opp.ID);
        Decimal oldAmount = oldOpp.Amount;
        Decimal newAmount = newOpp.Amount;
        if(newAmount < oldAmount){
            opp.Amount.adderror('Enter amount more than old amount');
            }
    }
}