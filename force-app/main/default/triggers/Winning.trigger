trigger Winning on Opportunity (before update) {
  for (Opportunity opp : Trigger.new) {
    // Access the "old" record by its ID in Trigger.oldMap
    Opportunity oldOpp = Trigger.oldMap.get(opp.Id);
   system.debug('Check a checkbox only when an Opp is changed to Closed Won!++'+opp );
    // Trigger.new records are conveniently the "new" versions!
    Boolean oldOppIsWon = oldOpp.StageName.equals('Closed Won');
    Boolean newOppIsWon = opp.StageName.equals('Closed Won');
    system.debug('Check a checkbox only when an Opp is changed to Closed Won!++'+oldOpp );
    // Check that the field was changed to the correct value
    if (oldOppIsWon && newOppIsWon) {
      opp.I_am_Awesome__c= true;
    }
    else{
       opp.I_am_Awesome__c= false;// It is possiple with Process builder (No need of trigger)
    }
   
  }
}