trigger DiscountTrigger on Book__c (before insert, before update) {
List<Book__c> books = Trigger.new;
PriceDiscount.applyDiscount(books);//Static method
}