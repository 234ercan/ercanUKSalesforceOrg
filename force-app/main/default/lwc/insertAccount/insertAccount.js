import { LightningElement, track } from 'lwc';
import saveAccount from '@salesforce/apex/LWCExampleController.saveAccountRecord';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import Name_FIELD from '@salesforce/schema/Account.Name';
import Phone_FIELD from '@salesforce/schema/Account.Phone';
import Type_FIELD from '@salesforce/schema/Account.Type';
//import Industry_FIELD from '@salesforce/schema/Account.Industry';

export default class InsertAccount extends LightningElement {
    @track error;

    //this object has record information
    @track accRecord={
      Name:Name_FIELD,
      Phone:Phone_FIELD,
      Type:Type_FIELD,
     // Industry:Industry_FIELD
    };
handleNameChange(event){
  this.accRecord.Name = event.target.value;
  window.console.log('Name ==> '+this.accRecord.Name);
}
handlePhoneChange(event){
  this.accRecord.Phone = event.target.value;
  window.console.log('Name ==> '+this.accRecord.Phone);
}
handleTypeChange(event){
  this.accRecord.Type = event.target.value;
  window.console.log('Name ==> '+this.accRecord.Type);
}
/*handleIndustryChange(event){
  this.accRecord.Industry = event.target.value;
  window.console.log('Name ==> '+this.accRecord.Industry);
}*/

handleSave(){
  saveAccount({acc:this.accRecord})
  .then(result=> {
    this.accRecord={};
    window.console.log('result ==> '+result);
    this.dispatchEvent(new ShowToastEvent({
      title:'Success!',
      message: 'Account created successfully',
      variant: success
    }),);
  })
  .catch(error =>{
    this.error=error.message;
  });
}
}