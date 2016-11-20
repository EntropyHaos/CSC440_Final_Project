package drivers;

// TODO : REMOVE UN-NEEDED IMPORTS! 
// TODO : Finish Commenting the imports.

// Imports for spring framework.

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.CommandLineRunner;

import org.springframework.beans.factory.annotation.Autowired;

// Imports for spark framework.

import static spark.Spark.*;
import spark.ModelAndView;
import templateEngine.FreeMarkerEngine;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import java.io.IOException;

import entities.*;
import controls.*;

@SpringBootApplication
public class Application implements CommandLineRunner{

	@Autowired
	private BillableRepository billableRepository;
	@Autowired
	private ProviderRepository providerRepository;
	@Autowired
	private ServiceRepository serviceRepository;
	@Autowired
	private UserRepository userRepository;

    	private ChocoMongoController mongoController = new ChocoMongoController();

	public static void main(String[] args) {

        // For Testing and Debug.
        boolean dBug = true;
        if (dBug) System.out.println("\nDEBUG ON IN : Application.main\n");

		SpringApplication.run(Application.class, args);

		if (dBug) System.out.println("\n\n\n\nSPRING SERVER RUNNING!\n");
		if (dBug) System.out.println("\nSPARK SERVER RUNNING!\n\n\n\n");
	}

	@Override
	public void run(String... args) throws Exception {
        // This allow non static method to be called from static main while
        // allowing same method to access 'autowired' repositories.

        // For Testing and Debug.
        boolean dBug = false;
        if (dBug) System.out.println("\nDEBUG ON IN : Application.run\n");

        startSparkServer();
	}

    private void startSparkServer() {

        // For Testing and Debug.
        boolean dBug = false;
        if (dBug) System.out.println("\nDEBUG ON IN : Application.startSparkServer\n");

        // Set vars for Spark Server.
        staticFileLocation("/public");
        port(8080); // Spark Server will run on port 8080


        // Functions for Spark Server Routes

        // Landing/Home Page Route.
        get("/", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("title", "Welcome to Team Five's Final Project!");
           viewObjects.put("templateName", "aHome.ftl");
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());

        get("/createBillable", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("templateName", "createBillableForm.ftl");
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());
        
        post("/createBillable", (request, response) -> {
            ObjectMapper mapper = new ObjectMapper();
            try {
                Billable u = mapper.readValue(request.body(), Billable.class);
                
                if (!u.isValid(u)) {
                    response.status(400);
                    return "Correct the fields";
                }
                
                if(billableRepository.countByEntityBillableIdNumber(u.getEntityBillableIdNumber()) == 0) {
                    
                    int id = 1;

                    if (dBug) System.out.println("request.body() = " + request.body());
                    if (dBug) System.out.println("u = " + convertObjectToJSON(u));
                    
                    billableRepository.save(u);
                    response.status(200);
                    response.type("application/json");
                    return id;
                }
                else {
                    response.status(400);
                    response.type("application/json");
                    
                    return "Billable ID Number Already Exists!!";
                }
                } catch (JsonParseException jpe) {
                    response.status(404);
                    return "Exception";
                }
        });
        
        get("/getAllBillables", (request, response) -> {
            response.status(200);
            Map<String, Object> viewObjects = new HashMap<String, Object>();
            viewObjects.put("templateName", "showBillable.ftl");
            return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());

        get("/getJsonBillableList", (request, response) -> {
            response.status(200);
            return mongoController.getJSONListOfObjectsFromRepo(billableRepository);
        });

        get("/removeBillable", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("templateName", "removeBillableForm.ftl");
           viewObjects.put("billables", mongoController.getJSONListOfIdsFromRepo(billableRepository));
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());

        put("/removeBillable/:id", (request, response) -> {
            String id = request.params(":id");
            
            long numRemoved = billableRepository.deleteBillableByEntityBillableIdNumber(id);
            
            if (numRemoved == 1){
                response.status(200);
                return "One Billable Removed.";
            } else if (numRemoved > 1){
                response.status(200);
                String returnString = "" + numRemoved + " Billables REMOVED!!";
                return returnString;
            }
            else {
                response.status(400);
                return "No Such Billable Found.";
            }
        });
        
        get("/updateBillable", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("templateName", "updateBillableForm.ftl");
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());
        
        post("/updateBillable", (request, response) -> {
            ObjectMapper mapper = new ObjectMapper();
            
            try {
                Billable u = mapper.readValue(request.body(), Billable.class);
                
                if (!u.isValid(u)) {
                    response.status(400);
                    return "Correct The Fields.";
                }
                if(billableRepository.countByEntityBillableIdNumber(u.getEntityBillableIdNumber()) == 1) {
                    billableRepository.deleteBillableByEntityBillableIdNumber(u.getEntityBillableIdNumber());
                    billableRepository.save(u);
                    response.status(200);
                    response.type("application/json");
                    return 1;
                } else {
                    response.status(404);
                    return "Billable Does Not Exists or More Than One Exists.";
                }
            } catch (JsonParseException jpe) {
                response.status(404);
                return "Exception";
            }
        });

        // Useful for testing and debuging.
        get("/getJsonBillableIdsList", (request, response) -> {
            response.status(200);
            return mongoController.getJSONListOfIdsFromRepo(billableRepository);
        });
        
        get("/createProvider", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("templateName", "createProviderForm.ftl");
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());
        
        post("/createProvider", (request, response) -> {
            ObjectMapper mapper = new ObjectMapper();
            try {
                Provider u = mapper.readValue(request.body(), Provider.class);
                
                if (!u.isValid(u)) {
                    response.status(400);
                    return "Correct the fields";
                }
                
                if(providerRepository.countByEntityProviderIdNumber(u.getEntityProviderIdNumber()) == 0) {
                    
                    int id = 1;

                    if (dBug) System.out.println("request.body() = " + request.body());
                    if (dBug) System.out.println("u = " + convertObjectToJSON(u));
                    
                    providerRepository.save(u);
                    response.status(200);
                    response.type("application/json");
                    return id;
                }
                else {
                    response.status(400);
                    response.type("application/json");
                    
                    return "Provider ID Number Already Exists!!";
                }
                } catch (JsonParseException jpe) {
                    response.status(404);
                    return "Exception";
                }
        });
        
        get("/getAllProviders", (request, response) -> {
            response.status(200);
            Map<String, Object> viewObjects = new HashMap<String, Object>();
            viewObjects.put("templateName", "showProvider.ftl");
            return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());

        get("/getJsonProviderList", (request, response) -> {
            response.status(200);
            return mongoController.getJSONListOfObjectsFromRepo(providerRepository);
        });

        get("/removeProvider", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("templateName", "removeProviderForm.ftl");
           viewObjects.put("providers", mongoController.getJSONListOfIdsFromRepo(providerRepository));
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());

        put("/removeProvider/:id", (request, response) -> {
            String id = request.params(":id");
            
            long numRemoved = providerRepository.deleteProviderByEntityProviderIdNumber(id);
            
            if (numRemoved == 1){
                response.status(200);
                return "One Provider Removed.";
            } else if (numRemoved > 1){
                response.status(200);
                String returnString = "" + numRemoved + " Providers REMOVED!!";
                return returnString;
            }
            else {
                response.status(400);
                return "No Such Provider Found.";
            }
        });
        
        get("/updateProvider", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("templateName", "updateProviderForm.ftl");
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());
        
        post("/updateProvider", (request, response) -> {
            ObjectMapper mapper = new ObjectMapper();
            
            try {
                Provider u = mapper.readValue(request.body(), Provider.class);
                
                if (!u.isValid(u)) {
                    response.status(400);
                    return "Correct The Fields.";
                }
                if(providerRepository.countByEntityProviderIdNumber(u.getEntityProviderIdNumber()) == 1) {
                    providerRepository.deleteProviderByEntityProviderIdNumber(u.getEntityProviderIdNumber());
                    providerRepository.save(u);
                    response.status(200);
                    response.type("application/json");
                    return 1;
                } else {
                    response.status(404);
                    return "Provider Does Not Exists or More Than One Exists.";
                }
            } catch (JsonParseException jpe) {
                response.status(404);
                return "Exception";
            }
        });

        // Useful for testing and debuging.
        get("/getJsonProviderIdsList", (request, response) -> {
            response.status(200);
            return mongoController.getJSONListOfIdsFromRepo(providerRepository);
        });
        
        get("/createService", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("templateName", "createServiceForm.ftl");
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());
        
        post("/createService", (request, response) -> {
            ObjectMapper mapper = new ObjectMapper();
            try {
                Service u = mapper.readValue(request.body(), Service.class);
                
                if (!u.isValid(u)) {
                    response.status(400);
                    return "Correct the fields";
                }
                
                if(serviceRepository.countByEntityServiceIdNumber(u.getEntityServiceIdNumber()) == 0) {
                    
                    int id = 1;

                    if (dBug) System.out.println("request.body() = " + request.body());
                    if (dBug) System.out.println("u = " + convertObjectToJSON(u));
                    
                    serviceRepository.save(u);
                    response.status(200);
                    response.type("application/json");
                    return id;
                }
                else {
                    response.status(400);
                    response.type("application/json");
                    
                    return "Service ID Number Already Exists!!";
                }
                } catch (JsonParseException jpe) {
                    response.status(404);
                    return "Exception";
                }
        });
        
        get("/getAllServices", (request, response) -> {
            response.status(200);
            Map<String, Object> viewObjects = new HashMap<String, Object>();
            viewObjects.put("templateName", "showService.ftl");
            return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());

        get("/getJsonServiceList", (request, response) -> {
            response.status(200);
            return mongoController.getJSONListOfObjectsFromRepo(serviceRepository);
        });

        get("/removeService", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("templateName", "removeServiceForm.ftl");
           viewObjects.put("services", mongoController.getJSONListOfIdsFromRepo(serviceRepository));
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());

        put("/removeService/:id", (request, response) -> {
            String id = request.params(":id");
            
            long numRemoved = serviceRepository.deleteServiceByEntityServiceIdNumber(id);
            
            if (numRemoved == 1){
                response.status(200);
                return "One Service Removed.";
            } else if (numRemoved > 1){
                response.status(200);
                String returnString = "" + numRemoved + " Services REMOVED!!";
                return returnString;
            }
            else {
                response.status(400);
                return "No Such Service Found.";
            }
        });
        
        get("/updateService", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("templateName", "updateServiceForm.ftl");
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());
        
        post("/updateService", (request, response) -> {
            ObjectMapper mapper = new ObjectMapper();
            
            try {
                Service u = mapper.readValue(request.body(), Service.class);
                
                if (!u.isValid(u)) {
                    response.status(400);
                    return "Correct The Fields.";
                }
                if(serviceRepository.countByEntityServiceIdNumber(u.getEntityServiceIdNumber()) == 1) {
                    serviceRepository.deleteServiceByEntityServiceIdNumber(u.getEntityServiceIdNumber());
                    serviceRepository.save(u);
                    response.status(200);
                    response.type("application/json");
                    return 1;
                } else {
                    response.status(404);
                    return "Service Does Not Exists or More Than One Exists.";
                }
            } catch (JsonParseException jpe) {
                response.status(404);
                return "Exception";
            }
        });

        // Useful for testing and debuging.
        get("/getJsonServiceIdsList", (request, response) -> {
            response.status(200);
            return mongoController.getJSONListOfIdsFromRepo(serviceRepository);
        });
        
        get("/createUser", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("templateName", "createUserForm.ftl");
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());
        
        post("/createUser", (request, response) -> {
            ObjectMapper mapper = new ObjectMapper();
            try {
                User u = mapper.readValue(request.body(), User.class);
                
                if (!u.isValid(u)) {
                    response.status(400);
                    return "Correct the fields";
                }
                
                if(userRepository.countByEntityUserIdNumber(u.getEntityUserIdNumber()) == 0) {
                    
                    int id = 1;

                    if (dBug) System.out.println("request.body() = " + request.body());
                    if (dBug) System.out.println("u = " + convertObjectToJSON(u));
                    
                    userRepository.save(u);
                    response.status(200);
                    response.type("application/json");
                    return id;
                }
                else {
                    response.status(400);
                    response.type("application/json");
                    
                    return "User ID Number Already Exists!!";
                }
                } catch (JsonParseException jpe) {
                    response.status(404);
                    return "Exception";
                }
        });
        
        get("/getAllUsers", (request, response) -> {
            response.status(200);
            Map<String, Object> viewObjects = new HashMap<String, Object>();
            viewObjects.put("templateName", "showUser.ftl");
            return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());

        get("/getJsonUserList", (request, response) -> {
            response.status(200);
            return mongoController.getJSONListOfObjectsFromRepo(userRepository);
        });

        get("/removeUser", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("templateName", "removeUserForm.ftl");
           viewObjects.put("users", mongoController.getJSONListOfIdsFromRepo(userRepository));
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());

        put("/removeUser/:id", (request, response) -> {
            String id = request.params(":id");
            
            long numRemoved = userRepository.deleteUserByEntityUserIdNumber(id);
            
            if (numRemoved == 1){
                response.status(200);
                return "One User Removed.";
            } else if (numRemoved > 1){
                response.status(200);
                String returnString = "" + numRemoved + " Users REMOVED!!";
                return returnString;
            }
            else {
                response.status(400);
                return "No Such User Found.";
            }
        });
        
        get("/updateUser", (request, response) -> {
           Map<String, Object> viewObjects = new HashMap<String, Object>();
           viewObjects.put("templateName", "updateUserForm.ftl");
           return new ModelAndView(viewObjects, "aMain.ftl");
        }, new FreeMarkerEngine());
        
        post("/updateUser", (request, response) -> {
            ObjectMapper mapper = new ObjectMapper();
            
            try {
                User u = mapper.readValue(request.body(), User.class);
                
                if (!u.isValid(u)) {
                    response.status(400);
                    return "Correct The Fields.";
                }
                if(userRepository.countByEntityUserIdNumber(u.getEntityUserIdNumber()) == 1) {
                    userRepository.deleteUserByEntityUserIdNumber(u.getEntityUserIdNumber());
                    userRepository.save(u);
                    response.status(200);
                    response.type("application/json");
                    return 1;
                } else {
                    response.status(404);
                    return "User Does Not Exists or More Than One Exists.";
                }
            } catch (JsonParseException jpe) {
                response.status(404);
                return "Exception";
            }
        });

        // Useful for testing and debuging.
        get("/getJsonUserIdsList", (request, response) -> {
            response.status(200);
            return mongoController.getJSONListOfIdsFromRepo(userRepository);
        });
        
    }
    
    private String convertObjectToJSON(Object obj) {
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

