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

@WebServlet(urlPatterns = "/AddusertoDB")
public class AddusertoDB extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String catemail = req.getParameter("catemail");
        String catusername = req.getParameter("catusername");
        String catpassword = req.getParameter("catpassword");
        String catphone = req.getParameter("catphone");
        String catrole = req.getParameter("catrole");
        String catactive = req.getParameter("catactive");
        System.out.printf("Cat email: %s, Cat username: %s, Cat password %s, Cat phone %s, Cat role %s, Cat active %s",catemail, catusername, catpassword, catphone, catrole, catactive);
        
        User u = new User();
        u.setEmail(catemail);
        u.setUsername(catusername);
        u.setPassword(catpassword);
        u.setPhone(catphone);
        u.setRole(catrole);
        u.setActive(true);
        
        
        UserDAO udao = new UserDAOImpl();
        
        udao.insert(u);

        System.out.println("Inserted!!");
        
        resp.sendRedirect("FoodHub.jsp");
        
    }
 
    
    
}
