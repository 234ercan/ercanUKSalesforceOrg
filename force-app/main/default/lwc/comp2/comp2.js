import { LightningElement, api } from 'lwc';

export default class Comp2 extends LightningElement {
@api myinput;
  handleChange(event){
    this.myinput=event.target.value;
    console.log(this.myinput);
  }






}