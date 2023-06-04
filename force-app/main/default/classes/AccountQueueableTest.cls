@isTest
public class AccountQueueableTest {
@isTest
    static void accCreation(){
        test.startTest();
        	AccountQueueable runClass = new AccountQueueable();
			system.enqueueJob(runClass);
        test.stopTest();
    }
}