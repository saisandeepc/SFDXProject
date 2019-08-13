trigger UpdateAccount on Account (after insert){
      for(account a:trigger.new) {                  
           a.Rating='hot';
           a.AccountNumber='123456';
           }
}