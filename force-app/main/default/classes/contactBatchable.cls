public class contactBatchable implements Database.Batchable<sObject> {
  private final String initialState;
  String query;
  
  public contactBatchable(String intialState) {
    this.initialState = initialState;
  }

  public Database.QueryLocator start(Database.BatchableContext BC) {
    // Access initialState here 
    
    return Database.getQueryLocator(query);
  }

  public void execute(Database.BatchableContext BC, 
                      List<sObject> batch) {
    // Access initialState here 
    
  }

  public void finish(Database.BatchableContext BC) {
    // Access initialState here 
    
  }
}