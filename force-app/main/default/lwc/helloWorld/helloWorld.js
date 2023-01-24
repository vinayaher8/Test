import { LightningElement ,wire} from 'lwc';
import getUserInfo from '@salesforce/apex/currentUserInfoCtrl.fetchUser';
import Id from '@salesforce/user/Id';
export default class HelloWorld extends LightningElement {
  @wire(getUserInfo, { userId: Id }) 
  userData;
}