package drivers;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

import entities.Billable;

public interface BillableRepository extends MongoRepository<Billable, String> {

	List<Billable> findByEntityBillableIdNumber(@Param("entitybillableIdNumber") String entitybillableIdNumber);
	// Sauce : http://stackoverflow.com/questions/17484153/how-to-delete-items-in-mongorepository-using-query-annotation
	Long deleteBillableByEntityBillableIdNumber(String entitybillableIdNumber);
	// Sauce : http://stackoverflow.com/questions/16715010/count-in-spring-data-mongodb-repository
	Long countByEntityBillableIdNumber(String entitybillableIdNumber);
	// Sauce : this just seems reasonable?
	List<Billable> findAll();
}    
