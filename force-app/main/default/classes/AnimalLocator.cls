public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer idParam){
        String result = '';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+idParam);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        //If the request is succesful, get the value of the name property (i.e., the animal name)
        if(response.getStatusCode().equals(200)){
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animal = (Map<String,Object>) results.get('animal');
             result = (String) animal.get('name');
            system.debug(result);
            
        }
        return result;
    }
}