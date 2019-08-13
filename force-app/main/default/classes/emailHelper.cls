// In a separate class so that it can be used elsewhere
Global class emailHelper {

public static void sendEmail(ID recipient, ID candidate) {

  //New instance of a single email message
 Messaging.SingleEmailMessage mail = 
            new Messaging.SingleEmailMessage();
 
// Who you are sending the email to
   mail.setTargetObjectId(recipient);

   // The email template ID used for the email
   mail.setTemplateId('00X28000000gSm1');
          
   mail.setWhatId(candidate);    
   mail.setBccSender(false);
   mail.setUseSignature(false);
   mail.setReplyTo('recruiting@acme.com');
   mail.setSenderDisplayName('HR Recruiting');
   mail.setSaveAsActivity(false);  
 
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }  
}