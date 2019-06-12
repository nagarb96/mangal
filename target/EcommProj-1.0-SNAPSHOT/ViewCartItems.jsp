<%-- 
    Document   : ViewCartItems
    Created on : May 31, 2019, 4:40:23 PM
    Author     : cpmin
--%>

<%@page import="com.mycompany.ecommproj.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mycompany.ecommproj.impl.CartDAOImpl"%>
<%@page import="com.mycompany.ecommproj.dao.CartDAO"%>
<%@page import="com.mycompany.ecommproj.dao.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CartDAO cdao = new CartDAOImpl();
    
    request.setAttribute("list", cdao.getCart(((User)request.getSession().getAttribute("currUser")).getEmail()));

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel = "icon" href ="https://res.cloudinary.com/foodproject/image/upload/v1556708011/Logo/food_hub.png"> 
        <link href="FoodHub.css" rel="Stylesheet">
        <style>
            td {text-align: left;}
        </style>
        <c:import url="Bootstrap link.jsp"></c:import>
        
    </head>
    <body>
        
    <c:import url="Navbar.jsp"></c:import>
    <div style="text-align: center; width: 80%; margin: auto;">
        <h1>Cart</h1>
        <c:choose>

            <c:when test="${not empty list}">

                <table class="table table-striped" >
            <thead>
            <tr>
                <th  style="font-weight: bold;">Product Id</th>
                <th  style="font-weight: bold;">Image</th>
                <th  style="font-weight: bold;">Product Name</th>
                <th  style="font-weight: bold;">Quantity</th>
                <th  style="font-weight: bold;">Price</th>
                <th  style="font-weight: bold;">Sub Total</th>
            
            </tr>
            </thead>
            
            <c:set var="grandTotal" value="0"></c:set>
                                    
            <c:forEach var="x" items="${list}">

            <tr>
                <td>${x.getProduct().getId()}</td>
                <td><img src="${x.getProduct().getImageUrl()}" class="img img-thumbnail" style="width:10%; height:10%;"></td>
                <td>${x.getProduct().getName()}</td>
                <td>${x.getQty()}</td>
                <td>${x.getProduct().getPrice()}</td>
                <td>${x.getQty() * x.getProduct().getPrice()}</td>
                
                <c:set var="grandTotal" value="${grandTotal + x.getQty() * x.getProduct().getPrice()}"></c:set>
                
                <td><a href="DeleteCartFromDB?id=${x.getId()}" class="btn btn-danger">Delete</a> </td>                
            
            </tr>

            </c:forEach>

        </table>

            </c:when>
            
            <c:otherwise>
                <h1 class="alert alert-danger" >No Products in System</h1>
            </c:otherwise>

        </c:choose>
    </div>
            <h1 style="text-align: right; width: 80%">Grand Total: <c:out value="${grandTotal}"></c:out></h1>
    <div class="col-md-12" style="text-align: center;">
    <a href="thankyou.jsp" class="btn btn-primary">Confirm</a>
    </div>
    </body>
</html>
