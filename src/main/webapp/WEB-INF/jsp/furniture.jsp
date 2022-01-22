<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/css/shared.css" rel="stylesheet">
    <link href="/css/cars.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title lang="ar"><spring:message code="furniturepage.titel"/></title>
    <style>
        .padding-10 {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .details {
            margin-top: 0px !important;
            max-width: 100%;
        }
    </style>
</head>
<body>
<c:import url="headr.jsp"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6 login-form container-shadow">
            <div class="row padding-10">
                <div class="col-md-10">
                    <a class="profile-text" href="/profile/${furniture.getRelatedAdd().getOwnerUser().getId()}">
                        <img src="/profileImage/${furniture.getRelatedAdd().getOwnerUser().getId()}" width="50"
                             height="50" class="rounded-circle">
                        ${furniture.getRelatedAdd().getOwnerUser().getFirstName()} ${furniture.getRelatedAdd().getOwnerUser().getLastName()}
                    </a>
                </div>
                <div class="col-md-2">
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div id="myCarousel-${furniture.getRelatedAdd().getId()}" class="carousel slide"
                         data-ride="carousel">
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <c:forEach var="path" items="${furniture.getRelatedAdd().getImagesPaths()}"
                                       varStatus="status">
                                <div class="item  ${status.first ?'active':'' }">
                                    <img class="img-car" src="${path}" style="width:100%;">
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Left and right controls -->
                        <c:if test="${furniture.getRelatedAdd().getImagesPaths().size() > 1}">
                            <a class="left carousel-control" href="#myCarousel-${furniture.getRelatedAdd().getId()}"
                               data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel-${furniture.getRelatedAdd().getId()}"
                               data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="container details">
                <div class="row">
                    <h2 class="title-link">${furniture.getRelatedAdd().getTitle()}</h2>
                    <br/>
                </div>
                <div class="row">
                    <p><b class="card-lable"><spring:message
                            code="electrical.label.country"/> </b>${furniture.getRelatedAdd().getCountry()} </p>
                </div>
                <div class="row">
                    <p><b class="card-lable"><spring:message code="electrical.label.city"/> </b><spring:message
                            code="${furniture.getRelatedAdd().getCity()}"/></p>
                </div>
                <div class="row">
                    <p><b class="card-lable"><spring:message
                            code="electricals.label.last_price"/> </b>${furniture.getRelatedAdd().getLastPrice()}</p>
                </div>
                <div class="row">

                    <p><b class="card-lable"><spring:message code="electricals.label.condition"/></b> <spring:message
                            code="condition.${furniture.getFurnitureCondition()}"/></p>

                </div>
                <div class="row">
                    <p><b class="card-lable"><spring:message
                            code="electricals.label.description"/> </b>${furniture.getRelatedAdd().getAdDescription()}
                    </p>
                    <br/>
                </div>
                <div class="text-center">
                    <form role="form" method="post" action="/action/newPrice" name="car">
                        <input type="number" id="firstPrice" name="newPrice" min="${furniture.getRelatedAdd().getLastPrice()}" max="2147483647" placeholder="your offer">
                        <input type="number" hidden name="adId" value="${furniture.getRelatedAdd().getId()}">
                        <input hidden name="redirectUrl" value="/furniture/${furniture.getId()}">
                        <br/>
                        <div class="col text-center">
                            <button type="submit" class="btn btn-primary center-col"><spring:message code="addCar.label.submit"/></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-3">
        </div>
    </div>
</div>

</body>
</html>
