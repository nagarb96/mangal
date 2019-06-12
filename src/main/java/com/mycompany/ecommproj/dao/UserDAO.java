package com.mycompany.ecommproj.dao;

import com.mycompany.ecommproj.model.User;
import java.util.List;

public interface UserDAO {
   
    void insert(User u);
    void update(User u);
    
    void delete(String email);
    
    User getUser(String email);
    
    User getUser(String email, String password);
    
    boolean isAvailable(String email);
    
    List<User> getUser();
}
