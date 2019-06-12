<%@page import="com.mycompany.ecommproj.impl.CartDAOImpl"%>
<%@page import="com.mycompany.ecommproj.dao.CartDAO"%>
<%@page import="com.mycompany.ecommproj.impl.ProductDAOImpl"%>
<%@page import="com.mycompany.ecommproj.dao.ProductDAO"%>
<%@page import="com.mycompany.ecommproj.dao.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    ProductDAO cdao = new ProductDAOImpl();

    
    request.setAttribute("currentProduct", cdao.getProduct( Integer.parseInt(request.getParameter("id"))  ));
    request.setAttribute("list", cdao.getProduct());

        %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel = "icon" href ="https://res.cloudinary.com/foodproject/image/upload/v1556708011/Logo/food_hub.png"> 
        <link href="FoodHub.css" rel="Stylesheet">
        <c:import url="Bootstrap link.jsp"></c:import>
    </head>
    <body>
        
        <c:import url="Navbar.jsp"></c:import>

        <div>
            
            <c:choose>

            <c:when test="${not empty list}">

                <form method="post" action="AddToCart">
                
                    
                    
                    
                    <input type="hidden" name="productid" value="${currentProduct.getId()}">
                    <input type="hidden" name="userid" value="${sessionScope.currUser.getEmail()}">
                    <table class="table table-striped">

                    <thead>
                        <tr>
                            <td style="font-weight: bold;">Product Image</td>
                            <td style="font-weight: bold;">Product Name</td>
                            <td style="font-weight: bold;">Quantity</td>
                            <td style="font-weight: bold;">Price</td>
                        </tr>
                    </thead>
                         <tr>
        
            <td><img src="${currentProduct.getImageUrl()}" class="img img-thumbnail" Style="width:20%; height:50%;" ></td>
            <td>${currentProduct.getName()}</td>
            <td><div class="form-group">
                    <select class="form-control" name="qty">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>                        
                    </select>
                </div>
            </td>
            <td>${currentProduct.getPrice()}</td>
        
        </tr>

    </table>
        <div style="text-align: center; padding-bottom: 10px;">
            <c:if test="${not empty sessionScope.currUser}">
            <button type="submit" class="btn btn-primary">Add</button>
            </c:if>
                    
            <c:if test="${empty sessionScope.currUser}">
            <button class="btn btn-danger"><a href="FoodHub.jsp" style="text-decoration: none; color: white;">Login To Buy</a></button>
            </c:if>
        </div>
            </c:when>
        
            <c:otherwise>
                <h1 class="alert alert-danger">No Products in System</h1>
            </c:otherwise>

        </c:choose>  
    </form>
            
        </div>
        
    <c:import url="Footer.jsp"></c:import>
    </body>
</html>
