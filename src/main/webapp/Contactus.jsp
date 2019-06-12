<%-- 
    Document   : Contactus
    Created on : Apr 24, 2019, 4:10:55 PM
    Author     : cpmin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <link rel = "icon" href ="https://res.cloudinary.com/foodproject/image/upload/v1556708011/Logo/food_hub.png">
        <link href="FoodHub.css" rel="Stylesheet">
        <style>
            *{font-family: 'Montserrat', sans-serif;
}
        .navbar{
            border-radius: 0px;
        }
        #asd{
            padding: 0px;
            margin-top: -20px;
        }
        #asd1{
            padding-bottom: 35px;
        }
    </style>

    </head>
    <body>
        <c:import url="Navbar.jsp"></c:import>
        
        <div class="container-fluid" id="asd">
  <div class="row">
    <div class="col-md-12">
      <img src="https://res.cloudinary.com/foodproject/image/upload/v1521093030/Images/contact_1.jpg" width="100%">        
      </div>
    </div>
</div>

        <div class="container-fluid" style="background-image: url(https://res.cloudinary.com/foodproject/image/upload/v1521093047/Images/paper.jpg)" id="asd1">
  <div class="row">
      <div class="col-md-12">
      <h1 style="text-align: center;">Contact Us</h1>
      </div>
    <div class="col-md-8">
      <form>
        <h5>First Name:</h5>
          <input type="text" palcaeholder="type name" style="width:100%; height: 30px;">
          <h5>last Name:</h5>
          <input type="text" palcaeholder="type name" style="width:100%; height: 30px;">
          <h5>Email Id:</h5>
          <input type="email" palcaeholder="type name" style="width:100%; height: 30px;">
          <h5>Contact No.</h5>
          <input type="email" palcaeholder="type name" style="width:100%; height: 30px;">
        </form>
        <form>
          <h5>Country</h5>
    <form action="/action_page.php">
  <select name="Country" style="width:100%; height: 30px;">
    <option value="India">India</option>
    <option value="Meethapur Village">Meethapur Village</option>
    <option value="Madanpur Village">Madanpur Village</option>
    <option value="Dubai">Dubai</option>
  </select>
    </form><br>
    <input type="button" value="Submit" style="background-color:limegreen; color: white; width: 100%; border-radius: 2px; border: 1px solid limegreen" >
    </form> 

      </div>
      <div class="col-md-4">
      <img src="https://res.cloudinary.com/foodproject/image/upload/v1521093031/Images/contact-us2.jpg" alt="contact" style="width: 100%; height: 300px;">
      </div>
    </div>
</div>

        <c:import url="Footer.jsp"></c:import>
    </body>
</html>
