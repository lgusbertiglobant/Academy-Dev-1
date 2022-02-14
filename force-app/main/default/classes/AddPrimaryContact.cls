public without sharing class AddPrimaryContact implements Queueable{
    
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact inputContact, String inputState){
        this.contact = inputContact;
        this.state = inputState;
    }
    
    public void execute(QueueableContext context){
        //Retrieve 200 Account records
        List<Account> accounts = [
            SELECT Id 
            FROM Account 
            WHERE BillingState = :state 
            LIMIT 200
        ];
        
    	//Create empty list of Contact records
    	List<Contact> contacts = new List<Contact>();
        
        //Iterate through Account records
        for(Account anAccount : accounts) {
            //Clone the contact record, make the clone a child of the specific Account record
            //add to the list of contacts
            Contact contactClone = contact.clone();
            contactClone.AccountId = anAccount.Id;
            contacts.add(contactClone);
        }
        insert contacts;
    }
}