@isTest
private class AccountProcessorTest {
    @isTest private static void countContactsTest(){
        List<Account> accounts = new List<Account>();
        accounts.add(New Account(Name='countContactTest1'));
        accounts.add(New Account(Name='countContactTest2'));
        accounts.add(New Account(Name='countContactTest2'));
        insert accounts;
        
        List<Id> idList = new List<Id>();
        List<Contact> contactList = new List<Contact>();
        for (Account anAccount : accounts){
            contactList.add(new Contact(FirstName=anAccount.Name, LastName='TestContact', AccountId=anAccount.Id));
            idList.add(anAccount.Id);
        }
        insert contactList;
        
        Test.startTest();
        AccountProcessor.countContacts(idList);
        Test.stopTest();

        List<Account> countedContacts = [
            SELECT Id, Number_Of_Contacts__c
            FROM Account
            WHERE Id = :idList
        ];
        
        System.assertEquals(1, countedContacts[0].Number_Of_Contacts__c);
        
	}
}