public class LearninngClass1 {
public string Uname{get;set;}
public string Pwd{get;set;}
public string name{get;set;}
Public string ResponseBody{get;set;}

public LearninngClass1(){
//Declaring Map for get parameters
Map<String,String> param=ApexPages.currentPage().getParameters();
system.debug('Pageparameters ====param===='+param);

Uname=param.get('username');
Pwd=param.get('password');
name=param.get('Name');

     // Instantiate a new http object
    Http h = new Http();

     // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://dev1-techblaze.rhcloud.com/api/user');
    req.setMethod('GET');

    // Send the request, and return a response
    HttpResponse res = h.send(req);
    //return res.getBody();
    ResponseBody=res.getBody();
    System.debug('Response Body====='+res.getBody());
    /*
    Visualforce Error
Help for this Page

System.CalloutException: Unauthorized endpoint, please check Setup->Security->Remote site settings. endpoint = https://dev1-techblaze.rhcloud.com/api/user 
Class.LearninngClass1.<init>: line 21, column 1
    */
    String reqBody='{"username":"'+Uname+'","password":"'+Pwd+'"}';
    HttpRequest req2 = new HttpRequest();
    req2.setEndpoint('https://dev1-techblaze.rhcloud.com/api/user');
    req2.setMethod('POST');                        
    req2.setHeader('content-type', 'application/json');
    req2.setBody(reqBody);
    
  //HttpResponse res2 = h.send(req2);
    
  //ResponseBody=reqBody;       
}
}