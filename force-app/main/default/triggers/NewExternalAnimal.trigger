trigger NewExternalAnimal on Animal__c (after insert) {
    Map<Id, String> ids = new Map<Id, String>();
    for (Animal__c animal : TRIGGER.New) {
        if (!String.isBlank(animal.ExternalId__c)) {
            ids.put(animal.Id, animal.ExternalId__c);
        }
    }
    if (!ids.isEmpty()) {
        AnimalsUtils.updateExternalAnimals(ids);
    }
}