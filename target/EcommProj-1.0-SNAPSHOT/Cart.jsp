<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mycompany.ecommproj.impl.CartDAOImpl"%>
<%@page import="com.mycompany.ecommproj.dao.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    CartDAO cdao = new CartDAOImpl();

    request.setAttribute("list", cdao.getCart());

        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <c:import url="Bootstrap link.jsp"></c:import>
    </head>
        <body style="text-align: center; width: 80%; margin: auto;">
            <h1>Viewing Products</h1>
            
            <h1> <a href="AddProduct.jsp" class="btn btn-link">Add Product</a></h1>

<!--         <h1>${list}</h1>-->

    
        <c:choose>
            <c:when test="${not empty list}">

                <table class="table table-striped">

                    <thead>
                        <tr>
                            <td style="font-weight: bold;">Id</td>
                            <td style="font-weight: bold;">Name</td>
                            <td style="font-weight: bold;">Price</td>
                            <td style="font-weight: bold;">Category Name</td>
                            <td style="font-weight: bold;">Description</td>
                            <td style="font-weight: bold;">Imagepath</td>
                            
                        </tr>
                    </thead>

                    

                        <c:forEach var="x" items="${list}">

                            <tr>
                                <td>${x.getId()}</td>
                                <td>${x.getPid()}</td>
                                <td>${x.getQty()}</td>
                                <td>${x.getUserId()}</td>
                                <td> <a href="EditProduct.jsp?id=${x.getId()}" class="btn btn-success">Edit</a> </td>                
                                <td> <a href="DeleteProductFromDB?id=${x.getId()}" class="btn btn-danger">Delete</a> </td>                
                        
                            </tr>

                        </c:forEach>

                    

                </table>

            </c:when>
            
            <c:otherwise>
                <h1 class="alert alert-danger">No Products in System</h1>
            </c:otherwise>

        </c:choose>

        

    </body>
</html>
