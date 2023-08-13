package multipleTagRun;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;
import com.intuit.karate.Runner;
import com.intuit.karate.Results;
public class TagRunner {

    @Karate.Test
    Karate runTagTest() {
        List<String> tagsList = new ArrayList<>();
        tagsList.add("@one");
//        tagsList.add("@two");
//        tagsList.add("one");
        return Karate.run("tags").tags("one, two").relativeTo(getClass());
    }

    @Test
    void testTags() {
        List<String> tags = new ArrayList<>();
        tags.add("@one");
        tags.add("@two");
        Results results = Runner.path("tags")
                .tags(tags)
                .parallel(5);
    }
}
