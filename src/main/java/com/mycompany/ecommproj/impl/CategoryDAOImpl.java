package com.mycompany.ecommproj.impl;

import com.mycompany.ecommproj.dao.CategoryDAO;
import com.mycompany.ecommproj.model.Category;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAOImpl implements CategoryDAO{

    @Override
    public void insert(Category c) {
        String query = "insert into category (name,description) values (?,?)";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, c.getName());
            pstmt.setString(2, c.getDescription());
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    }

    @Override
    public void update(Category c) {
        String query = "update category set name=? , description=? where id=?";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, c.getName());
            pstmt.setString(2, c.getDescription());
            pstmt.setInt(3, c.getId());
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
    
        Category c = new Category();
        c.setId(1);
        c.setName("a");
        c.setDescription("a");
        
        CategoryDAO cdao = new CategoryDAOImpl();
        
        cdao.update(c);

        System.out.println("Updated!!");
    }

    @Override
    public List<Category> getCategory() {
        
        List<Category> list = new ArrayList<>();
        
        String query = "select * from category";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()){
                Category c = new Category();
                
                c.setId( rs.getInt("id") );
                c.setName( rs.getString("name") );
                c.setDescription(rs.getString("description") );
                
                list.add(c);
                
                
            }
            
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        return list;
        
    }

    public void delete(int id) {
        String query = "delete from category where id = ?";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1,id);
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    }
    
    public Category getCategory(int id) {
        
        
        Category c = null;
        
        String query = "select * from category where id = ?";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, id);
            
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()){
                c = new Category();
                
                c.setId( rs.getInt("id") );
                c.setName( rs.getString("name") );
                c.setDescription(rs.getString("description") );
                
                return c;
                
                
            }
            
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        return c;
        
    }
    
}
