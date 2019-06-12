<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="Bootstrap link.jsp"></c:import>
    </head>
<body>
    <nav class="navbar navbar-inverse" style="border-radius: 0px;">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>                        
                </button>
                <a class="navbar-brand" href="FoodHub.jsp" style="color:white;">FoodHub</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar" >
                <ul class="nav navbar-nav">
                    <li><a href="FoodHub.jsp">Home</a></li>
                    <li><a href="Menu.jsp">Menu</a></li>
                    <li><a href="Contactus.jsp" style="">Contact Us</a></li>
                    <li><a href="Aboutus.jsp">About Us</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${not empty sessionScope.currUser}">
                        <li><a href="#" class="btn btn-link" >Welcome,  ${sessionScope.currUser.getUsername()}</a></li>
                        <li><a href="ViewCartItems.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
                        <li><a href="Logout"  class="btn btn-link"><span class="glyphicon glyphicon-off" style="color: red;"></span></a></li>                        
                    </c:when>
                    <c:otherwise>
                        <li><a href="#" class="btn btn-link" data-toggle="modal" data-target="#myModals"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li><a href="#"  class="btn btn-link" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span> Login</a></li>
                    </c:otherwise>
                </c:choose>
                </ul>

                <div class="container">
                <div class="row">
                <div class="col-md-12">
                <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-lg">
                <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" style="text-align: center;">LogIn</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="LoginUser">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">Email:</label>
                <div class="col-sm-10">
                    <input type="email" name="email" class="form-control" id="email" placeholder="Enter email">
                </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                <div class="col-sm-10"> 
                    <input type="password" name="password" class="form-control" id="pwd" placeholder="Enter password">
                </div>
                </div>
                <div class="form-group"> 
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-success">Submit</button>
                </div>
                </div>
                    <c:if test="${param.error == 'InvalidCredentials'}">
                        <h3 style="text-align: center;" class="text text-danger">Invalid Credentials</h3>
                        <script>
                            $("#myModal").modal("show");
                        </script>
                    </c:if>
                 </form>
                </div>
                </div>
                </div>
                </div>
                        
                <div class="container">
                <div class="row">
                <div class="col-md-12">
                <div class="modal fade" id="myModals" role="dialog">
                <div class="modal-dialog modal-lg">
                <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: center;">Sign Up</h4>
                </div>
                
                <div class="modal-body">
                <form class="form-horizontal" action="AddusertoDB" method="post">
                <div class="form-group">
                <label class="control-label col-sm-2" for="email">Email:</label>
                <div class="col-sm-10">
                <input type="email" class="form-control" id="email" name="catemail" placeholder="Enter email">
                </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-sm-2" for="username">Username:</label>
                <div class="col-sm-10"> 
                    <input type="text" class="form-control" name="catusername" id="pwd" placeholder="Enter Username">
                </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-sm-2" for="password">Password:</label>
                <div class="col-sm-10"> 
                    <input type="text" class="form-control" name="catpassword" id="pwd" placeholder="Enter password">
                </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-sm-2" for="contact">Contact:</label>
                <div class="col-sm-10"> 
                    <input type="text" class="form-control" name="catphone" id="pwd" placeholder="Enter Contact Number">
                </div>
                </div>

                <div class="form-group"> 
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-success">Submit</button>
                </div>
                </div>
                </form>
                </div>
                </div>
                </div>
                </div>
                </div>
                </div>
                </div>
                </div>
                </div>
                </div>
            </div>
            </div>
        </nav>

</body>
</html>
