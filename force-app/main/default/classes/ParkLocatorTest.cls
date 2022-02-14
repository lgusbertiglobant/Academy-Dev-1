@isTest
public class ParkLocatorTest {
    @isTest static void testCallout(){
	Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'Argentina';
        List<String> parks = new List<String> {'Parque Nacional de Los Glaciares', 'Perito Moreno', 'El Leoncito'};
        System.assertEquals(parks, ParkLocator.country(country));
    }
}