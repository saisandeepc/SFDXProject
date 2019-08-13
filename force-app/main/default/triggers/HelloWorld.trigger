trigger HelloWorld on Account (before insert, before update)

{
    List<Account> accs = Trigger.new; //Try to update record it will throw error message because of after trigger
    MyHelloWorld my= new MyHelloWorld(); //creating instance of apex class
    my.addHelloWorld(accs); // calling method from the apex class
}