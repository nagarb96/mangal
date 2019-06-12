<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mycompany.ecommproj.impl.UserDAOImpl"%>
<%@page import="com.mycompany.ecommproj.dao.UserDAO"%>
<%
    UserDAO udao = new UserDAOImpl();
    request.setAttribute("list",null);
    request.setAttribute("list",udao.getUser());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View User</title>
        <c:import url="Bootstrap link.jsp"></c:import>

        <style>
            
        </style>
    </head>
    <body>
        
        <center><div style="margin-top: 30px;">
        <a href="user.jsp" style=" text-decoration: none; color: skyblue; border-radius: 5px;border: 1px solid black; background-color: transparent; padding: 10px;">Add User</a>
        </div</center>
        
        <table class="table " style="margin-top: 30px;">
            <thead>
                <tr>
                    <th>Email</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Active</th>
                    <th>Edit</th>
                    <th>Delete</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="user">
                <tr>
                    <td>${user.getEmail()}</td>
                    <td>${user.getUsername()}</td>
                    <td>${user.getPassword()}</td>
                    <td>${user.getPhone()}</td>
                    <td>${user.getRole()}</td>
                    <td>
                        ${user.isActive()}
                        <a href="InvertActive?email=${user.getEmail()}" class="btn btn-link">Invert</a>
                    </td>
                    
                    <td> <a href="EditUser.jsp?email=${user.getEmail()}" class="btn btn-success">Edit</a> </td>                
                    <td> <a href="DeleteUserFromDB?email=${user.getEmail()}" class="btn btn-danger">Delete</a> </td>                
                            
                </tr>
                </c:forEach>
            </tbody>
        </table>
        
    
    </body>
</html>
