global class VFButtonBatchClass implements Database.Batchable<StudentApex__c> ,  Database.Stateful{
Integer i = 0;
 global VFButtonBatchClass(List<StudentApex__c> myList){
    List<StudentApex__c> studentList = new List<StudentApex__c>(); 
   }
    // Start Method  
    global  Iterable<StudentApex__c> start(Database.BatchableContext info){        
        System.debug('Start+++++++++'+info);
        return new foo();
    }
        
    global void execute(Database.BatchableContext info, list<StudentApex__c> scope){
        List<StudentApex__c> studentList = new List<StudentApex__c>(); 
        for(StudentApex__c a : scope){              
            a.Student_Name__c = 'Sandeep'+i; 
            a.DOB__c =system.today()-9490+i;
			i += 1;
            studentList.add(a); 
        } 
        
        Insert scope;  
        System.debug('scope Size++++++++++++'+scope);
        System.debug('studentList++++++++++++'+studentList);
        System.debug('studentList++++++++++++'+studentList.size());
        //Email Template:ApexBatchStudentDetails
       //  List<StudentApex__c> stList = [Select Name,Student_Name__c, DOB__c,Age_of_Student__c  from StudentApex__c]  ;		
        	StudentApex__c stud = studentList.get(59);
            String body = 'Student details are as follows '  + ', ';
       //   stud.Age_of_Student__c=((system.today()-stud.DOB__c)/365);
       //   body += 'Name= '+stud.Name + '\n';
            body += 'Name= '+stud.Student_Name__c + '\n';
        
            body += 'DOB= '+stud.DOB__c.format()+ '\n';      	
       //	body += 'Age of Student= '+string.valueOf(system.TODAY().daysBetween(stud.DOB__c)/365);
       		body += 'Age of Student= '+((stud.DOB__c).daysBetween(system.TODAY())/365);
        
            List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            // Who you are sending the email to
            mail.setTargetObjectId(UserInfo.getUserId());
            mail.setSubject('Student Details');
            mail.setHtmlBody(body);
            mail.setSaveAsActivity(false);
            allmsg.add(mail);  
            try{
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });       
            system.debug('Student Details============'+studentList);
            System.debug('Body of Email++++++++'+body);
            }catch (Exception e) {system.debug('Exception__________'+e);}    
        }     
        global void finish(Database.BatchableContext info){
        // Logic to be Executed at finish
    }    
}