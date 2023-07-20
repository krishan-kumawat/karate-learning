package core.keyword.feature.url;

import com.intuit.karate.junit5.Karate;

public class UrlRunner {
    @Karate.Test
    Karate getKeywords() {
        return Karate.run("url").relativeTo(getClass());
    }
}
