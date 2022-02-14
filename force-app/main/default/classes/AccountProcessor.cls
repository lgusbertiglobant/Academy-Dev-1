public class AccountProcessor {
    @future
    public static void countContacts(List<Id> AccountIds){
        List<Account> Accounts = [SELECT Id, Name,
                                  (SELECT Id, Name From Contacts) 
                                  From Account 
                                  Where Id = :AccountIds];
        for (Account acc : Accounts){
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        update Accounts;
    }
}