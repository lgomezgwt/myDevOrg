public class StringArrayTest {
    public static List<String> generateStringArray(Integer quantity) {
        List<String> stringList = new List<String>();
        
        for(Integer i = 0; i < quantity; ++i) {
            String currentString = 'Test ' + i;
            stringList.add(currentString);
        }
        
        System.debug(stringList);
        return stringList;
    }
}