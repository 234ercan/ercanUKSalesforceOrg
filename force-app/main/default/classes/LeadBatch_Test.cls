@isTest
public class LeadBatch_Test {
@isTest
    static void leadCreation(){
        List<Lead> listLead = new List<Lead>();
        for(integer i=1; i<200; i++){
            Lead Ld = new Lead();
        		Ld.LastName = 'TestName'+i;
        		Ld.Company = 'TestCompany'+i;
        		Ld.Status = 'open - not contacted';
        		Ld.LeadSource = '';
            listLead.add(Ld);
        }
	
        
        insert listLead;
        
        test.startTest();
            LeadBatch runBatch = new LeadBatch();
            database.executeBatch(runBatch, 200);
           
            LeadBatch runSchedule = new LeadBatch();
            String cron = '0 0 0 * * ?';
            system.schedule('my Schedulable Apex', cron, runSchedule);
        test.stopTest();
        
        
    }
    
    
    
}