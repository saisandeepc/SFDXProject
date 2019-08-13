trigger UpdateCPActivenOnOppty on Customer_Project__c (after insert,after update)
{
List<Opportunity> opps=new List<Opportunity>();
for(Customer_Project__c cp:Trigger.New)
{
if(cp.Status__c=='Active')
    {
    Opportunity opp= new Opportunity();//To new instance of opp we are assigning Customer_Project related Opportunity
    opp.id=cp.CP_Opp__c;
    opp.Active_Customer_Project__c = True;
   
    system.debug('Opp is........'+opp);
    opps.add(opp);
    }
    else{
    Opportunity oppn= new Opportunity();
    oppn.Active_Customer_Project__c = False;
    system.debug('cp check........'+cp);
    oppn.id=cp.CP_Opp__c;
    opps.add(oppn);
    }
}
update opps;
system.debug('Opps check........'+opps);
}