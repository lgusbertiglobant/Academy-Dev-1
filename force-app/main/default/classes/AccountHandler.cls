public class AccountHandler {
    public static Account insertNewAccount(String accName){
        try{
            Account acc = new Account(Name=accName);
            insert acc;
            return acc;
        }catch (DmlException e) {
    		System.debug('A DML exception has occurred: ' + e.getMessage());
            return null;
    	}
    }
}