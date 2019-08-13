public class CE2 {// Practice org sc1 Controller No Need of Declaring Get Method
    public CE2(ApexPages.StandardController controller) {
  //  greeting='Click';
   // display='change';
    }
  public string greeting{get;set;}
  public string display{get;set;}

  public pagereference display()
  {
  greeting=display;
  return null;
  }
  }