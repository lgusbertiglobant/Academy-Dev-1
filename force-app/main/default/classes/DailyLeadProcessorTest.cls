@isTest
public class DailyLeadProcessorTest {
    
    private static String CRON_EXP = '0 0 0 ? * * *'; //Midnight every day
    
	@isTest
    private static void testSchedulableClass(){
        
        //Load test data
        List<Lead> leads = new List<Lead>();
        for(integer i=0; i<500; i++){
            if(i<250){
                leads.add(new Lead(LastName='Connock', Company='Salesforce'));
            } else {
                leads.add(new Lead(LastName='Connock', Company='Salesforce', LeadSource='Other'));
            }
        }
        insert leads;
        
        //Perform the test
        Test.startTest();
        String jobId = System.Schedule('Process Leads', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        
        //Check the result
        List<Lead> updatedLeads = [
            SELECT Id, LeadSource
            FROM Lead
            WHERE LeadSource = 'Dreamforce'
        ];
        System.assertEquals(200, updatedLeads.Size(), 'ERROR: At least 1 record not updated correctly');
		
		//Check the scheduled time
		List<CronTrigger> cts = [
            SELECT Id, TimesTriggered, NextFireTime
        	FROM CronTrigger
            WHERE Id = :jobId
        ];       
    } 
}