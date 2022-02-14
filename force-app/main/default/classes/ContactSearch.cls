public class ContactSearch {
    public static List<Contact> searchForContacts(String Name, String mailPostalCode){
        List<Contact> contactsFound = [SELECT
                                       LastName, 
                                       MailingPostalCode 
                                       FROM Contact 
                                       where LastName = :Name AND 
                                       MailingPostalCode = :mailPostalCode];
        return contactsFound;
    }
}