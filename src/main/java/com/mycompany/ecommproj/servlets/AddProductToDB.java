package com.mycompany.ecommproj.servlets;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.mycompany.ecommproj.dao.ProductDAO;
import com.mycompany.ecommproj.impl.ProductDAOImpl;
import com.mycompany.ecommproj.model.Product;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet(name = "AddProductToDB", urlPatterns = {"/AddProductToDB"})
public class AddProductToDB extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String name = request.getParameter("name");
            float price = Float.parseFloat(request.getParameter("price"));
            String description = request.getParameter("description");  
            String CategoryName = request.getParameter("CategoryName");
            
            
            String imgPath = null;
            
            Part p = request.getPart("image");
            
            System.out.println( p.getSubmittedFileName() );
            System.out.println( p.getName() );
            System.out.println( p.getSize() );

            String currPath = request.getRealPath("");
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
            
                imgPath = uploadResult.get("secure_url").toString();
            }
                
            
            Product prod = new Product();
            
            prod.setName(name);
            prod.setPrice(price);
            prod.setDescription( description );
            prod.setImageUrl(imgPath);
            prod.setCategoryName(CategoryName);
            
            ProductDAO pdao = new ProductDAOImpl();
            pdao.insert(prod);
            
            response.sendRedirect("Viewproduct.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
