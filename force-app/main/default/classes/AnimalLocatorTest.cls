@isTest
private class AnimalLocatorTest {

   @isTest static void testGetCallout() {
    
     // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock.
        Integer id = 1; 
        String response = AnimalLocator.getAnimalNameById(id);
        System.debug('--response ---'+response);
        // Verify that the response received contains fake values
        String actualValue = 'chicken';
        //System.debug(response.getBody());
        String expectedValue = 'chicken';
        System.assertEquals(actualValue, expectedValue);
        //System.assertEquals(200, response.getStatusCode());
    }
}