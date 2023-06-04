trigger rcT102 on Report_Card__c (after insert, after update) {
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate )){
        rcT102Handler.rcDateUpdate(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}