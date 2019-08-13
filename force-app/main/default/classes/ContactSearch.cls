public class ContactSearch {
	
    public static List<Contact> searchForContacts(String ln, String mpc){
	
		List<Contact> conList;
		
		conList = [SELECT Name FROM Contact WHERE LastName =:ln AND MailingPostalCode =:mpc];
		
		return conList;
		
	}
}