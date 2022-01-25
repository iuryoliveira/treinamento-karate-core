package features;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class IntegrationTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:features")
                //.outputCucumberJson(true)
                .outputJunitXml(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
