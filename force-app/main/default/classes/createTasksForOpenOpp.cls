public class createTasksForOpenOpp implements Schedulable{
    public void execute(SchedulableContext SC){
        List<Opportunity> oppList=[SELECT Id, Name FROM Opportunity Where IsClosed=False AND CloseDate<=TODAY];
        List<Task> tskList=new List<Task>();
        for(Opportunity opp : oppList){
            Task tsk=new Task();
            tsk.Subject='Past Opportunity Reminder: '+ opp.Name+' should be closed!' ;
            tsk.Status='Not Started';
            tsk.Priority='Normal';
            tsk.WhatId=opp.Id;
            tsk.OwnerId=opp.OwnerId;
            tsk.ActivityDate=Date.today()+3;
            tskList.add(tsk);
        }
        if(tskList.size()>0){
            insert tskList;
        }
    }
}