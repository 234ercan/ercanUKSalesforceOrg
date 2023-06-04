public class QueableAccountCreation implements Queueable {
   public void execute(QueueableContext context) {
        List<Account>accList=new  List<Account>();
        for(integer i=1;i<=10;i++){
          Account acc=new Account(Name='Test Account' +i,Phone='123');
            accList.add(acc);
        }
        insert accList;
    }
}