public class ParentHandler {
    public static void updatePhoneAddres(Map<Id,Parent__c> pMap){  
 //       Set<Id> pSet = new Set<Id>();
 //       for(Parent__c p:pList){
 //           pSet.add(p.Id);
 //       }
       
        
    // 	Map<Id, Student__c> sMap = new Map<Id, Student__c>([SELECT Id, Name, Phone__c, Email__c, Country__c, State_City__c, Address_Line_1__c, Parent__r.Id, Parent__r.Phone__c, Parent__r.Email__c, Parent__r.Address_Line_1__c, Parent__r.State_City__c, Parent__r.Country__c FROM Student__c WHERE Parent__r.Id IN:pSet]) ;
                                                         
        
        List<Student__c> stList = new List<Student__c>();
        for(Student__c st:[SELECT Id, Name, Phone__c, Email__c, Country__c, State_City__c, Address_Line_1__c, parent__c, 
                           			parent__r.Email__c, parent__r.phone__c, parent__r.Address_Line_1__c, parent__r.State_City__c , parent__r.Country__c  
                           			FROM Student__c  WHERE student__c.parent__c =:pMap.keyset()]){                             
                   			 st.Phone__c=st.Parent__r.Phone__c; 
                             st.Email__c=st.Parent__r.Email__c;
                             st.Address_Line_1__c=st.Parent__r.Address_Line_1__c;
                             st.State_City__c=st.Parent__r.State_City__c;
                             st.Country__c=st.Parent__r.Country__c; 
               					
                              stList.add(st); 
               
                          }
        		update stList;
    }       
}