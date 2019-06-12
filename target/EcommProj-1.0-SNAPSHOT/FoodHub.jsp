<%@page import="com.mycompany.ecommproj.impl.ProductDAOImpl"%>
<%@page import="com.mycompany.ecommproj.dao.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>FoodHub</title>
    <link rel = "icon" href ="https://res.cloudinary.com/foodproject/image/upload/v1556708011/Logo/food_hub.png"> 
    <link href="FoodHub.css">
    <style>
        *{font-family: 'Montserrat', sans-serif;
}
    </style>
    <c:import url="Bootstrap link.jsp"></c:import>
    <script>
    function myMap() {
    var mapOptions = {
    center: new google.maps.LatLng(28.537517, 77.298226),
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.HYBRID
    };
    var map = new google.maps.Map(document.getElementById("map"), mapOptions);
    }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArid3bSw4Rfqsozqi-xVUN_GZkbjMu3Ow&callback=myMap" async defer></script>
</head>
<body>
<c:import url="Navbar.jsp"></c:import>
            
<div class="container-fluid" id="asd">
<div id="myCarousel" class="carousel slide" data-ride="carousel">

<ol class="carousel-indicators">
<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
<li data-target="#myCarousel" data-slide-to="1"></li>
<li data-target="#myCarousel" data-slide-to="2"></li>
</ol>

<div class="carousel-inner">
<div class="item active">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093035/Images/pexels-photo-376464.jpg" alt="food" style="width:100%;">
<div class="carousel-caption">
</div>
</div>

<div class="item">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093035/Images/pexels-photo-461198.jpg" alt="food" style="width:100%;">
<div class="carousel-caption"> 
</div>
</div>

<div class="item">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093039/Images/salmon-dish-food-meal-46239.jpg" alt="food" style="width:100%;">
<div class="carousel-caption">
</div>
</div>
</div>

<a class="left carousel-control" href="#myCarousel" data-slide="prev">
<span class="glyphicon glyphicon-chevron-left"></span>
<span class="sr-only">Previous</span>
</a>

<a class="right carousel-control" href="#myCarousel" data-slide="next">
<span class="glyphicon glyphicon-chevron-right"></span>
<span class="sr-only">Next</span>
</a>
</div>
</div>

<div class="container">
<div class="row">
<div class="col-md-12">
<h1 style="text-align: center; font-family: cursive;">Our Services</h1>
</div>
</div>
</div>

<div class="container">
<div class="row">
<div class="col-md-3">
<div class="thumbnail">
<a href="Menu.jsp" target="_parent">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093033/Images/menu-card_1.png" alt="pics">
<div class="caption">
<p>VIEW OUR MENU</p>
</div>
</a>
</div>
</div>

<div class="col-md-3">
<div class="thumbnail">
<a href="#" target="_parent">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093033/Images/meeting.png" alt="pics">
<div class="caption">
<p>RESERVATION</p>
</div>
</a>
</div>
</div>

<div class="col-md-3">
<div class="thumbnail">
<a href="#" target="_parent">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093031/Images/dinner.png" alt="Nature">
<div class="caption">
<p>FINE RECIPES</p>
</div>
</a>
</div>
</div>

<div class="col-md-3">
<div class="thumbnail">
<a href="#" target="_parent">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093035/Images/salt.png" alt="Fjords">
<div class="caption">
<p>SPICY RECIPES</p>
</div>
</a>
</div>
</div>
</div>
</div>

<div class="container">
<div class="row">
<div class="col-md-12">
<h1 style="text-align: center; font-family: cursive;">Image Gallery</h1>
</div>
</div>
</div>
    
<div class="container" style="text-align: center;">
<div class="row">
<div class="col-md-7">
        
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093032/Images/Image_gallery_1.jpg" alt="img" class="zoom">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093031/Images/Image_gallery_2.jpg" alt="img" class="zoom">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093031/Images/Image_gallery_3.jpg" alt="img" class="zoom">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093031/Images/Image_gallery_4.jpg" alt="img" class="zoom">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093031/Images/Image_gallery_5.jpg" alt="img" class="zoom">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093032/Images/Image_gallery_6.jpg" alt="img" class="zoom">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093033/Images/Image_gallery_7.jpg" alt="img" class="zoom">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093032/Images/Image_gallery_8.jpg" alt="img" class="zoom">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093033/Images/Image_gallery_9.jpg" alt="img" class="zoom">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093032/Images/Image_gallery_10.jpg" alt="img" class="zoom">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093033/Images/Image_gallery_11.jpg" alt="img" class="zoom">
<img src="https://res.cloudinary.com/foodproject/image/upload/v1521093032/Images/Image_gallery_12.jpg" alt="img" class="zoom">

</div>

<div class="col-md-5">
    <p style="font-family: cursive; font-size:18px; text-align: justify">FoodProject is a food ordering and delivery company based out of Delhi, India. FoodProject was inspired by the thought of providing a complete food ordering and delivery solution from the best neighbourhood restaurants to the urban foodie. A single window for ordering from a wide range of restaurants, we have our own exclusive fleet of delivery personnel to pickup orders from restaurants and deliver it to customers . Having our own fleet gives us the flexibility to offer customers a no minimum order policy on any restaurant and accept online payments for all partner restaurants that we work with. Our delivery personnel carry one order at a time which ensures we get reliable and fast deliveries.</p>
</div>
</div>
</div>

<br><br><br>

<h1 style="text-align: center; font-family: cursive;">Our Chef</h1>
    
<div class="container-fluid" id="asd12" style="text-align: center;">
<div class="row">
<div class="col-md-4">
    <img src="https://res.cloudinary.com/foodproject/image/upload/v1521093030/Images/chef2.jpg" class="col-md-12" alt="chef" width="350" height="400" style="border-radius: 10px;">
<div class="caption" >
    <a href="#"><img src="https://res.cloudinary.com/foodproject/image/upload/v1521093031/Images/facebook.png" alt="fb" id="asd3"></a>
    <a href="#"><img src="https://res.cloudinary.com/foodproject/image/upload/v1521093032/Images/instagram.png" alt="insta" id="asd4"></a>
    <a href="#"><img src="https://res.cloudinary.com/foodproject/image/upload/v1521093036/Images/twitter.png" alt="twitter" id="asd5"></a>
</div>

<div class="caption">
    <h3>Johnson</h3>
</div>
</div>
<div class="col-md-4">
    <img src="https://res.cloudinary.com/foodproject/image/upload/v1521093031/Images/chef.jpg" class="col-md-12" alt="chef" width="350" height="400" style="border-radius: 10px;">
<div class="caption">
    <a href="#"><img src="https://res.cloudinary.com/foodproject/image/upload/v1521093031/Images/facebook.png" alt="fb"  id="asd6"></a>
    <a href="#"><img src="https://res.cloudinary.com/foodproject/image/upload/v1521093032/Images/instagram.png" alt="insta"  id="asd7"></a>
    <a href="#"><img src="https://res.cloudinary.com/foodproject/image/upload/v1521093036/Images/twitter.png" alt="twitter"  id="asd8"></a>
</div>

<div class="caption">
    <h3>Enrique</h3>
</div>
</div>
<div class="col-md-4">
    <img src="https://res.cloudinary.com/foodproject/image/upload/v1521093029/Images/chef1.jpg" class="col-md-12" alt="chef" width="350" height="400" style="border-radius: 10px;">
<div class="caption">
    <a href="#"><img src="https://res.cloudinary.com/foodproject/image/upload/v1521093031/Images/facebook.png" alt="fb"  id="asd9"></a>
    <a href="#"><img src="https://res.cloudinary.com/foodproject/image/upload/v1521093032/Images/instagram.png" alt="insta" id="asd10"></a>
    <a href="#"><img src="https://res.cloudinary.com/foodproject/image/upload/v1521093036/Images/twitter.png" alt="twitter" id="asd11"></a>
</div>
<div class="caption">
    <h3>Forkner</h3>
</div>
</div>
</div>
</div>

<div class="container-fluid" id="asd">
<div class="row">
<div class="col-md-12">
<div id="map" style="width:100%;height:400px;background:yellow"></div>
</div>
</div>
</div>
<br>

<c:import url="Footer.jsp"></c:import>

</body>
</html>
