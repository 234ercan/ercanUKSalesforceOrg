trigger StudentTrigger on Student__c (after insert, after update, after delete, after undelete) {
    if(Trigger.isAfter && Trigger.isInsert){
        StudentTriggerHandler.reportCardCreation(Trigger.New);
    }
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete)){
        StudentTriggerHandler.activeChildNumber(Trigger.New);
    }
    if(Trigger.isAfter && Trigger.isDelete){
        StudentTriggerHandler.activeChildNumber(Trigger.Old); 
    }
}