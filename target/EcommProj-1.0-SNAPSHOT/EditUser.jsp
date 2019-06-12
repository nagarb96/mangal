
<%@page import="com.mycompany.ecommproj.model.User"%>
<%@page import="com.mycompany.ecommproj.impl.UserDAOImpl"%>
<%@page import="com.mycompany.ecommproj.dao.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
        
        <c:import url="Bootstrap link.jsp"></c:import>
        
<%

    String email = (request.getParameter("email"));
    
    UserDAO udao = new UserDAOImpl();
    
    User u = udao.getUser(email);
    
    request.setAttribute("currCat", u);
    
%>
    </head>
    <body>
        
        
<div class="container">
    <h2 style="text-align: center;">Edit user ${empty currCat}</h2>

  <form  action="EditUserToDB" method="post" >
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="catemail"
             <c:if test="${not empty currCat}">value="${currCat.getEmail()}"</c:if>
             >
    </div>
    <div class="form-group">
      <label for="pwd">Username:</label>
      <input type="text" class="form-control" id="pwd" placeholder="Enter Username" name="catusername"
             
      <c:if test="${not empty currCat}">value="${currCat.getUsername()}"</c:if>
            >

    </div>
    <div class="form-group">
      <label for="phone">Password:</label>
      <input type="text" class="form-control" id="pwd" placeholder="Enter password" name="catpassword"
             
      <c:if test="${not empty currCat}">value="${currCat.getPassword()}"</c:if>
          >

    </div>
      <div class="form-group">
      <label for="phone">Phone:</label>
      <input type="text" class="form-control" id="pwd" placeholder="Enter phone" name="catphone"
      <c:if test="${not empty currCat}">value="${currCat.getPhone()}"</c:if>
          >
          
      </div>
          <div style="text-align: center;">
              <button type="submit" class="btn btn-warning">Update</button></div>
  </form>
        <%--

        <h1>Edit User</h1>
        
        <form action="EditUserToDB" method="post">
            
            <c:if test="${not empty currCat}">
                <input type="hidden" value="${currCat.getEmail()}" name="catemail">
            </c:if>
            
            
            
            <textarea placeholder="Enter User Username" class="form-control" name="catusername"
            ><c:if test="${not empty currCat}">${currCat.getUsername()}</c:if></textarea>
            
            <textarea placeholder="Enter User Password" class="form-control" name="catusername"
            ><c:if test="${not empty currCat}">${currCat.getUsername()}</c:if></textarea>
            
            <input placeholder="Enter User Phone" class="form-control" name="catphone" 
                   <c:if test="${not empty currCat}">value="${currCat.getPhone()}"</c:if>
            >
            
            <button class="btn btn-warning" type="submit">Update</button>
            
        </form>
        --%>
</div>
    </body>
</html>
