package system;

import java.util.*; 


public class User{

    String uuid = "";
    

    public User(String u){
        uuid = u;
      
    }

    public String getUsername(){
        return uuid;
    }

    public void setUsername(String username){
        uuid = username;
    }
}