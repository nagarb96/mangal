package com.mycompany.ecommproj.dao;

import com.mycompany.ecommproj.model.Product;
import java.util.List;
import java.util.Map;

public interface ProductDAO {
   
    void insert(Product c);
    void update(Product c);
    
    void delete(int id);
    
    Product getProduct(int id);
    List<Product> getProduct();
    List<Product> getProduct(String catName);
    Map<String,List<Product>> getProductMap(List<Product> list);
    
}
