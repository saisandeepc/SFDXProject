public with sharing class Sample {

    ApexPages.StandardController sController;
    public Account newAcct{get;set;}
        
    public Sample(ApexPages.StandardController controller) {    
     sController = controller;     
     newAcct = new Account();
     System.debug('=====sController====='+sController );
    }
    
    public PageReference saveAndNew(){
     sController.save(); 
        PageReference pg = new PageReference('/apex/ReplicateSFDC');
        System.debug('=====pg====='+pg);
        pg.setRedirect(true);
        return pg;
    }
    
    public PageReference insertacc(){
    if(newAcct.Industry == null){
        System.debug('In');
        newAcct.Industry.addError('Name should not be null');
        return null; 
    }else{
        insert newAcct;
        PageReference pg = new PageReference('/'+newAcct.id);
        pg.setRedirect(true);
        return pg;
    }
    return null;  
    }
}