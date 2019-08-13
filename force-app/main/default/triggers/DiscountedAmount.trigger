trigger DiscountedAmount on Opportunity (Before Insert,Before Update) {
For(Opportunity opp : trigger.new){
if(opp.Discount__c  == Null){
 opp.Discount__c =0;//In order to overcome null point exception we need to assign 0  to Discount__c
 }
if(opp.Amount != Null ){
 opp.Discounted_Amount__c=(opp.Amount -(opp.Amount *(opp.Discount__c*1/100)));
} 
}
}