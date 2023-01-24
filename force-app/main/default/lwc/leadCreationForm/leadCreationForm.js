import { LightningElement } from 'lwc';
import insertRecord from '@salesforce/apex/RecaptchaController.insertRecord';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class LeadCreationForm extends LightningElement {

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

   

}