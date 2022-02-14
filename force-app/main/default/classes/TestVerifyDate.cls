@isTest
public class TestVerifyDate {
    @isTest static void testCheckDates(){
        Date result = VerifyDate.CheckDates(date.valueOf('2022-02-03'), date.valueOf('2022-02-10'));
        System.assertEquals(date.valueOf('2022-02-10'), result);
    }
    @isTest static void testEndOfMonthDate(){
        Date result = VerifyDate.CheckDates(date.valueOf('2022-02-03'), date.valueOf('2022-03-10'));
        System.assertEquals(date.valueOf('2022-02-28'), result);
    }
}