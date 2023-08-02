//import edu.umd.cs.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import org.json.JSONObject;
public class PropertiesManager {
    private static PropertiesManager instance = null;
    private transient JSONObject config = null;

    private PropertiesManager() {
        String filePath = "src/test/java/"
               + "properties.json";

        try {
            String jsonString = new String(Files.readAllBytes(Paths.get(filePath)), StandardCharsets.UTF_8);
            config = new JSONObject(jsonString);
        } catch (Exception e) {
            System.out.println("error "+ e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * This singleton method will be responsable of creating the instance.
     */
//    @SuppressFBWarnings(value = "DC_DOUBLECHECK")
    private static PropertiesManager getInstance() {
        if (instance == null) {
            synchronized (PropertiesManager.class) {
                if (instance == null) {
                    instance = new PropertiesManager();
                }
            }
        }
        return instance;
    }

    private JSONObject getJsonObject() {
        return config;
    }

    public static String getProperty(String property) {
        return  getInstance().getJsonObject().getString(property);
    }
}
