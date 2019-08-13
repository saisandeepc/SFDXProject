trigger DiscountChangeRec on Opportunity (after update) {
    list<Opportunity> NewOpp =Trigger.new;
    Map<Id,Opportunity> OldMapOpp =Trigger.oldMap;
    DiscountChangesRecTriggerClass.DiscountChange(NewOpp,OldMapOpp);//NameofClass:DiscountChangesRecTriggerClass
}//TestClass=TestDiscountChangesRecTriggerClass