Global class BachApexEmailuse {
    public static void sendEmail() {
    
    //New instance of a single email message
    EmailTemplate templateId = [Select id from EmailTemplate where name = 'ApexBatchStudentDetails'];
    List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    // Who you are sending the email to
    mail.setTargetObjectId(UserInfo.getUserId());
    
    // The email template ID used for the email
    mail.setTemplateId(templateId.Id);          
    mail.setSenderDisplayName('Email From BatchClass');
    
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }  
}