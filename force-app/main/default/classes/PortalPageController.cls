public class PortalPageController {
    public String username {get; set;}
    public String password {get; set;}
      public PageReference login() {
      // String startUrl = System.currentPageReference().getParameters().get('startURL');
      
       String startUrl='/home/home.jsp';
       System.debug('==UserName==='+username);
       System.debug('==password==='+password);
       PageReference ref = Site.login(username,password,'/apex/PortalPageForUsers');
       System.debug('======ref==='+ref);
       return ref;                                 
   }
}