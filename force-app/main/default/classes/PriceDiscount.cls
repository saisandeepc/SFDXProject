public class PriceDiscount {
public static void applyDiscount(List<Book__c> books) //Static method
{
for (Book__c b :books){
b.Price__c *= 0.9;
}
}
}