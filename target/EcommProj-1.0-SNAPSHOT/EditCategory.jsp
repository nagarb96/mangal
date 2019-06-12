<%-- 
    Document   : AddCategory
    Created on : Feb 1, 2019, 2:30:00 PM
    Author     : MRuser
--%>

<%@page import="com.mycompany.ecommproj.model.Category"%>
<%@page import="com.mycompany.ecommproj.impl.CategoryDAOImpl"%>
<%@page import="com.mycompany.ecommproj.dao.CategoryDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category</title>
        
        <c:import url="Bootstrap link.jsp"></c:import>
        
<%

    int id = Integer.parseInt(request.getParameter("id"));
    
    CategoryDAO cdao = new CategoryDAOImpl();
    
    Category c = cdao.getCategory(id);
    
    request.setAttribute("currCat", c);
    
%>
        
        <style>
            
            body *{
                margin-top: 20px;
            }
            
            textarea{
                resize: none;
            }
            
        </style>
    </head>
    <body style="text-align: center; width: 80%; margin: auto;">
        <h1>Edit Category</h1>
        
        <form action="EditCategoryToDB" method="post">
            
            <c:if test="${not empty currCat}">
                <input type="hidden" value="${currCat.getId()}" name="id">
            </c:if>
            
            <input placeholder="Enter Category Name" class="form-control" name="catname" 
                   <c:if test="${not empty currCat}">value="${currCat.getName()}"</c:if>
            >
            
            <textarea placeholder="Enter Category Description" class="form-control" name="catdesc"
            ><c:if test="${not empty currCat}">${currCat.getDescription()}</c:if></textarea>
            
            <button class="btn btn-warning" type="submit">Update</button>
            
        </form>
    </body>
</html>
