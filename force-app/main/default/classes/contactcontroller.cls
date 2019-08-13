public with sharing class contactcontroller {

    public contact newcontact {get;set;}
    
    public contactcontroller() {
        newcontact =new contact();
    }   
    
    public PageReference Save() {
        insert newcontact;
    return null;
    }
    /*
    public PageReference Savenew() {
        System.debug('In');
        if(newcontact.title == null){
        newcontact.title.addError('Please provide name');
        return null;
    }else{
        insert newcontact;
        PageReference pg = new PageReference('/'+newcontact.id);
        pg.setRedirect(true);
        return pg;
    }
    } */         
}