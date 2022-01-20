<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/rtl.css">
    <link href="/css/home.css" rel="stylesheet">
    <link href="/css/shared.css" rel="stylesheet">
    <link href="/css/cars.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title lang="ar"><spring:message code="furniturespage.titel"/></title>

</head>
<body>
<c:import url="headr.jsp"/>

<div class="container">
    <c:forEach items="${furnitures}" var="furniture">
    <div class="row card-strip">

        <div class="col-md-8">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-left"> ${furniture.getRelatedAdd().getTitle()}</h3>
                </div>
            </div>
            <div class="row">
                <p><b>Country:</b> ${furniture.getRelatedAdd().getCountry()}</p>
            </div>
            <div class="row">
                <p><b>City:</b> <spring:message code="${furniture.getRelatedAdd().getCity()}"/></p>

            </div>
            <div class="row">
                <p><b>Last Price:</b> ${furniture.getRelatedAdd().getLastPrice()}</p>
            </div>
            <div class="row">
                <p><b> ${furniture.getRelatedAdd().getOwnerUser().getFirstName()} ${furniture.getRelatedAdd().getOwnerUser().getLastName()}</b></p>

            </div>
            <div class="text-center">
                <a href="#" class="btn btn-primary">Go To</a>
            </div>

        </div>
        <div class="col-md-4">
            <div id="myCarousel-${furniture.getRelatedAdd().getId()}" class="carousel slide" data-ride="carousel">

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <c:forEach var="path" items="${furniture.getRelatedAdd().getImagesPaths()}" varStatus = "status">
                        <div class="item  ${status.first ?'active':'' }">
                            <img class="img-car" src="${path}" style="width:100%;">
                        </div>
                    </c:forEach>
                </div>

                <!-- Left and right controls -->
                <c:if test="${furniture.getRelatedAdd().getImagesPaths().size() > 1}">
                    <a class="left carousel-control" href="#myCarousel-${furniture.getRelatedAdd().getId()}" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel-${furniture.getRelatedAdd().getId()}" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </c:if>
            </div>
        </div>
    </div>
    </c:forEach>
</div>

</body>
</html>