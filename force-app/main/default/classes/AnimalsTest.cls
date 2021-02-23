@IsTest
public inherited sharing class AnimalsTest {
    
    @IsTest
    static void getAnimalsFromURLTest() {
        Test.setMock(HttpCalloutMock.class, new AnimalsHttpCalloutMock());
        List<Animal__c> res = Animals.getAnimalsFromURL();
        System.assertEquals(2, res.size());  
        System.assertEquals('fluffy bunny', res.get(0).name);
    }

    @IsTest
    static void getAnimalFromURLTest() {
        Test.setMock(HttpCalloutMock.class, new AnimalsHttpCalloutMock()); 
        Animal__c animal = Animals.getAnimalFromURL('1');
        System.assertEquals('chicken', animal.name);
        System.assertEquals('1', animal.externalId__c);
        System.assertEquals('cluck cluck', animal.Says__c);
        System.assertEquals('chicken food', animal.Eats__c);
    }
}
