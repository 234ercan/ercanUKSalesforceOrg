public class testInvokable {
   
    
	@invocableMethod(label='Benim invocable Method' description='bu invokable method kontaklarin bazi fieldlarini degistirmek icin olusturuldu' category='Contact')
    public static void contactstoUpdate(List<string> emailList){
       List<Contact> cntList = [SELECT Id, Name, email FROM Contact WHERE email=:emailList];
        List<Contact> cList = new List<Contact>();
        for(Contact cnt:cntList){
           cnt.HomePhone = '12345' ;
            cList.add(cnt);
        }
        update cList;
    }
}