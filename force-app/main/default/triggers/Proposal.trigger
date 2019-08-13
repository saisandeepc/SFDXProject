trigger Proposal on Contact (before insert,before update) {
  // Step 0: Create a master list to hold the emails we'll send
  List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
  
  for (Contact myContact : Trigger.new) {
  system.debug( 'myContact ++++'+myContact ); 
    if (myContact.Email != null && myContact.FirstName != null) {
      // Step 1: Create a new Email
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
      // Step 2: Set list of people who should get the email
      List<String> sendTo = new List<String>();
      sendTo.add(myContact.Email);
      mail.setToAddresses(sendTo);
 system.debug( 'Set list of people who should get the email++++'+sendTo  );
      // Step 3: Set who the email is sent from
      mail.setReplyTo('saisandeepchilakapati@gmail.com');
      mail.setSenderDisplayName('Apex Trigger on Contact Email');
    
      // (Optional) Set list of people who should be CC'ed
      List<String> ccTo = new List<String>();
      ccTo.add('csaisandeep92@gmail.com');
      mail.setCcAddresses(ccTo);
system.debug( '(Optional) Set list of people who should be CC++++'+ccTo );
      // Step 4. Set email contents - you can use variables!
      mail.setSubject('URGENT BUSINESS PROPOSAL');
      String body = 'Dear ' + myContact.FirstName + ', ';
      body += 'I confess this will come as a surprise to you.';
      body += 'I am John Alliston CEO of the Bank of Nigeria.';
      body += 'I write to request your cooperation in this ';
      body += 'urgent matter as I need a foreign partner ';
      body += 'in the assistance of transferring $47,110,000 ';
      body += 'to a US bank account. Please respond with ';
      body += 'your bank account # so I may deposit these funds.';
      mail.setHtmlBody(body);
    
      // Step 5. Add your email to the master list
      mails.add(mail);
      system.debug( 'Add your email to the master list++++'+mail);
    }
  }
  // Step 6: Send all emails in the master list
  Messaging.sendEmail(mails);
   system.debug( 'Send all emails in the master list++++'+mails);
}