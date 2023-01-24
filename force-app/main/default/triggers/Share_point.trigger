trigger Share_point on Opportunity (after insert) {
    Set<Id> allInsertedIds = trigger.newMap.keySet();
    List<Opportunity > opp=[select Name,Id from Opportunity Where Id=:allInsertedIds];
    System.debug('test'+opp[0].Name);
    Opportunity__e newsEvent = new Opportunity__e(

           FolderName__c=opp[0].Name);

          
Database.SaveResult sr = EventBus.publish(newsEvent);

// Inspect publishing result

if (sr.isSuccess()) {

    System.debug('Successfully published event.');

} else {

    for(Database.Error err : sr.getErrors()) {

        System.debug('Error returned: ' +

                     err.getStatusCode() +

                     ' - ' +

                     err.getMessage());

    }

}
}