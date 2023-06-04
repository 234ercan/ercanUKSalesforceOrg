trigger RCdateUpdate on Report_Card__c (after insert, after update) {
 if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
     /*
        Map<Id, Parent__c> pMap = new Map<Id, Parent__c>([SELECT Id, ReportCardUpdateTime__c, 
                                                          (SELECT Id, Name, Parent__c FROM Students__r WHERE Id IN 
                                                           (SELECT Student__c FROM Report_Card__c WHERE Id In:Trigger.New)) 
                                                          FROM Parent__c]);
        
        for(Parent__c p:pMap.Values()){
            p.ReportCardUpdateTime__c=system.now();
            update p;
        }
*/
     Map<Id, Student__c> stMap = new Map<Id, Student__c>([SELECT Id, Name, Parent__c, Parent__r.ReportCardUpdateTime__c, 
                                                          (SELECT id, Maths__c FROM Report_Cards__r) FROM Student__c WHERE Id IN 
                                                           (SELECT Student__c FROM Report_Card__c WHERE Id In:Trigger.New)]);
     
     List<Student__c> stList = new List<Student__c>();
     for(Student__c st:stMap.values() ){
         if(st.Report_Cards__r.size()>0){
             st.parent__r.ReportCardUpdateTime__c = system.now();
         stList.add(st);
         }
         
     }
     update stList;
    }
}
/*
 set<id> pIds=new Set<id>();
            for(Student_c st : [SELECT id, Parentc FROM Studentc  WHERE id =:Trigger.newMap.values().Student_c]){
            parentids.add(st.Parent__c);
            
        }
          Map<id,Parent_c>  pMap= new Map<id,Parentc>([Select id, Report_Card_Update_Time_c From Parent__c Where id In:pIds ]) ; 
            for(Report_Card__c rc: Trigger.new){
            if(rc.Math_c!=Trigger.oldMap.values().Math_c || 
            rc.History_c!=Trigger.oldMap.values().History_c ||
            rc.English_c!=Trigger.oldMap.values().English_c ||
            rc.Geography_c!=Trigger.oldMap.values().Geography_c){
            pMap.values().Report_Card_Update_Time__c =Datetime.now();
           }            
        }
update pMap.values();
*/