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

@WebServlet(urlPatterns = "/EditCategoryToDB")
public class EditCategoryToDB extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        int id = Integer.parseInt(req.getParameter("id"));
        
        String catname = req.getParameter("catname");
        String catdesc = req.getParameter("catdesc");
        
        Category c = new Category();
        c.setId(id);
        c.setName( catname );
        c.setDescription( catdesc );
        
        CategoryDAO cdao = new CategoryDAOImpl();
        
        cdao.update(c);
        resp.sendRedirect("ViewCategories.jsp");
        
    }
 
    
    
}
