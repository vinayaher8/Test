import { LightningElement ,track} from 'lwc';

export default class FileUploadDemo extends LightningElement {
   
    @track file;
    @track fileUrl;
  
    handleFileChange(event) {
      const file = event.target.files[0];
      if (file && file.type === 'application/pdf') {
        this.file = file;
        this.fileUrl = URL.createObjectURL(file);
      } else {
        this.file = null;
        this.fileUrl = null;
      }
    }
    
  }