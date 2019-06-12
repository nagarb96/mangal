package com.mycompany.ecommproj.servlets;

import com.mycompany.ecommproj.dao.UserDAO;
import com.mycompany.ecommproj.impl.UserDAOImpl;
import com.mycompany.ecommproj.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/EditUserToDB")
public class EditUserToDB extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String catemail = req.getParameter("catemail");
        String catusername = req.getParameter("catusername");
        String catpassword = req.getParameter("catpassword");
        String catphone = req.getParameter("catphone");
        
        User u = new User();
        u.setEmail(catemail);
        u.setUsername(catusername);
        u.setPassword(catpassword);
        u.setPhone(catphone);
        UserDAO udao = new UserDAOImpl();
        
        udao.update(u);
        resp.sendRedirect("viewuser.jsp");
        
    }
 
    
    
}
