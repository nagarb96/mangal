package com.mycompany.ecommproj.dao;

import com.mycompany.ecommproj.model.Category;
import java.util.List;

public interface CategoryDAO {
   
    void insert(Category c);
    void update(Category c);
    
    void delete(int id);
    
    Category getCategory(int id);
    List<Category> getCategory();
    
}
