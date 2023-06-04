public class rcT102Handler {
    public static void rcDateUpdate(List<Report_Card__c> rcNewList,List<Report_Card__c> rcOldList, Map<Id, Report_Card__c> rcNewMap, Map<Id, Report_Card__c> rcOldMap ){
     /*   
        Map<Id, Parent__c> pMap = new Map<Id, Parent__c>([SELECT Id, 
																	(SELECT Id FROM Students__r WHERE id IN 
                                                         						(SELECT Report_Card__c.Student__c FROM Report_Card__c 
                                                                                 		WHERE id IN:rcNewList)) 
                                                          			FROM Parent__c ]);
        
   
        for(Parent__c p: pMap.values() ){
            p.ReportCardUpdateTime__c = system.now();
        }
        update pMap.values();
        
    }*/
    
     Map<Id, Student__c> stMap = new Map<Id, Student__c>([SELECT Id, Name, Parent__c, Parent__r.ReportCardUpdateTime__c, 
                                                      (SELECT id, Maths__c FROM Report_Cards__r) FROM Student__c WHERE Id IN 
                                                         (SELECT Student__c FROM Report_Card__c WHERE Id In:Trigger.New)]);
     
     List<Student__c> stList = new List<Student__c>();
     for(Student__c st:stMap.values() ){  
         st.parent__r.ReportCardUpdateTime__c = system.now();
         stList.add(st);     
     }
     update stList;
    }
}