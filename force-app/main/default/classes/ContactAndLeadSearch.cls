public class ContactAndLeadSearch {
	
     public static List<List<sObject>> searchContactsAndLeads(String soslName){
         List<List<sObject>> searchList = [FIND :soslName IN ALL FIELDS RETURNING Contact(FirstName,LastName),
                                          Lead(FirstName,LastName)];

		return searchList;
	}
}