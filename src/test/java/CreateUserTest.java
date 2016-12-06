//import models.UserModel;
//import entities.User;
import org.junit.Test;
import static org.junit.Assert.*;
import org.easymock.EasyMock;
import static org.easymock.EasyMock.*;

public class CreateUserTest {
    
    public CreateUserTest() {
    }
    
    /**
     *
     * @author prash_000
    @Test
    public void aUserIsNotValid() {
        User usr = new User();
        usr.setId("T12");
        usr.setFirstName("Test");
        usr.setAge(10);
        usr.setGender('X');
        usr.setLastName("Test");
        usr.setPhone("122");
        assertTrue(!usr.isValid());
    }
    
    @Test
    public void aUserIsCorrectlyCreated() {
        User usr = new User();
        usr.setId("T12");
        usr.setFirstName("Test");
        usr.setAge(10);
        usr.setGender('M');
        usr.setLastName("Test");
        usr.setPhone("1234567891");
        assertTrue(usr.isValid());
        
        UserModel userTestmodel = EasyMock.createMock(UserModel.class);
        expect(userTestmodel.createUser("T13", "Test","","Test",20,'M',"1234567891",12 
        )).andReturn(1);
    }
     */

}
