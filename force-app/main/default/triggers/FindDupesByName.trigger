trigger FindDupesByName on Lead (before insert, before update) {
  for (Lead myLead : Trigger.new) //Contain all Records that are inserted or updated
  {
    if (myLead.LastName != null)//Checks if last name is enterd or not
     {
      List<Contact> dupes = [SELECT Id FROM Contact WHERE LastName= :myLead.LastName];//If last name is enterd then check if the names are similar are not
      if (dupes.size() > 0) // If there are any dupes 
      {
        myLead.Dupe_Contact__c = dupes[0].Id;//Populate the field with contact id
      } 
      else 
      {
        myLead.Dupe_Contact__c = null;//If there are no d upes then do nothing
      }  // Write Validation Rule if any Dupe_Contact__c  Populate with contact id then trow an error                         
    }
  }
}