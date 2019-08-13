// Handelar class Because this can be used in VF,trigger
public class InsertRecordClass {	 
    Public static string accountRecords(Account acc){ 
        String Message;
      try{                   
        Insert  acc; 
       If(Acc.id != Null){
        Message ='Successful';
        }
        }Catch(Exception e){
         Message = e.getmessage();          
       System.debug('====Account====='+e);        
        }           
     //   PageRef =New PageReference('/'+Acc.id);  //Url passing 
        return Message;
        }  
    Public static string ContactRecords(Contact co){ 
        String Message;
      try{                  
        Insert  co; 
       If(co.id != Null){
        Message ='Successful';
        }
        }Catch(Exception e){
         Message = e.getmessage();          
       System.debug('====contact====='+e);        
        }           
     //   PageRef =New PageReference('/'+Acc.id);  //Url passing 
        return Message;
        }  
    }