import { LightningElement, track } from 'lwc';

export default class W2 extends LightningElement {
   @track
   todoTask = [
      {
         id:1,
         name:'Task 1'
      }
   ];
   
   newTask;

   updateNewTask(event){
      this.newTask = event.target.value;
   }

   addTaskToList(event){
      //* push funtion is adding an element to the end of the array, 
      //*unshift funtion is adding an element at the beginning of the array
      this.todoTask.push({
         id:this.todoTask.length+1,
         name: this.newTask
      });
      this.newTask = '';
   }

   deleteTaskFromList(event){
      let idToDelete = event.target.name;
      let todoTask = this.todoTask;
      let todoTaskIndex;

      for(let i=0; i< todoTask.length; i++){
         if(idToDelete === this.todoTask[i].id) {
            todoTaskIndex = i;
         }
      }
      this.todoTask.splice(todoTaskIndex, 1);

   }

}