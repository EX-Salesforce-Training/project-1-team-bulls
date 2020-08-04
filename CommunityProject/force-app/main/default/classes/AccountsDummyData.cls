public class AccountsDummyData {

    public void accountConstruction() {
        List <Account> accountList = new List<Account>();
        
        for (integer i = 0; i < 25; i++) {
            Account newAccount = new Account(name = ('Test ' + i));
  			Integer random = Integer.valueOf(math.random() * 99);
            
            newAccount.Phone = '333-' + (random + 100);
            newAccount.ShippingCity = 'Test City ' + random;
            newAccount.ShippingCountry = 'Test Country ' + random;
            newAccount.ShippingPostalCode = '11' + random;
            newAccount.ShippingState = 'Test State ' + random;
            newAccount.ShippingStreet = 'Test Street ' + random;
            
            accountList.add(newAccount);
        }
        
        insert accountList;
    }
}