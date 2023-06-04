trigger Report_Card_Trigger on Report_Card__c (before insert, before update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        Report_Card_Trigger_Handler.overallScore(Trigger.New);
    }
}