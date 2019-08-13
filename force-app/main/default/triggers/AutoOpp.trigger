trigger AutoOpp on Account (after insert) {
   List<Opportunity> newOpps = new List<Opportunity>();
        for (Account acc : Trigger.new)
        {
            opportunity opp=new opportunity();
            opp.name=acc.name+'opportunity';
            opp.stagename='prospecting';
            opp.closedate=date.today()+90;
            opp.AccountId=acc.id;
            newOpps.add(opp);
    }
    insert newOpps;
   
}