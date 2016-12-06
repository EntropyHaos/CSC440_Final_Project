package drivers;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

import entities.Service;

public interface ServiceRepository extends MongoRepository<Service, String> {

	List<Service> findByEntityServiceIdNumber(@Param("entityserviceIdNumber") String entityserviceIdNumber);
	// Sauce : http://stackoverflow.com/questions/17484153/how-to-delete-items-in-mongorepository-using-query-annotation
	Long deleteServiceByEntityServiceIdNumber(String entityserviceIdNumber);
	// Sauce : http://stackoverflow.com/questions/16715010/count-in-spring-data-mongodb-repository
	Long countByEntityServiceIdNumber(String entityserviceIdNumber);
	// Sauce : this just seems reasonable?
	List<Service> findAll();

	Service findOneByEntityServiceIdNumber(@Param("serviceIdNumber") String serviceIdNumber);
}    
