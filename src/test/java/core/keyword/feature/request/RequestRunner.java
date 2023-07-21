package core.keyword.feature.request;

import com.intuit.karate.junit5.Karate;

public class RequestRunner {
    @Karate.Test
    Karate getKeywords() {
        return Karate.run("request").relativeTo(getClass());
    }
}
