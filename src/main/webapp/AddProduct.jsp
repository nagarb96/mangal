<%-- 
    Document   : AddCategory
    Created on : Feb 1, 2019, 2:30:00 PM
    Author     : MRuser
--%>

<%@page import="com.mycompany.ecommproj.impl.CategoryDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setAttribute("catList", new CategoryDAOImpl().getCategory());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        
        <c:import url="Bootstrap link.jsp"></c:import>
        
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
        <h1>Add Product</h1>
        
        
        <form action="AddProductToDB" method="post" enctype="multipart/form-data">
            
            <input placeholder="Enter Product Name" class="form-control" name="name" required="">
            
            <input placeholder="Enter Product Price" class="form-control" name="price" required="">
            
            <textarea placeholder="Enter Product Description" class="form-control" name="description" required=""></textarea>
            
            <c:if test="${not empty catList}">
            
                <select class="form-control" name="CategoryName">
                    <c:forEach items="${catList}" var="x">
                        <option value="${x.getName()}" title="${x.getDescription()}">${x.getName()}</option>
                    </c:forEach>
                    
                </select>
                
            </c:if>
            
            <h3>Choose Product Image</h3>
            <input type="file" name="image" class="form-control" multiple="multiple" required="">
            
            <button class="btn btn-primary" type="submit">Add</button>
            
        </form>
    </body>
</html>
