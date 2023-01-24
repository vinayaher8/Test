import { LightningElement, track, wire, api } from 'lwc';
import searchAccounts from '@salesforce/apex/SearchMap.getAccountsByZipCode';

export default class SearchAccountsMapLWC extends LightningElement {
    @track searchData;
    @track errorMsg = '';
    @track zipCodeSearch = '';
    @track limit = 5;
    @track mapMarkers = [];

    handleZipCodeSearch(event) {
        this.zipCodeSearch = event.detail.value;
    }

    handleAccountSearch() {
        this.mapMarkers= [];
        if(!this.zipCodeSearch) {
            this.errorMsg = 'Please enter zipcode to search accounts).';
            this.searchData = undefined;
            return;
        }

        let params = {};
        params.zipCode = this.zipCodeSearch;
        params.soqlLimit = this.limit;

        searchAccounts(params)
        .then(result => {
            console.log('@@@@ result '+result);
            result.forEach((accRecord) => {var marker = {
                value: accRecord.Id,
                location: {
                    Street: accRecord.BillingStreet,
                    City: accRecord.BillingCity,
                    Country: accRecord.BillingCountry,
                },
    
                icon: 'custom:custom26',
                title: accRecord.Name,
            }; 
            console.log('@@@@ marker '+marker);
            this.mapMarkers.push(marker);
            console.log('@@@@ mapMarkers '+this.mapMarkers);});
            this.searchData = result;
            this.error = undefined;
        })
        .catch(error => {
            this.searchData = undefined;
            window.console.log('error =====> '+JSON.stringify(error));
            if(error) {
                window.console.log('@@@@ ERROR '+ error);
            }
        })
    }
    @track markersTitle = "Accounts Found";
}