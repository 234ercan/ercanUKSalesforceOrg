@isTest
public class StudentTest {

    
    @testSetup static void setup(){
     Parent__c p = new Parent__c(Name='TestParent');
        insert p;
        
        
        List<Student__c> stList = new List<Student__c>();
        for(integer i=0; i<200; i++){
            Student__c st = new Student__c();
            st.Name = 'Test'+i;
			st.isActive__c = true;
            st.Parent__c = p.Id;
            
            stList.add(st);
        }
        insert stList;
    }     
@isTest
    static void reportCard(){
       test.startTest();
       
        test.stopTest();
        
        
    }

    @isTest
    static void deletion(){
      List<Student__c>  SList = [SELECT Id FROM Student__c];
        test.startTest();
        delete SList ;
        test.stopTest();
    }
}