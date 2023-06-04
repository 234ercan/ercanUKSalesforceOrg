import { api, LightningElement, track, wire } from 'lwc';

export default class Comp4 extends LightningElement {
@api
Name;
Phone;
Submit;

handleName(event){
this.Name=event.target.value;
console.log(this.Name);
}

handlePhone(event){
this.Phone=event.target.value;
}

handleSubmit(event){
  this.Submit=this.Name+" : "+this.Phone;
}
}