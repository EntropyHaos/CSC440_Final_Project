package drivers;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

import entities.User;

public interface UserRepository extends MongoRepository<User, String> {

	List<User> findByEntityUserIdNumber(@Param("entityuserIdNumber") String entityuserIdNumber);
	// Sauce : http://stackoverflow.com/questions/17484153/how-to-delete-items-in-mongorepository-using-query-annotation
	Long deleteUserByEntityUserIdNumber(String entityuserIdNumber);
	// Sauce : http://stackoverflow.com/questions/16715010/count-in-spring-data-mongodb-repository
	Long countByEntityUserIdNumber(String entityuserIdNumber);
	// Sauce : this just seems reasonable?
	List<User> findAll();
	
	User findOneByEntityUserIdNumber(@Param("entityuserIdNumber") String entityuserIdNumber);
}    
