public with sharing class SearchMap {
    @AuraEnabled (Cacheable = true)
    public static List<Account> getAccountsByZipCode(String Name, Integer soqlLimit){
        try {
            Name = '%' + Name + '%';
            List<Account> accountList = [SELECT Id, Name, Phone, Industry, BillingPostalCode, BillingCity, 
                                         BillingState, BillingStreet, BillingCountry 
                                         FROM Account 
                                         WHERE Name LIKE :Name 
                                         LIMIT :soqlLimit];

            if (accountList.isEmpty()) {
                throw new AuraHandledException('No Accounts in this area '+Name);
            }

            return accountList;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}