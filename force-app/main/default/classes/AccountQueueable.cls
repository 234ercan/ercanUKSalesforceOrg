public class AccountQueueable implements Queueable {
    public void execute (QueueableContext c){
        List<Account> accList = new List<Account>();
        for(integer i=1; i<5; i++){
            Account acc = new Account(Name='AAAA'+i, Phone=i+''+i+i);
            accList.add(acc);
        }
        insert accList;
    }
   
}