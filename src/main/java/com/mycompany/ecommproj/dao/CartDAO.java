package com.mycompany.ecommproj.dao;

import com.mycompany.ecommproj.model.Cart;
import java.util.List;
import java.util.Map;

public interface CartDAO {
    void insert(Cart c);
    void update(Cart c);
    
    void delete(int id);
    void delete(String userId);
    
    Cart getCart(int id);
    List<Cart> getCart();
    List<Cart> getCart(String userId);
    Map<String,List<Cart>> getCartMap(List<Cart> list);
    
}
