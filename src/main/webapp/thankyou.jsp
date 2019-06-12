<%-- 
    Document   : thankyou
    Created on : Jun 7, 2019, 7:00:02 PM
    Author     : cpmin
--%>

<%@page import="com.mycompany.ecommproj.model.User"%>
<%@page import="com.mycompany.ecommproj.impl.CartDAOImpl"%>
<%@page import="com.mycompany.ecommproj.dao.CartDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    CartDAO cdao = new CartDAOImpl();
    cdao.delete( ((User)request.getSession().getAttribute("currUser")).getEmail() );
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thank You</title>
        <c:import url="Bootstrap link.jsp"></c:import>
    </head>
    <body>
    <c:import url="Navbar.jsp"></c:import>
        <div class="container-fluid">
            <div class="col-md-12" >
                <h1 style="font-family: 'Indie Flower', cursive; text-align: center;">Thank you</h1>
        </div>
        </div>
    </body>
</html>
