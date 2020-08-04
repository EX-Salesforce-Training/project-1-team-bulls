public class MailDummyData {

    public void mailConstruction() {
        List <Mail__c> mailList = new List <Mail__c>();
        
        for (integer i = 0; i < 25; i++) {
            Integer random = Integer.valueOf(math.random() * 135);
            Integer picklistRandom = Integer.valueOf(math.random() * 3);
            String [] picklist = new String [] {'Delivered', 'En Route', 'Missing', 'Not Shipped'};
            Mail__c newMail = new Mail__c();
            
            newMail.Tracking_ID__c = 10000 + i;
            system.debug(newMail.Tracking_ID__c);
            newMail.Name = 'Test Mail ' + random;
            newMail.Delivery_Status__c = picklist[picklistRandom];
            newMail.Price__c = math.mod(random, 2) + (picklistRandom + 1) / 10;
            
            if (picklist[picklistRandom] == 'Delivered') {
                newMail.Delivery_Time__c = Date.today();
            } else {
                newMail.Delivery_Time__c = Date.today() + 10;
            }
            
            mailList.add(newMail);
        }
        insert mailList;
    }
}