<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<!DOCTYPE html>
<html lang="en" dir="<spring:message code="html.dir"/>">
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
<div class="container-fluid" style="padding-top: 100px">
    <c:forEach items="${entities}" var="entity">
        <div class="row card-strip">
            <div class="col-md-8">
                <div class="row">
                    <a class="profile-text" href="/profile/${entity.getRelatedAdd().getOwnerUser().getId()}">
                        <img src="/profileImage/${entity.getRelatedAdd().getOwnerUser().getId()}" width="20" height="20"
                             class="rounded-circle">
                            ${entity.getRelatedAdd().getOwnerUser().getFirstName()} ${entity.getRelatedAdd().getOwnerUser().getLastName()}
                    </a>
                </div>
                <div class="col-12">
                    <div class="row">
                        <h3 class="text-left">
                            <a href="${entity.getEntityUrl()}" class="title-link">${entity.getRelatedAdd().getTitle()}</a>
                        </h3>
                    </div>
                    <div class="row">
                        <p><b class="card-lable">Country:</b> <span
                                class="card-lable-value">${entity.getRelatedAdd().getCountry()}</span></p>
                    </div>
                    <div class="row">
                        <p><b class="card-lable">City:</b> <span
                                class="card-lable-value">${entity.getRelatedAdd().getCity()}</span></p>
                    </div>

                    <c:if test="${entity.getClass() eq 'class com.example.mazad.entities.CarsEntity'}">
                        <div class="row">
                            <p><b class="card-lable"><spring:message code="addCar.label.car_maker"/>:</b> <span
                                    class="card-lable-value">${entity.getCar_maker()}</span></p>
                        </div>
                        <div class="row">
                            <p><b class="card-lable"><spring:message code="addCar.label.car_model"/>:</b> <span
                                    class="card-lable-value">${entity.getModel()}</span></p>
                        </div>
                        <div class="row">
                            <p><b class="card-lable"><spring:message code="addCar.label.year"/>:</b> <span
                                    class="card-lable-value">${entity.getYear()}</span></p>
                        </div>
                        <div class="row">

                            <p><b class="card-lable"><spring:message code="addCar.label.transmission_type"/>:</b> <span
                                    class="card-lable-value"><spring:message
                                    code="transmission_type.${entity.getTransmission_type()}"/></span></p>

                        </div>
                        <div class="row">

                            <p><b class="card-lable"><spring:message code="addCar.label.fuel_type"/>:</b> <span
                                    class="card-lable-value"><spring:message
                                    code="fuel_type.${entity.getFuel_type()}"/></span></p>

                        </div>
                        <div class="row">

                            <p><b class="card-lable"><spring:message code="addCar.label.color"/>:</b> <span
                                    class="card-lable-value">${entity.getColor()}</span></p>&emsp;<span
                                style="background-color: ${entity.getColor()}" class="dot-color"></span>

                        </div>
                        <div class="row">

                            <p><b class="card-lable"><spring:message code="addCar.label.car_condition"/>:</b> <span
                                    class="card-lable-value"><spring:message
                                    code="car_condition.${entity.getCar_condition()}"/></span></p>

                        </div>
                        <div class="row">

                            <p><b class="card-lable"><spring:message code="addCar.label.kilometers"/>:</b> <span
                                    class="card-lable-value">${entity.getKilometers()}</span></p>
                        </div>
                    </c:if>
                    <div class="row">
                        <p><b class="card-lable">Last Price:</b> <span
                                class="card-lable-value">${entity.getRelatedAdd().getLastPrice()}</span></p>
                    </div>

                    <div class="row">
                        <div class="col-5">
                            <div class="text-center">
                                <a href="/action/deleteAd/${entity.getRelatedAdd().getTypeId()}/${entity.getId()}" class="btn btn-primary"
                                   style="background-color: red;">Delete</a>
                            </div>
                        </div>
                        <div class="col-5">
                            <div class="text-center">
                                <a href="/action/enableAd/${entity.getRelatedAdd().getTypeId()}/${entity.getId()}" class="btn btn-primary">Enable</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div id="myCarousel-${entity.getRelatedAdd().getId()}" class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <c:forEach var="path" items="${entity.getRelatedAdd().getImagesPaths()}" varStatus="status">
                            <div class="item  ${status.first ?'active':'' }">
                                <img class="img-car" src="${path}" style="width:100%;">
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Left and right controls -->
                    <c:if test="${entity.getRelatedAdd().getImagesPaths().size() > 1}">
                        <a class="left carousel-control" href="#myCarousel-${entity.getRelatedAdd().getId()}"
                           data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel-${entity.getRelatedAdd().getId()}"
                           data-slide="next">
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