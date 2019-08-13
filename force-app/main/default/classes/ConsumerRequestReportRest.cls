@RestResource(urlMapping='/ConsumerRequestReportRest/*') 
global without sharing  class ConsumerRequestReportRest{
    
    @HttpPost
    global static String getReport(){
        system.debug('==================Enter the service=======');
        String encodedData;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(req.requestBody.toString());
        system.debug('========m======='+m);
        String encData = String.valueOf(m.get('encryptedData'));
        system.debug('========encData======='+encData);
        if(String.valueOf(m.get('portalName')) == 'CCB'){
            system.debug('========Userinfo get userid====Before Resr======'+UserInfo.getUserId());
            
            
            //pageReference p = new Pagereference('/apex/ConsumerCreditReport?D='+encData);    
            pageReference p = new Pagereference('/apex/CreditReport?D='+encData);
            system.debug('========Userinfo get userid===After Rest======='+UserInfo.getUserId());
            if(!Test.isRunningTest())
                //encodedData = EncodingUtil.urlEncode( p.getContentASPDF().toString(),'UTF-8');
                //encodedData = EncodingUtil.base64Encode( p.getContentASPDF());
                encodedData = EncodingUtil.urlEncode(p.getContent().toString(), 'UTF-8');    
                
                //encodedData = Ep.getContent().toString();    
        }else if(String.valueOf(m.get('portalName')) == 'CIR'){
            pageReference p = new Pagereference('/apex/claimreport?D='+encData);
            if(!Test.isRunningTest())    
                encodedData = EncodingUtil.urlEncode(p.getContent().toString(), 'UTF-8');  
        }
        return encodedData;
    }    
}