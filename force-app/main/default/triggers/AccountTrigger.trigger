trigger AccountTrigger on Account (before insert, after delete, after undelete) {
    if(Trigger.isBefore && Trigger.isInsert){
       
    }
    
    if(Trigger.isAfter && (Trigger.isDelete || Trigger.isUndelete)){
        
    }
    
}