public class AccountInformationController {

    public Account account {get;set;}
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
    public String userError {get;set;}
    public String userSuccess {get;set;}
    
    public void save() {
        Account acc = account;

        try {
            acc.Phone = phone;
            acc.BillingStreet = BillingStreet;
            acc.BillingCity = BillingCity;
            acc.BillingState = BillingState;
            acc.BillingPostalCode = BillingZip;
            acc.ShippingCity = ShippingCity;
            acc.ShippingState = ShippingState;
            acc.ShippingPostalCode = ShippingZip;
            acc.ShippingStreet = ShippingStreet;
            
            update acc;
            
            userSuccess = 'Successfully Updates Account Information';
        } catch (DMLException dmlError) {
            userError = 'Account was not able to be updated';
        } catch (NullPointerException nullPointer) {
            // Do nothing if the user attempts to update without 
            // having searched for an account.
        }
    }
    
    public pageReference cancel() {
        return page.AccountInformationPage;
    }
    
    public void searchAccount() {
        try {
            Account acc = ([SELECT Id, Name, BillingStreet, BillingCity, 
                               BillingState, BillingPostalCode, ShippingStreet, 
                               ShippingState, ShippingCity, ShippingPostalCode, Phone 
                               FROM Account WHERE name = :name LIMIT 1]);
    
            account = acc;
            
            phone = acc.Phone;
            BillingStreet = acc.BillingStreet;
            BillingCity = acc.BillingCity;
            BillingState = acc.BillingState;
            BillingZip = acc.BillingPostalCode;
            ShippingCity = acc.ShippingCity;
            ShippingState = acc.ShippingState;
            ShippingZip = acc.ShippingPostalCode;
            userError = null;
        } catch (QueryException error) {
            userError = 'No Account was found.';
            
            account = null;
            phone = null;
            BillingStreet = null;
            BillingCity = null;
            BillingState = null;
            BillingZip = null;
            ShippingCity = null;
            ShippingState = null;
            ShippingZip = null;
        }
    }
}