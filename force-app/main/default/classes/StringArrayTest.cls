public class StringArrayTest {
    public static List<String> generateStringArray(Integer numbers){
        List<String> numList = new List<String>();
        for(Integer i = 0; i < numbers; i++){
            numList.add('Test ' + i);
        }
        return numList;
    }

}