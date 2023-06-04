public class Report_Card_Trigger_Handler {
    public static void overallScore(List<Report_Card__c> rcList){
        for(report_card__c rc:rcList){
            if(rc.Maths__c>=0 && rc.Maths__c<=100 && rc.English__c>=0 && rc.English__c<=100 && rc.History__c>=0 && rc.History__c<=100 && rc.Geography__c>=0 && rc.Geography__c<=100){
                if(rc.average__c < 40 || rc.English__c<40 || rc.Maths__c<40) {
                    rc.Overall_Score__c = 'Fail';
                }else if(rc.Average__c<60){
                    rc.Overall_Score__c = 'Pass';
                }else if(rc.Average__c<80){
                    rc.Overall_Score__c = 'Good';
                }else{
                    rc.Overall_Score__c = 'Excellent';
                }    
            }else{
                rc.adderror('enter a valid mark!');
            }
            
        }
    }
}