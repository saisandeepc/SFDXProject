public class AngularController {

/* Remote action method is always static because it only performs actions specified in vf page all date is stored locally */
    @RemoteAction
    Public static accountResult displayName(string name,string phone){
    System.debug('name++++'+name);
    System.debug('Phone++++'+phone);
    accountResult ac= new accountResult();
    ac.Name=name;
    ac.RollNo=phone;
    return ac;
    }
     @RemoteAction
    Public static string readAccount(string JSONData){
        accountResult accres = (accountResult)JSON.deserializeStrict(
        JSONData,
        accountResult.class);
        System.debug('accres.Name========'+accres.Name);
    return JSONData;
    }
    public class accountResult{
        public String Name;
        public String RollNo;        
    }
}