public class StudentTriggerHandler {
    public static void reportCardCreation(List<Student__c> stdList){
        List<Report_Card__c> rcList = new List<Report_Card__c>();
        for(Student__c std:stdList){
            Report_Card__c rc = new Report_Card__c();
            rc.Student__c = std.Id;
            rcList.add(rc);
        }
        insert rcList;
    }
    
    
    
    
    public static void activeChildNumber(List<Student__c> studentList){
       List<Parent__c> parentList = new List<Parent__c>();
      
        Set<Id> ParentId = new Set<Id>();
        for(Student__c st:studentList){
            ParentId.add(st.Parent__c);
        }
        
        for(Parent__c p:[SELECT Id, Name, Child_Number__c, (SELECT Id FROM Students__r WHERE isActive__c=true) FROM Parent__c WHERE id IN:ParentId ]){
            
            p.Child_Number__c = p.students__r.size();
            parentList.add(p);
        }  
        Update parentList;
    }
    
}