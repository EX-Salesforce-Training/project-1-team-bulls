public class addresstriggerhandler {
       
    public static list<Address__c> matchContactandAddress(list<address__c> add)
    {
        
        list<contact> cont=new list<contact>();
        list<address__c> address=new list<Address__c>();
        
        //address.add(add);
        contact c1=new contact();
        address__c a1=new address__c();
        for(address__c a2:add)
        { 
            system.debug(a2.name);
        }
        
        return add;
    }
}