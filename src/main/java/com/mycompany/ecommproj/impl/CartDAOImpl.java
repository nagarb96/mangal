package com.mycompany.ecommproj.impl;

import com.mycompany.ecommproj.dao.CartDAO;
import com.mycompany.ecommproj.dao.ProductDAO;
import com.mycompany.ecommproj.model.Cart;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CartDAOImpl implements CartDAO{

    @Override
    public void delete(String userId) {
        String query = "delete from Cart where userId = ?";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, userId);
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    }

    @Override
    public void insert(Cart c) {
        String query = "insert into Cart (id,productid,qty,userid) values (?,?,?,?)";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, c.getId());
            pstmt.setInt(2, c.getPid());
            pstmt.setInt(3, c.getQty());
            pstmt.setString(4, c.getUserId());
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    }

    @Override
    public void update(Cart c) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) {
                String query = "delete from cart where id = ?";
                
        try {
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
        
        PreparedStatement  pstmt = conn.prepareStatement(query);
        pstmt.setInt(1,id);
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
        }

    }

    @Override
    public Cart getCart(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Cart> getCart() {
            List<Cart> list = new ArrayList<>();
        
        String query = "select * from Cart";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            ResultSet rs = pstmt.executeQuery();
            
            ProductDAO pdao = new ProductDAOImpl();
            
            while(rs.next()){
                Cart c = new Cart();
                
                c.setId( rs.getInt("id") );
                c.setPid(rs.getInt("productid"));
                c.setQty( rs.getInt("qty"));
                c.setUserId(rs.getString("userid"));
                
                c.setProduct(pdao.getProduct(c.getPid()));
                
                list.add(c);
                
                
            }
            
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        System.out.println("cart list:");
        System.out.println(list);
        
        return list;
        
    }
    
    @Override
    public List<Cart> getCart(String userId) {
            List<Cart> list = new ArrayList<>();
        
        String query = "select * from Cart where userId = ?";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, userId);
            
            ResultSet rs = pstmt.executeQuery();
            
            ProductDAO pdao = new ProductDAOImpl();
            
            while(rs.next()){
                Cart c = new Cart();
                
                c.setId( rs.getInt("id") );
                c.setPid(rs.getInt("productid"));
                c.setQty( rs.getInt("qty"));
                c.setUserId(rs.getString("userid"));
                
                c.setProduct(pdao.getProduct(c.getPid()));
                
                list.add(c);
                
                
            }
            
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        System.out.println("cart list:");
        System.out.println(list);
        
        return list;
        
    }

    @Override
    public Map<String, List<Cart>> getCartMap(List<Cart> list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    }

    


    
