public inherited sharing class Animals {
    
    private static final String URL = 'https://th-apex-http-callout.herokuapp.com/animals';

    public static List<Animal__c>  getAnimalsFromURL() {
        JSONAnimals jsonAnimals = (JSONAnimals) HttpUtils.get(URl, JSONAnimals.class);
        return objectsMapper(jsonAnimals.animals);
    }

    public static Animal__c  getAnimalFromURL(String id) {
        return objectMapper((JSONAnimal) HttpUtils.get(URl + '/' + id, JSONAnimal.class));
    }

    private static Animal__c objectMapper(JSONAnimal jsonAnimal) {
        Animal__c animal = new Animal__c();
        animal.Name = jsonAnimal.animal.name;
        animal.ExternalId__c = String.valueOf(jsonAnimal.animal.id);
        animal.Says__c = jsonAnimal.animal.says;
        animal.Eats__c = jsonAnimal.animal.eats;
        return animal;
    }

    private static List<Animal__c> objectsMapper(List<String> jsonAnimals) {
        List<Animal__c> res = new List<Animal__c>();
        for (String name : jsonAnimals) {
            res.add(objectMapper(new JSOnAnimal(name)));
        }
        return res;
    }

    //{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}
    public class JSONAnimals {
        public List<String> animals;
    }

    //{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}
    public class JSONAnimal {
        public Animal animal;

        public JSONAnimal(String name) {
            animal = new Animal(name);
        }
    }

    public class Animal {

        Integer id;
        String name;
        String eats;
        String says;

        public Animal(String name) {
            this.name = name;
        }
    }
} 
