trigger Sharepoint on Opportunity__e (after insert) {
    List<Opportunity__e> partsReceived = Trigger.new;
    System.debug('id'+partsReceived[0]);
    
   // List<Opportunity> parts = [SELECT Id, Name FROM Opportunity WHERE Id =:partNumbers];


}