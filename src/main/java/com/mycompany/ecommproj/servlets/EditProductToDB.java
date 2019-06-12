package com.mycompany.ecommproj.servlets;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.mycompany.ecommproj.dao.ProductDAO;
import com.mycompany.ecommproj.impl.ProductDAOImpl;
import com.mycompany.ecommproj.model.Product;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet(name = "EditProductToDB",urlPatterns = "/EditProductToDB")

public class EditProductToDB extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        Float price = Float.parseFloat(req.getParameter("price"));
        String description = req.getParameter("description");
        String CategoryName = req.getParameter("CategoryName");
        
        String image = null;
            
            Part p = req.getPart("image");
            
            System.out.println( p.getSubmittedFileName() );
            System.out.println( p.getName() );
            System.out.println( p.getSize() );

            String currPath = req.getRealPath("");
            System.out.println("Current Path:");
            System.out.println(currPath);

//            if( p.getSubmittedFileName().endsWith(".jpg") || p.getSubmittedFileName().endsWith(".jpeg")){
            if( true ){
                String filePath = currPath + "/image";
                FileOutputStream fos = new FileOutputStream(filePath);

                byte[] b = new byte[(int)p.getSize()];

                p.getInputStream().read(b);

                fos.write(b);

                fos.close();

                Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                    "cloud_name", "foodproject",
                    "api_key", "556492561541632",
                    "api_secret", "0MVQxKSwcupz9sxR9FyX2-wp_RI"));
            
                Map uploadResult = cloudinary.uploader().upload(new File(filePath), ObjectUtils.emptyMap());
            
                System.out.println( uploadResult.get("secure_url") );
            
                image = uploadResult.get("secure_url").toString();
            }
        
        
        
        Product prod = new Product();
        prod.setId(id);
        prod.setName( name );
        prod.setPrice(price);
        prod.setDescription( description );
        prod.setCategoryName(CategoryName);
        prod.setImageUrl(image);
        
        
        ProductDAO cdao = new ProductDAOImpl();
        
        cdao.update(prod);
        resp.sendRedirect("Viewproduct.jsp");
        
    }
 
    
    
}
