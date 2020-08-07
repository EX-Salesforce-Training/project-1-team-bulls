public class AccountInformationController {

    public List<Wrapper> accountList {get;set;}
    public String phone {get;set;}
    public String BillingStreet {get;set;}
    public String BillingCity {get;set;}
    public String BillingState {get;set;}
    public String BillingZip {get;set;}
    public String ShippingCity {get;set;}
    public String ShippingState {get;set;}
    public String ShippingZip {get;set;}
    public String ShippingStreet {get;set;}
    public String name {get;set;}
    
    public AccountInformationController() {
        accountList = new List<Wrapper>();
        
        for (Account acc: [SELECT Id, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, ShippingStreet, ShippingState, ShippingCity, ShippingPostalCode, Phone FROM Account]) {
            Wrapper newWrapper = new Wrapper();
            newWrapper.accounts = acc;
            newWrapper.selected = false;
            accountList.add(newWrapper);
        }
    }
    
    public pageReference edit() {
        
        for (Wrapper r: accountList) {
            if (r.selected == true) {
                phone = r.accounts.phone;
                BillingStreet = r.accounts.BillingStreet;
                BillingCity = r.accounts.BillingCity;
                BillingState = r.accounts.BillingState;
                BillingZip = r.accounts.BillingPostalCode;
                ShippingCity = r.accounts.ShippingCity;
                ShippingState = r.accounts.ShippingState;
                ShippingStreet = r.accounts.ShippingStreet;
                ShippingZip = r.accounts.ShippingPostalCode;
                name = r.accounts.name;
            }
        }
        
        return page.AccountEditInfoPage;
    }
    
    public void save() {
        List<Account> updatedAccount = new List<Account>();
        for (Wrapper wr: accountList) {
            updatedAccount.add(wr.accounts);
        }
            
        update updatedAccount;
    }
    
    public pageReference cancel() {
        return page.AccountInformationPage;
    }
    
    public class Wrapper {
        public Account accounts {get;set;}
        public boolean selected {get;set;}
    }
}