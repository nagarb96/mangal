package com.mycompany.ecommproj.impl;

import com.mycompany.ecommproj.dao.UserDAO;
import com.mycompany.ecommproj.model.Category;
import com.mycompany.ecommproj.model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {

    @Override
    public void insert(User u) {
        String query = "insert into user (email,username,password,phone,role,active) values (?,?,?,?,?,?)";

        try {

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");

            PreparedStatement pstmt = conn.prepareStatement(query);

//            pstmt.setString(1, u.getName());
//            pstmt.setString(2, u.getDescription());
            pstmt.setString(1, u.getEmail());
            pstmt.setString(2, u.getUsername());
            pstmt.setString(3, u.getPassword());
            pstmt.setString(4, u.getPhone());
            pstmt.setString(5, u.getRole());
            pstmt.setBoolean(6, u.isActive());

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(User u) {
        String query = "update user set Username=? , Password=?, Phone=? where Email=?";

        try {

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");

            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setString(4, u.getEmail());
            pstmt.setString(1, u.getUsername());
            pstmt.setString(2, u.getPassword());
            pstmt.setString(3, u.getPhone());

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            System.out.println("updated");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

        User u = new User();
//        c.setId(1);
//        c.setName("a");
//        c.setDescription("a");
        u.setEmail("Nagarb100@gmail.com");
        u.setUsername("Sachin Sain");
        u.setPassword("1234567890");
        u.setPhone("1234567890");

        UserDAO udao = new UserDAOImpl();

        udao.update(u);

        System.out.println("Updated!!");
    }

    @Override
    public List<User> getUser() {

        List<User> list = new ArrayList<>();

        String query = "select * from user";

        try {

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");

            PreparedStatement pstmt = conn.prepareStatement(query);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                User u = new User();

                u.setEmail(rs.getString("email"));
                u.setUsername(rs.getString("Username"));
                u.setPassword(rs.getString("Password"));
                u.setPhone(rs.getString("Phone"));
                u.setRole(rs.getString("Role"));
                u.setActive(rs.getBoolean("active"));
//                c.setId( rs.getInt("id") );
//                c.setName( rs.getString("name") );
//                c.setDescription(rs.getString("description") );

                list.add(u);

            }

            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    public void delete(String email) {
        String query = "delete from user where email= ?";

        try {

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");

            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setString(1, email);

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getUser(String email) {

        User u = null;

        String query = "select * from user where email = ?";

        try {

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");

            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                u = new User();

//                c.setId( rs.getInt("id") );
//                c.setName( rs.getString("name") );
//                c.setDescription(rs.getString("description") );
                u.setEmail(rs.getString("email"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setPhone(rs.getString("phone"));
                u.setRole(rs.getString("role"));
                return u;

            }

            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;

    }

    @Override
    public User getUser(String email, String password) {
        User c = null;

        String query = "select * from user where email = ? and password = ?";

        try {

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");

            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                c = new User();

                c.setEmail(rs.getString("email"));
                c.setUsername(rs.getString("username"));
                c.setPassword(rs.getString("password"));
                c.setPhone(rs.getString("phone"));
                c.setRole(rs.getString("role"));

                return c;

            }

            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return c;

    }

    @Override
    public boolean isAvailable(String email) {
        String query = "select * from user where email=?";
        try {

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");

            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery();

            return !rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

}
