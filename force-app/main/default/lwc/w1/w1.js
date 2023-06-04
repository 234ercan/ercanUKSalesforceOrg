import { api, LightningElement } from 'lwc';

export default class W1 extends LightningElement {

@api
name='ercan';
surname='yilmaz';
fullName;

handleName(event){
this.name=event.target.value;
}
handleSurname(event){
   this.surname=event.target.value;
   }
handleClick(event){
this.fullName=this.name+" "+this.surname;
} 

}