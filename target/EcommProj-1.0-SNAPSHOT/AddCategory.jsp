<%-- 
    Document   : AddCategory
    Created on : Feb 1, 2019, 2:30:00 PM
    Author     : MRuser
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
        <link href="FoodHub.css" rel="Stylesheet">

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
        <h1>Add Category</h1>
        
        <form action="AddCategoryToDB" method="post">
            
            <input placeholder="Enter Category Name" class="form-control" name="catname">
            
            <textarea placeholder="Enter Category Description" class="form-control" name="catdesc"></textarea>
            
            <button class="btn btn-primary" type="submit">Add</button>
            
        </form>
    </body>
</html>
