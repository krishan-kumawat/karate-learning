package core.keyword.feature.param;

import com.intuit.karate.junit5.Karate;

public class ParamRunner {
    @Karate.Test
    Karate getKeywords() {
        return Karate.run("param").relativeTo(getClass());
    }
}
