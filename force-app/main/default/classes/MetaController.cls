public with sharing class MetaController {
    public static void createRemoteSiteSettings(){   
        MetadataService.MetadataPort service = createService();
        MetadataService.RemoteSiteSetting remoteSiteSettings = new MetadataService.RemoteSiteSetting();
        remoteSiteSettings.fullName = 'SaiEndPont';
        remoteSiteSettings.url = 'http://www.SaiEndPont.com';
        remoteSiteSettings.description='ewf';
        remoteSiteSettings.isActive=true;
        remoteSiteSettings.disableProtocolSecurity=false;
        MetadataService.AsyncResult[] results = service.create(new List<MetadataService.Metadata> { remoteSiteSettings });
        MetadataService.AsyncResult[] checkResults = service.checkStatus(new List<string> {string.ValueOf(results[0].Id)});
        system.debug('chk' + checkResults );
    }
    
    public static MetadataService.MetadataPort createService(){
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;
    }
}