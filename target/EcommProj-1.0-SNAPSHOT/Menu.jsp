<%@page import="java.util.HashMap"%>
<%@page import="com.mycompany.ecommproj.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.ecommproj.impl.ProductDAOImpl"%>
<%@page import="com.mycompany.ecommproj.dao.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ProductDAO pdao = new ProductDAOImpl();
    
    String catName = request.getParameter("catName");
    
    System.out.println(catName == null);
    
    if( catName == null ){
        request.setAttribute("productList", pdao.getProduct());
        request.setAttribute("productMap",  pdao.getProductMap(pdao.getProduct()) );
    }
    else{
        request.setAttribute("productList", pdao.getProduct(catName));
     
        System.out.println("PRODUCTS UNDER: " + catName);
        System.out.println(pdao.getProduct(catName));
        
        Map<String, List<Product>> map = pdao.getProductMap(pdao.getProduct());
        Map<String, List<Product>> map1 = new HashMap();
        
        map1.put(catName, map.get(catName));
        
        System.out.println("MAP UNDER: " + catName);
        System.out.println(map1);
        
        request.setAttribute("productMap",  map1 );
    }
        

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link rel = "icon" href ="https://res.cloudinary.com/foodproject/image/upload/v1556708011/Logo/food_hub.png"> 
        <link href="FoodHub.css" rel="Stylesheet">

        <c:import url="Bootstrap link.jsp"></c:import>
        <style>
            
            * {box-sizing: border-box;font-family: 'Montserrat', sans-serif;
}
            .tab {
                float: left;
                background-color: #FFC300;
                width: 30%;
                height: complex;
                }
            .tab button {
                display: inline-block;
                float: right;
                background-color: inherit;
                color: #000;
                padding: 18px 12px;
                width: 100%;
                border: none;
                outline: none;
                text-align: left;
                cursor: pointer;
                transition: 0.3s;
                font-size: 16px;
                }
            
            .tabcontent {
                margin-left:30% ;
                padding: 0px 12px;
                border: 1px solid #ccc;
                width: 70%;
                border-left: none;
                height: auto;
            }
            .sidetabbar {
                list-style-type: none;
                padding: 20px;
            }
            .sidetabbar li,a{
                padding: 8px 16px;
                font-size: 20px;
            }
            .sidetabbar li:hover{
               background-color: #FFCB1E;
            }

            

        </style>
    </head>
    <body>
    <c:import url="Navbar.jsp"></c:import>
    
    <div class="layout">
       <div class="tab">
            <img src="https://res.cloudinary.com/foodproject/image/upload/v1523024637/Logo/logo.png" style="padding: auto;">
            <input type="search" placeholder="Search items...." class="form-control">
<!--        <button class="tablinks" onclick="openCity(event, 'Popular')" id="defaultOpen">Popular</button>
            <button class="tablinks" onclick="openCity(event, 'Meals')">Meals</button>
            <button class="tablinks" onclick="openCity(event, 'Beverages')">Beverages</button>
            <button class="tablinks" onclick="openCity(event, 'Desserts')">Desserts</button>
-->         
        <ul class="sidetabbar">
            <li><a href="?catName=Popular" style="text-decoration: none;color: black;">Popular</a></li>
            <li><a href="?catName=Meals" style="text-decoration: none;color: black;">Meals</a></li>
            <li><a href="?catName=Beverages" style="text-decoration: none;color: black;">Beverages</a></li>
            <li><a href="?catName=Desserts" style="text-decoration: none;color: black;">Desserts</a></li>
        </ul>
        </div>
        <c:if test="${empty param.catName or param.catName == 'Popular'}">
        <div id="Popular" class="tabcontent">
            <h3 style="text-align: center;font-family: cursive; color: red;">Popular</h3>
            <hr/>
        <div class="d-flex flex-reverse">
        <div class="p-2" style="margin: 20px; ">
        <c:forEach items="${productMap}" var="keyValuePair">
        <c:if test="${not empty keyValuePair.value}">
        <c:forEach items="${keyValuePair.value}" var="product">
        <div style="display: inline-block;
                        word-wrap: break-word;
                        border: 0px solid;
                        width: 250px;
                        margin: 10px;
                        padding: 10px;
                        text-align:center;">
            <img class="img img-thumbnail" src="${product.getImageUrl()}" style="margin: auto; object-fit: cover;">
            <p title="${product.getDescription()}">${product.getName()}</p>
            <h4>${product.getPrice()}</h4>
            <a class="btn btn-success" href="ViewSingleProduct.jsp?id=${product.getId()}">Buy</a>
        </div>
        </c:forEach>
        </c:if>
        </c:forEach>
        </div>
        </div>
        </div>
    </c:if>
        <c:if test="${empty param.catName or param.catName == 'Meals'}">
        <div id="Meals" class="tabcontent">
            <h3 style="text-align: center;font-family: cursive; color: red;">Meals</h3>
            <hr/>
        <div class="d-flex flex-reverse">
        <div class="p-2" style="margin: 20px; ">
        <c:forEach items="${productMap}" var="keyValuePair">
        <c:if test="${not empty keyValuePair.value}">
        <c:forEach items="${keyValuePair.value}" var="product">
        <div style="display: inline-block;
                        word-wrap: break-word;
                        border: 0px solid;
                        width: 250px;
                        margin: 10px;
                        padding: 10px;
                        text-align:center;">
            <img class="img img-thumbnail" src="${product.getImageUrl()}" style="margin: auto; object-fit: cover;">
            <p title="${product.getDescription()}">${product.getName()}</p>
            <h4>${product.getPrice()}</h4>
            <a class="btn btn-success" href="ViewSingleProduct.jsp?id=${product.getId()}">Buy</a>
        </div>
        </c:forEach>
        </c:if>
        </c:forEach>
        </div>
        </div>
        </div>
        </c:if>
        
        <c:if test="${empty param.catName or param.catName == 'Beverages'}">
        <div id="Beverages" class="tabcontent">
            <h3 style="text-align: center;font-family: cursive; color: red;">Beverages</h3>
            <hr/>
        <div class="d-flex flex-reverse">
        <div class="p-2" style="margin: 20px; ">
        <c:forEach items="${productMap}" var="keyValuePair">
        <c:if test="${not empty keyValuePair.value}">
        <c:forEach items="${keyValuePair.value}" var="product">
        <div style="display: inline-block;
                        word-wrap: break-word;
                        border: 0px solid;
                        width: 250px;
                        margin: 10px;
                        padding: 10px;
                        text-align:center;">
            <img class="img img-thumbnail" src="${product.getImageUrl()}" style="margin: auto; object-fit: cover;">
            <p title="${product.getDescription()}">${product.getName()}</p>
            <h4>${product.getPrice()}</h4>
            <a class="btn btn-success" href="ViewSingleProduct.jsp?id=${product.getId()}">Buy</a>
        </div>
        </c:forEach>
        </c:if>
        </c:forEach>
        </div>
        </div>
        </div>
    </c:if>
    <c:if test="${empty param.catName or param.catName == 'Desserts'}">
        
        <div id="Desserts" class="tabcontent">
            <h3 style="text-align: center;font-family: cursive; color: red;">Desserts</h3>
            <hr/>
        <div class="d-flex flex-reverse">
        <div class="p-2" style="margin: 20px; ">
        <c:forEach items="${productMap}" var="keyValuePair">
        <c:if test="${not empty keyValuePair.value}">
        <c:forEach items="${keyValuePair.value}" var="product">
        <div style="display: inline-block;
                        word-wrap: break-word;
                        border: 0px solid;
                        width: 250px;
                        margin: 10px;
                        padding: 10px;
                        text-align:center;">
            <img class="img img-thumbnail" src="${product.getImageUrl()}" style="margin: auto; object-fit: cover;">
            <p title="${product.getDescription()}">${product.getName()}</p>
            <h4>${product.getPrice()}</h4>
            <a class="btn btn-success" href="ViewSingleProduct.jsp?id=${product.getId()}">Buy</a>
        </div>
        </c:forEach>
        </c:if>
        </c:forEach>
        </div>
        </div>
        </div>
        
    </c:if>
        
        <script>
            function openCity(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
            }

// Get the element with id="defaultOpen" and click on it
            document.getElementById("defaultOpen").click();
            </script>
        
    </div>
    
    
    <c:import url="Footer.jsp"></c:import>
    </body>
</html>