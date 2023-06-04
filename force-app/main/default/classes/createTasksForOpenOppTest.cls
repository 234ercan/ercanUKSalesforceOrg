@isTest
public class createTasksForOpenOppTest {
    @testSetup
    static void createOpp(){
        
        List<Opportunity>opplist=new  List<Opportunity>();
        for(integer i=1;i<11;i++){
           Opportunity opp = new Opportunity(Name='Umut', StageName='Prospecting', CloseDate=system.today()-10);
            opplist.add(opp);
        }
        test.startTest();
        insert opplist;
        test.stopTest();
    }
    @isTest
    static void createTask(){
        test.startTest();
        createTasksForOpenOpp runSchedule = new createTasksForOpenOpp();
        String cronExp='0 0 08 ? * MON-FRI';
		System.schedule('Opp Reminder', cronExp, runSchedule);
        test.stopTest();
    }

}