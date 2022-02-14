public class ParkLocator {
    public static List<String> country(String searchCountry){
        ParkService.ParksImplPort search = new ParkService.ParksImplPort();
        return search.byCountry(searchCountry);
    }
}