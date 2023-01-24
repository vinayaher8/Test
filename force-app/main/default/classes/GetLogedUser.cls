public with sharing class GetLogedUser{
    public GetLogedUser() {

    }
    @AuraEnabled(cacheable=true)
    public static string getLogedUserLanguage(){
        try {
            return UserInfo.getLanguage();    
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    
    }

    @AuraEnabled
    public static String updatedUserLanguage(){
        try {
            User loggedInUser = new User(Id = UserInfo.getUserId(), LanguageLocaleKey = (UserInfo.getLanguage() == 'en_US' ? 'fr' : 'en_US'));
            update loggedInUser;
            return 'success';
        } catch (Exception e) {
            return e.getDmlMessage(0);
            
        }
    }
}