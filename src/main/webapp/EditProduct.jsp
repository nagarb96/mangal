<%-- 
    Document   : AddProduct
    Created on : Feb 1, 2019, 2:30:00 PM
    Author     : MRuser
--%>

<%@page import="com.mycompany.ecommproj.impl.CategoryDAOImpl"%>
<%@page import="com.mycompany.ecommproj.model.Product"%>
<%@page import="com.mycompany.ecommproj.impl.ProductDAOImpl"%>
<%@page import="com.mycompany.ecommproj.dao.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        
        <c:import url="Bootstrap link.jsp"></c:import>
        
<%

    int id = Integer.parseInt(request.getParameter("id"));
    
    ProductDAO pdao = new ProductDAOImpl();
    
    Product p = pdao.getProduct(id);
    
    request.setAttribute("currCat", p);
    
%>
<%
    request.setAttribute("catList", new CategoryDAOImpl().getCategory());
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
        <h1>Edit Product</h1>
        
        <form action="EditProductToDB" method="post" enctype="multipart/form-data">
            
            
            <input type="hidden" value="${currCat.getId()}" name="id">
            <c:if test="${not empty currCat}"></c:if>
            
            <input placeholder="Enter Product Name" class="form-control" name="name" 
            <c:if test="${not empty currCat}">value="${currCat.getName()}"</c:if>
            >
            
            <input placeholder="Enter Price" class="form-control" name="price" 
            <c:if test="${not empty currCat}">value="${currCat.getPrice()}"</c:if>
            >
            
            <textarea placeholder="Enter Product Description" class="form-control" name="description"
            ><c:if test="${not empty currCat}">${currCat.getDescription()}</c:if></textarea>
            
            <select class="form-control" name="CategoryName">
                    <c:forEach items="${catList}" var="x">
                        <option value="${x.getName()}" title="${x.getDescription()}">${x.getName()}</option>
                    </c:forEach>
                    
                </select>
            
            <h3>Choose Product Image</h3>
            <input type="file" name="image" class="form-control"
            <c:if test="${not empty currCat}">value="${currCat.getImageUrl()}"</c:if>
            >
            <br>
            <br>
            <button class="btn btn-warning" type="submit">Update</button>
            
        </form>
    
    </body>
</html>
