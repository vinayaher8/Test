import { LightningElement } from 'lwc';

export default class GooglecaptchaParent extends LightningElement {

    
  verifiedBool = true;
  captchaResponse
   
   handleUpdate( event ) {

       console.log( 'Updated value is ' + JSON.stringify( event.detail ) );
       this.verifiedBool = event.detail.value;

       if ( event.detail.response ) {

           console.log( 'Response is ' + event.detail.response );
           this.captchaResponse = event.detail.response;

       }

   }

   handleSubmit( event ) {

       let fields = event.detail.fields;
       fields = Object.assign( { 'sobjectType': 'Lead' }, fields );
       console.log( 'Fields are ' + JSON.stringify( fields ) );
       console.log( 'Captcha Response is ' + JSON.stringify( this.captchaResponse ) );
       event.preventDefault();
}
}