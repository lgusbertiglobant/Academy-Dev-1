public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String search){
        List<List<SObject>> foundContacts = [FIND :search IN NAME FIELDS 
                                             RETURNING Contact, Lead];
        return foundContacts;
    }
}