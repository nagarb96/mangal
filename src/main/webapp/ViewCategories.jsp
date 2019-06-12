<%-- 
    Document   : AddCategory
    Created on : Feb 1, 2019, 2:30:00 PM
    Author     : MRuser
--%>

<%@page import="com.mycompany.ecommproj.impl.CategoryDAOImpl"%>
<%@page import="com.mycompany.ecommproj.dao.CategoryDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    CategoryDAO cdao = new CategoryDAOImpl();

    request.setAttribute("list", cdao.getCategory());

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Categories</title>

        <c:import url="Bootstrap link.jsp"></c:import>

            <style>

                body *{
                    margin-top: 20px;
                }

                textarea{
                    resize: none;
                }

            </style>
        </head>
        <body style="text-align: center; width: 80%; margin: auto;">
            <h1>Viewing Categories</h1>
            
            <h1><a href="AddCategory.jsp" class="btn btn-link">Add Category</a></h1>

<!--            <h1>${list}</h1>-->

        <c:choose>

            <c:when test="${not empty list}">

                <table class="table table-striped">

                    <thead>
                        <tr>
                            <td style="font-weight: bold;">#</td>
                            <td style="font-weight: bold;">Name</td>
                            <td style="font-weight: bold;">Description</td>
                            <td style="font-weight: bold;">Edit</td>
                            <td style="font-weight: bold;">Delete</td>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach var="x" items="#{list}">

                            <tr>
                                <td>${x.getId()}</td>
                                <td>${x.getName()}</td>
                                <td>${x.getDescription()}</td>                
                                <td> <a href="EditCategory.jsp?id=${x.getId()}" class="btn btn-success">Edit</a> </td>                
                                <td> <a href="DeleteCategoryFromDB?id=${x.getId()}" class="btn btn-danger">Delete</a> </td>                
                            </tr>

                        </c:forEach>

                    </tbody>

                </table>

            </c:when>
            
            <c:otherwise>
                <h1 class="alert alert-danger">No Categories in System</h1>
            </c:otherwise>

        </c:choose>




    </body>
</html>
