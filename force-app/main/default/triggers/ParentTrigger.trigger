trigger ParentTrigger on Parent__c (after update, after insert) {
    if(Trigger.isAfter && (Trigger.isUpdate || Trigger.isInsert)){
        ParentHandler.updatePhoneAddres(Trigger.NewMap);
    }
}