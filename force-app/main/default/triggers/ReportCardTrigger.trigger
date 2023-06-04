trigger ReportCardTrigger on Report_Card__c (before insert, before update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        for(Report_Card__c rc:Trigger.new){
            if(rc.Maths__c<=100 && rc.English__c<=100 && rc.History__c<=100 && rc.Geography__c<=100 && (rc.Maths__c>=0 && rc.English__c>=0 && rc.History__c>=0 && rc.Geography__c >=0)){
                if(rc.Average__c<40 || (rc.Maths__c<40 || rc.English__c<40)){
                    rc.Overall_Score__c='Fail';
                }else if(rc.Average__c<60){
                    rc.Overall_Score__c='Pass';
                }else if(rc.Average__c<80){
                    rc.Overall_Score__c='Good';
                }else if(rc.Average__c<=100){
                    rc.Overall_Score__c='excellent';
                }else{
                    rc.addError('enter a valid mark');
                }
            }else{
                rc.addError('enter a valid mark');
            }
        }
    }
}