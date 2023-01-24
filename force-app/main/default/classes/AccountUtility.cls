public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [SELECT Name,AnnualRevenue FROM Account];
        for (Account Acc : accountsList){
            String acctRev = 'Account Name: ' + Acc.Name + ',  Annual Revenue: ' + Acc.AnnualRevenue;
            system.debug(acctRev);
        }
    }
}