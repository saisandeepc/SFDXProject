public with sharing class DataServiceCtrl {

  @AuraEnabled
  public static String getAccountOptions() {
    Data valueLabels = new Data();
    List<AggregateResult> aggList = new List<AggregateResult>([
      SELECT
        AccountId accId,
        Account.Name accName
      FROM
        Contact
      GROUP BY
        AccountId, Account.Name
      HAVING
        count(Name) > 0
      ORDER BY
        count(Name) DESC
      LIMIT 10
    ]);
    for (AggregateResult ar : aggList) {
      valueLabels.items.add(new Item((String)ar.get('accId'), (String)ar.get('accName')));
    }
    //we need to serialize this because lightning cant have @AuraEnabled on inner classes
    return JSON.serialize(valueLabels);
  }

  @AuraEnabled
  public static List<Contact> getContactsByAccountId(String accountId) {
    try {
      System.debug('--accountId----'+accountId);
       
     List<Contact> conList =  [
        SELECT
          Name,
          Email,
          Phone,
          MailingCity,
          MailingState,
          MailingPostalCode,
          MailingCountry,
          Id
        FROM
          Contact
        WHERE
          AccountId =: accountId
      ];  
      System.debug('---->'+conList.get(10));
      return conList;
        
    } catch (Exception e) {
       System.debug('----ex--'+e);
      throw new AuraHandledException(e.getMessage());
    }
  }

  @AuraEnabled
  public static Boolean updateMultiContactAddress(List<Contact> conList, String conStreet, String conCity, String conState, String conZip, String conCountry) {
    List<Contact> contactsToUpdate = new List<Contact>();
    Boolean result;
      for (Contact c : conList) {
      contactsToUpdate.add(
        new Contact(
          Id = c.Id,
          MailingStreet = conStreet,
          MailingCity = conCity,
          MailingState = conState,
          MailingPostalCode = conZip,
          MailingCountry = conCountry
        )
      );
    }
    try {
      update contactsToUpdate;
      result = true;
    } catch (Exception e) {
        result = false;
        throw new AuraHandledException(e.getMessage());
    }
      return true;
  }

  public class Item {
    public String value;
    public String label;

    public Item(String value, String label) {
      this.value = value;
      this.label = label;
    }
  }

  public class Data {
    public List<Item> items;

    public Data() {
      this.items = new List<Item>();
    }
  }

}