package com.mycompany.ecommproj.impl;

import com.mycompany.ecommproj.dao.ProductDAO;
import com.mycompany.ecommproj.model.Product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDAOImpl implements ProductDAO{

    @Override
    public void insert(Product c) {
        String query = "insert into products (name,price,description,CategoryName,imagepath) values (?,?,?,?,?)";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, c.getName());
            pstmt.setFloat(2, c.getPrice());
            pstmt.setString(3, c.getDescription());
            pstmt.setString(4, c.getCategoryName());
            pstmt.setString(5, c.getImageUrl());
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    }

    @Override
    public void update(Product c) {
        String query = "update products set name=?,price=? , description=?, categoryname=?,imagepath=? where id=?";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, c.getName());
            pstmt.setFloat(2,c.getPrice());
            pstmt.setString(3, c.getDescription());
            pstmt.setString(4, c.getCategoryName());
            pstmt.setString(5, c.getImageUrl());
            pstmt.setInt(6, c.getId());
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
    
        Product c = new Product();
        c.setId(1);
        c.setName("a");
        c.setPrice(1);
        c.setDescription("a");
        c.setCategoryName("a");
        c.setImageUrl("a");
        
        ProductDAO cdao = new ProductDAOImpl();
        
        cdao.update(c);

        System.out.println("Updated!!");
    }

    @Override
    public List<Product> getProduct() {
        
        List<Product> list = new ArrayList<>();
        
        String query = "select * from products";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()){
                Product c = new Product();
                
                c.setId( rs.getInt("id") );
                c.setPrice(rs.getFloat("price"));
                c.setName( rs.getString("name"));
                c.setDescription(rs.getString("description"));
                c.setCategoryName(rs.getString("CategoryName"));
                c.setImageUrl(rs.getString("Imagepath"));
                
                list.add(c);
                
                
            }
            
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        System.out.println("product list:");
        System.out.println(list);
        
        return list;
        
    }
    
    @Override
    public List<Product> getProduct( String catName ) {
        
        List<Product> list = new ArrayList<>();
        
        String query = "select * from products where categoryname = ?";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, catName);
            
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()){
                Product c = new Product();
                
                c.setId( rs.getInt("id") );
                c.setPrice(rs.getFloat("price"));
                c.setName( rs.getString("name"));
                c.setDescription(rs.getString("description"));
                c.setCategoryName(rs.getString("CategoryName"));
                c.setImageUrl(rs.getString("Imagepath"));
                
                list.add(c);
                
                
            }
            
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        System.out.println("product list:");
        System.out.println(list);
        
        return list;
        
    }

    public void delete(int id) {
        String query = "delete from products where id = ?";
        
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
    
    public Product getProduct(int id) {
        
        
        Product c = null;
        
        String query = "select * from products where id = ?";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, id);
            
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()){
                c = new Product();
                
                c.setId( rs.getInt("id") );
                c.setPrice(rs.getFloat("price"));
                c.setName( rs.getString("name") );
                c.setDescription(rs.getString("description") );
                c.setCategoryName(rs.getString("CategoryName"));
                c.setImageUrl(rs.getString("ImagePath"));
                
                return c;
                
                
            }
            
            pstmt.close();
            conn.close();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        return c;
        
    }

    @Override
    public Map<String, List<Product>> getProductMap(List<Product> list) {
        Map<String, List<Product>> productMap = new HashMap<>();
    
        productMap.put("Uncategorized", new ArrayList<Product>());
        
        for( Product p : list ){
            if( p.getCategoryName() == null || p.getCategoryName().equals("") ){
                productMap.get("Uncategorized").add(p);
            }else{
                if(productMap.containsKey(p.getCategoryName())){
                    productMap.get(p.getCategoryName()).add(p);
                }else{
                    List<Product> temp = new ArrayList<>();
                    temp.add(p);
                    productMap.put(p.getCategoryName(),temp);
                }
            }
        }
        
        return productMap;
    }
    
    
    
}
