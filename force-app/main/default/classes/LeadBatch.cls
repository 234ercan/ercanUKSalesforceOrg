public class LeadBatch implements Database.Batchable<sObject>, Schedulable{
 
    public Database.QueryLocator start(Database.BatchableContext BC){
     //	List<Lead> LeadList = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null];
        return  Database.getQueryLocator([SELECT Id, LeadSource FROM Lead WHERE LeadSource = null]);
   }

   public void execute(Database.BatchableContext BC, List<Lead> LeadList){
       for(Lead Ld:LeadList){
           Ld.LeadSource = 'Other';
       }
       update LeadList;
    }

   public void finish(Database.BatchableContext BC){
       System.debug('Batch apex calisti ve isini bitirdi');
   }
    
    public static void execute(SchedulableContext sc){
        LeadBatch runBatch = new LeadBatch();
		Database.executeBatch(runBatch, 5);
    }
}