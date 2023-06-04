import { LightningElement ,track} from 'lwc';
export default class CreateAccountEdView extends LightningElement {
    @track recordId;
    createAccount(event)
    {
        this.recordId=event.detail.id;
    }
}