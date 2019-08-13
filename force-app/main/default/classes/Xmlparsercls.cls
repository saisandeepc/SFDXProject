public  class Xmlparsercls {
    public String xmlstring{get;set;}
    public String outxmlstring{get;set;}
    public String rootElement{get;set;}
    public String filename{get;set;}
    public blob body{get;set;}
    public List<Account> lstaccount{get;set;}
    public Xmlparsercls(){
      lstaccount=new List<Account>();
    }
//Parsing xml what you entered in the left text area
    public pagereference Parsexml(){
       DOM.Document xmlDOC = new DOM.Document(); 
       xmlDOC.load(xmlstring); 
       DOM.XMLNode rootElement = xmlDOC.getRootElement();
       outxmlstring=String.valueof(xmlDOC.getRootElement().getName());
       for(DOM.XMLNode xmlnodeobj:xmlDOC.getRootElement().getChildElements()){
          if(xmlnodeobj.getName()=='Name')
            outxmlstring+='\nAccount Name:'+xmlnodeobj.getText();
          if(xmlnodeobj.getName()=='Type')
            outxmlstring+='\nAccount Type:'+xmlnodeobj.getText();  
          if(xmlnodeobj.getName()=='Industry')
            outxmlstring+='\nAccount Industry:'+xmlnodeobj.getText();
       }
       
      return null;
    }
//This is for parsing xml file what you selected
  public pagereference Parsexmlfile(){
       DOM.Document xmlDOC = new DOM.Document(); 
       xmlstring=body.tostring();
       system.debug('****xmlstring'+xmlstring);
      // xmlstring=xmlstring.Substring(1,xmlstring.length());
       //outxmlstring=xmlstring;
       xmlDOC.load(xmlstring); 
       DOM.XMLNode rootElement = xmlDOC.getRootElement();
       outxmlstring=String.valueof(xmlDOC.getRootElement().getName());//gives you root element Name
       for(DOM.XMLNode xmlnodeobj:xmlDOC.getRootElement().getChildElements()){ //gives you all childnodes list
          if(xmlnodeobj.getName()=='Name')
            outxmlstring+='\nAccount Name:'+xmlnodeobj.getText();// it gives you text node
          if(xmlnodeobj.getName()=='Type')
            outxmlstring+='\nAccount Type:'+xmlnodeobj.getText();  
          if(xmlnodeobj.getName()=='Industry')
            outxmlstring+='\nAccount Industry:'+xmlnodeobj.getText();
       }
       
      return null;
    }
}