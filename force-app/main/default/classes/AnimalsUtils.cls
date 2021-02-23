public inherited sharing class AnimalsUtils {
    
    @future(callout=true)
    public static void insertExternalAnimals() {
        insert Animals.getAnimalsFromURL();
    }

    @future(callout=true)
    public static void updateExternalAnimals(Id internalId, String externalId) {
        Animal__c animal = Animals.getAnimalFromURL(externalId);
        animal.Id = internalId;
        update animal;
    }

    @future(callout=true)
    public static void updateExternalAnimals(Map<Id, String> ids) {
        List<Animal__c> res = new List<Animal__c>();
        for (Id internalId : ids.keySet()) {
            Animal__c animal = Animals.getAnimalFromURL(ids.get(internalId));
            animal.Id = internalId;
            res.add(animal);
        }
        update res;
    }
}
