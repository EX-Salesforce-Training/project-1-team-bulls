trigger AddressTrigger on Address__c (after insert) {
    
        if(trigger.isafter)
        {
            if(trigger.isinsert)
            {
                addresstriggerhandler.matchContactandAddress(trigger.new);
            }
        }
    

}