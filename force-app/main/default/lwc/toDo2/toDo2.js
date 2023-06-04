import { LightningElement , track} from 'lwc';
export default class Recap03ToDoList extends LightningElement {
 itemName=''; 
  @track todoList=[];
  handleAction(event){
  this.itemName=event.target.value;
  }
  handleClick(){
  this.todoList.push(this.itemName);
    }
   
   
  }