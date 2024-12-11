@isTest
private class AnimalLocatorTest {

    @isTest
    static void testGetAnimalNameById() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String results = AnimalLocator.getAnimalNameById(1);
        Assert.areEqual('chicken', results);
    }
}