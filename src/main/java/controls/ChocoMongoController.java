package controls;

// Needed for : convertObjectToJSON() Method.
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import java.io.IOException;
import java.io.StringWriter;

// Needed for : getJSONListOfIdsFromRepo() Method.
import org.springframework.data.mongodb.repository.MongoRepository;
import java.util.List;

public class ChocoMongoController {
    
    // Basic Constructor
    public ChocoMongoController() {
    }

    public String getJSONListOfIdsFromRepo(MongoRepository repoToGetIdsFrom){
        
        // For Testing and Debug.
        boolean dBug = false;
        if (dBug) System.out.println("\nDEBUG ON IN : ChocoMongoController.getJSONListOfIdsFromRepo\n");
        
        String returnString = "[";
        
        List<String> repoObjects = repoToGetIdsFrom.findAll();
        
        for (int i = 0; i < repoObjects.size(); i++) {
            if (i > 0){
                returnString += ",\n    ";
            } else {
                returnString += "\n    ";
            }
            
            String temp = convertObjectToJSON(repoObjects.get(i));
            temp = temp.substring((temp.indexOf(": \"")+2),(temp.indexOf(",")));
            returnString += temp;
		}
		returnString += "\n]\n";
        
        if (dBug) System.out.println("\n" + returnString + "\n");
        return returnString;
    }

    public String getJSONListOfObjectsFromRepo(MongoRepository repoToGetObjectsFrom){

        // For Testing and Debug.
        boolean dBug = false;
        if (dBug) System.out.println("\nDEBUG ON IN : ChocoMongoController.getJSONListOfObjectsFromRepo\n");
        
        String returnString = "[";
        
        List<String> repoObjects = repoToGetObjectsFrom.findAll();
        
        for (int i = 0; i < repoObjects.size(); i++) {
            if (i > 0){
                returnString += ",\n    ";
            } else {
                returnString += "\n    ";
            }
            String temp = convertObjectToJSON(repoObjects.get(i));
            returnString += temp;
		}
        returnString += "\n]\n";
        
        if (dBug) System.out.println("returnString : \n" + returnString);
        return returnString;
    }

    private static String convertObjectToJSON(Object obj) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            mapper.enable(SerializationFeature.INDENT_OUTPUT);
            StringWriter sw = new StringWriter();
            mapper.writeValue(sw, obj);
            return sw.toString();
        }
        catch(IOException e) {
            System.err.println(e);
        }
        return null;
    }

}
