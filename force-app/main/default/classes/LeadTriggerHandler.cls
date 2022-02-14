public with sharing class LeadTriggerHandler {
    public static void createTasksRelated(List<Lead> leads) {
        List<Task> tasks = new List<Task>();
        for(Lead aLead : Trigger.new){
            Task aTask = new Task();
            aTask.WhoId = aLead.Id;
            tasks.add(aTask);
        }
        insert tasks;
    }
}
