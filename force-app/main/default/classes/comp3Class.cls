public with sharing class comp3Class {
    @AuraEnabled
    public static void comp3Method(Contact cnt){
        try {
            insert cnt;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   
}