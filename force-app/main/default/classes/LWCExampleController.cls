public inherited sharing class LWCExampleController {
    @AuraEnabled
    public static void saveAccountRecord(Account acc){
        try {
            insert acc;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   
}