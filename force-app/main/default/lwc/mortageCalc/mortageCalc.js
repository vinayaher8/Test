import { LightningElement, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class MortageCalc extends LightningElement {
    @track APR
    @track Loan_Term
    @track Loan_Amount
    @track Monthly_Payment

handleClick(){
        
this.Monthly_Payment=(this.Loan_Amount * ( this.APR/100)/12) / (1 - Math.pow(1 + (this.APR/100)/12, -(this.Loan_Term * 12)));
this[NavigationMixin.Navigate]({
    type: 'standard__navItemPage',
    attributes: {
        apiName: 'DisplayPage'
    },
});   
}
handleAPRChange(event){
this.APR=event.target.value
}
handleLoanTerm(event){
this.Loan_Term=event.target.value
}
handleLoanAmount(event){
    this.Loan_Amount=event.target.value
}

handleResetClick(){
    this.Monthly_Payment=null;
    this.APR=null;
    this.Loan_Amount=null;
    this.Loan_Term=null;
}
}