public class MyHelloWorld
{
public void displayHelloWorld(List<Account> accs)//Instance method 
    {
    for (Account a:accs)
    {
    if (a.Hello__c != 'World')
    {
    a.Hello__c = 'World';//Try to update record it will throw error message because of after trigger
    }
}
}
}