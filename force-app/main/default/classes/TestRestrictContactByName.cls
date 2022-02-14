@isTest
public class TestRestrictContactByName {
    @isTest static void testInsertAccount(){
        Contact cont = new Contact(LastName='INVALIDNAME'); 
        Test.startTest();
        Database.SaveResult result = Database.insert(cont, false);
        Test.stopTest();
        System.assert(!result.isSuccess());
    }
}