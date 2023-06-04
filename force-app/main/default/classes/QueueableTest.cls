@isTest
public class QueueableTest {
	@isTest
    static void AccCreate(){
        list<Account> accList = new List<Account>();
        for(integer i=1; i<200; i++){
        Account acc = new Account();
        acc.Name = 'Test';
         accList.add(acc);   
        }
        insert accList;
        
    test.startTest();
      AccountQueueableNewAcc runQueue = new AccountQueueableNewAcc();
        system.enqueueJob(runQueue);
    test.stopTest();
    }
}