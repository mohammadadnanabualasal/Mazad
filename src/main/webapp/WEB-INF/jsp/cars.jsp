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
    <title lang="ar"><spring:message code="carspage.titel"/></title>

</head>
<body>
<c:import url="headr.jsp"/>

<div class="container">
    <c:forEach items="${model.getAttribute('cars')}" var="car">
    <div class="row card-strip">

        <div class="col-md-8">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-left">
                        <a href="/car/${car.getId()}" class="title-link">${car.getRelatedAdd().getTitle()}</a>
                    </h3>
                    <br/>
                </div>
            </div>
            <div class="row">
                <p><b><spring:message code="addCar.label.car_maker"/>:</b> ${car.getCar_maker()}</p>
             </div>
            <div class="row">
                <p><b><spring:message code="addCar.label.car_model"/>:</b> ${car.getModel()}</p>
            </div>
            <div class="row">
                <p><b><spring:message code="addCar.label.year"/>:</b>  ${car.getYear()} </p>
            </div>
            <div class="row">

                <p><b><spring:message code="addCar.label.transmission_type"/>:</b> <spring:message code="transmission_type.${car.getTransmission_type()}"/></p>

             </div>
            <div class="row">

                <p><b><spring:message code="addCar.label.fuel_type"/>:</b> <spring:message code="fuel_type.${car.getFuel_type()}"/></p>

            </div>
            <div class="row">

                <p><b><spring:message code="addCar.label.color"/>:</b> ${car.getColor()}</p>&emsp;<span style="background-color: ${car.getColor()}" class="dot-color"></span>

            </div>
            <div class="row">

                <p><b><spring:message code="addCar.label.car_condition"/>:</b> <spring:message code="car_condition.${car.getCar_condition()}"/></p>

            </div>
            <div class="row">

                <p><b><spring:message code="addCar.label.kilometers"/>:</b> ${car.getKilometers()}</p>
            </div>
            <div class="text-center">
                <a href="/car/${car.getId()}" class="btn btn-primary">Go To</a>
            </div>
        </div>
        <div class="col-md-4">
            <div id="myCarousel-${car.getRelatedAdd().getId()}" class="carousel slide" data-ride="carousel">
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <c:forEach var="path" items="${car.getRelatedAdd().getImagesPaths()}" varStatus = "status">
                        <div class="item  ${status.first ?'active':'' }">
                            <img class="img-car" src="${path}" style="width:100%;">
                        </div>
                    </c:forEach>
                </div>

                <!-- Left and right controls -->
                <c:if test="${car.getRelatedAdd().getImagesPaths().size() > 1}">
                    <a class="left carousel-control" href="#myCarousel-${car.getRelatedAdd().getId()}" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel-${car.getRelatedAdd().getId()}" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </c:if>
            </div>
        </div>
        </div>

    </c:forEach>
</body>
</html>