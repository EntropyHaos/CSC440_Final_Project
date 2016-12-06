package drivers;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

import entities.Provider;

public interface ProviderRepository extends MongoRepository<Provider, String> {

	List<Provider> findByEntityProviderIdNumber(@Param("entityproviderIdNumber") String entityproviderIdNumber);
	// Sauce : http://stackoverflow.com/questions/17484153/how-to-delete-items-in-mongorepository-using-query-annotation
	Long deleteProviderByEntityProviderIdNumber(String entityproviderIdNumber);
	// Sauce : http://stackoverflow.com/questions/16715010/count-in-spring-data-mongodb-repository
	Long countByEntityProviderIdNumber(String entityproviderIdNumber);
	// Sauce : tHESE just seems reasonable?
	List<Provider> findAll();
	Provider findOneByEntityProviderIdNumber(@Param("providerIdNumber") String providerIdNumber);
}    
