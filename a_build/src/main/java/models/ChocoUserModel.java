package models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ChocoUserModel {
    private Map<String, Object> chocoUser;

    /**
     * Constructor
     */
    public ChocoUserModel() {
        this.chocoUser = new HashMap<>();
    }
    
    public int createChocoUser(String memberNumber, String memberName, String memberStreetAddress, String memberCity, String memberState, long memberZip){
        
        ChocoUserTable usr = new ChocoUserTable();

        usr.setMemberNumber(memberNumber);
        usr.setMemberName(memberName);
        usr.setMemberStreetAddress(memberStreetAddress);
        usr.setMemberCity(memberCity);
        usr.setMemberState(memberState);
        usr.setMemberZip(memberZip);
        chocoUser.put(memberNumber, usr);
    
        return 1;
    }
    
    /**
     * Check to find if a user is available
     * @param id
     * @return
     */
    public boolean checkChocoUser(String id) {
        Iterator it = chocoUser.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry pair = (Map.Entry)it.next();
            ChocoUserTable u = (ChocoUserTable)pair.getValue();
            if((u.getMemberNumber().equals(id)))
                return false;
        }
        return true;
    }
    
    public int updateChocoUser(String memberNumber, String memberName, String memberStreetAddress, String memberCity, String memberState, long memberZip){

        ChocoUserTable usr = (ChocoUserTable)chocoUser.get(memberNumber);

        usr.setMemberName(memberName);
        usr.setMemberStreetAddress(memberStreetAddress);
        usr.setMemberCity(memberCity);
        usr.setMemberState(memberState);
        usr.setMemberZip(memberZip);
        chocoUser.put(memberNumber, usr);
    
        return 1;
    }
    
    public boolean removeChocoUser(String id) {
        if(!checkChocoUser(id)) {
            chocoUser.remove(id);
            return true;    
        }
        return false;
    }
    public List sendElements() {
        List<Object> ret = new ArrayList<>(chocoUser.values());
        return ret;
    }

    public List sendChocoUsersId() {
        List<Object> ret = new ArrayList<>(chocoUser.keySet());
        return ret;
    }

} // Class generated by : Benjamin Haos