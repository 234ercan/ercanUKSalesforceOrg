import { LightningElement } from 'lwc';

export default class W100 extends LightningElement {

YeniIsim = "Ercan";
YeniSoyisim = "Yilmaz";
YeniYas = 25
change = false;
Reverse;

IsimHandler(event){
   this.YeniIsim = event.target.value
}
SoyisimHandler(event){
   this.YeniSoyisim = event.target.value
}
YasHandler(event){
   this.YeniYas = event.target.value
}
handleChange(event){
   this.change = event.target.checked;
   console.log(this.change);
}

get sonuc(){

this.Reverse = this.YeniIsim.split('').reverse().join('') + " - " + this.YeniSoyisim.split('').reverse().join('') + " - " + this.YeniYas;

return this.Reverse;

}


}