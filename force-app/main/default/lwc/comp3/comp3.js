import { api, LightningElement, track, wire} from 'lwc';
import cntRecord from '@salesforce/apex/comp3Class.comp3Method';
import ContactName from '@salesforce/schema/Contact.LastName';
import ContactPhone from '@salesforce/schema/Contact.Phone';

export default class Comp3 extends LightningElement {
  @api
  name;
  phone;
  save;
  count=0;
  @track cntRecord={
    Name:ContactName,
    Phone:ContactPhone
  }
handleName(event){
  this.cntRecord.Name=event.target.value;
  }
handlePhone(event){
  this.cntRecord.Phone=event.target.value;
}
handleClick(event){
  this.save=this.name+" : "+this.phone;
  console.log(this.save);
}
handleCount(event){
  this.count=this.count+1;
  this.save=this.count;
}

handleSubmit(){
  comp3Class({cnt:this.cntRecord})
  .then(result=>{
    this.cntRecord={};
  })
}
}