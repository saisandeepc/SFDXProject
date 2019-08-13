public class ExampleController {

   public string currentDateTime{get;set;}
    string testvs;
    
    public void mymethod(){
    system.debug('+++++++testvs+++++++++'+testvs);
    system.debug('=======currentDateTime========='+currentDateTime);
    testvs=currentDateTime;
    }

}