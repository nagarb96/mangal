package com.mycompany.ecommproj.servlets;

import com.mycompany.ecommproj.dao.CategoryDAO;
import com.mycompany.ecommproj.impl.CategoryDAOImpl;
import com.mycompany.ecommproj.model.Category;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/AddCategoryToDB")
public class AddCategoryToDB extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String catname = req.getParameter("catname");
        String catdesc = req.getParameter("catdesc");
        
        System.out.printf("Cat Name: %s, Cat Desc: %s",catname, catdesc);
        
        Category c = new Category();
        c.setName( catname );
        c.setDescription( catdesc );
        
        CategoryDAO cdao = new CategoryDAOImpl();
        
        cdao.insert(c);

        System.out.println("Inserted!!");
        
        resp.sendRedirect("ViewCategories.jsp");
        
    }
 
    
    
}
