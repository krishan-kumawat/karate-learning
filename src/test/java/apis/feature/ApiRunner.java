package apis.feature;

import com.intuit.karate.junit5.Karate;

public class ApiRunner {
    @Karate.Test
    Karate testApis(){
        return  Karate.run("get").relativeTo(getClass());
    }
}
