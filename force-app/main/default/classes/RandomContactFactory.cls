public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String name){
        List<Contact> conList = new List<Contact>();
        for(Integer i = 0; i< numContacts; i++){
            conList.add(new Contact(FirstName = 'Test'+ i , LastName = name));
        }
        Return conList;
    }
}