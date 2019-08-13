Public class NewCustomerEmail implements Schedulable  {

//EmailClass For NewCustomerEmail
   public static void execute(SchedulableContext sc){
  //New instance of a single email message
 EmailTemplate templateId = [Select id from EmailTemplate where name = 'Sales: New Customer Email'];
List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
 
// Who you are sending the email to
   mail.setTargetObjectId(UserInfo.getUserId());

   // The email template ID used for the email          
    mail.setTemplateID(templateId.Id); 
    mail.setSaveAsActivity(false);
    allmsg.add(mail);  
 
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }  
}