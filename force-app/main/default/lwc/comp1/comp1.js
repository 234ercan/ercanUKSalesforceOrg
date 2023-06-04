import { LightningElement, api } from 'lwc';

export default class Comp1 extends LightningElement {
  @api myChange;
  handleChange(event){
    this.myChange=event.target.value;
    console.log(this.myChange);
  }

}