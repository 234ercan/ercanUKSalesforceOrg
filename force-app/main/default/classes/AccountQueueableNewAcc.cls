public class AccountQueueableNewAcc implements Queueable {   
    public void execute(QueueableContext context) {
        Account acc = new Account();
        acc.Name = 'Test';
        acc.Phone = '123';
        insert acc;        
    }
}