@isTest
private class AccountManagerTest {
    @isTest static void testGetAccount(){
        Account anAccount = new Account(Name='TestAccount');
        insert anAccount;
        Contact aContact = new Contact(AccountId=anAccount.Id, FirstName='Test', LastName='TestLastName');
        insert aContact;
        
        RestRequest request = new RestRequest();
        request.requestURI = 'https://yourInstance.salesforce.com/services/apexrest/Accounts/'+ anAccount.Id +'/contacts';
    	request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account myAcct = AccountManager.getAccount();
        //verify results
        System.assert(myAcct != null);
        System.assertEquals('TestAccount', myAcct.Name);
    }
}