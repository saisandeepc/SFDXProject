trigger HelloWorld_Trigger on Account (before insert,before update) {
    for(account a : trigger.new){
               a.description='new description';
                System.debug('Hello World!');
    }
 
}