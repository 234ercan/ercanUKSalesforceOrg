import { LightningElement, track } from 'lwc';
import saveresult from '@salesforce/apex/AccountCreation.acct';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class InsertAcc extends LightningElement {
  @track
   name;

  handlechange(event){
   this.name=event.target.value;
  }

  handlesuccess(){
   saveresult({
      n: this.name
   }).then(response => {
      if(response == 'success'){
         this.dispatchEvent(new ShowToastEvent({
            title: 'Success',
            message: 'Account created Successfully',
            variant: 'success'
         }));
      }else{
         this.dispatchEvent(new ShowToastEvent({
            title: 'Error',
            message: 'Something went wrong, try again pls!',
            variant: 'error'
         }));
      }
   }).catch(error => {
      console.log('error: ', error);
   }).finally(() => {
      this.isOpenSpinner = false;
   });

  }




}