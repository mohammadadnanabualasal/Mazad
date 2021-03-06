<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<!DOCTYPE html>
<html lang="en" dir="<spring:message code="html.dir"/>">
<head><link rel="icon" href="/x/jm-logo.jpeg">

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
    <title lang="ar"><spring:message code="real-estatespage.titel"/></title>

</head>
<body>
<c:import url="headr.jsp"/>

<div class="container">
    <c:forEach items="${realEstates}" var="realEstate">
            <c:set var="ad" value="${realEstate.getRelatedAdd()}"/>
    <div class="row card-strip">

        <div class="col-md-8">
            <div class="row">
                <a class="profile-text" href="/profile/${ad.getOwnerUser().getId()}">
                    <img src="/profileImage/${ad.getOwnerUser().getId()}" width="20" height="20"
                         class="rounded-circle">
                        ${ad.getOwnerUser().getFirstName()} ${ad.getOwnerUser().getLastName()}
                </a>
            </div>
            <div class="row">
                    <h3 class="text-left">
                        <a href="/realEstate/${realEstate.getId()}" class="title-link">${realEstate.getRelatedAdd().getTitle()}</a>
                    </h3>
            </div>
            <div class="row">
                <p><b class="card-lable"><spring:message code="electrical.label.country"/> </b> <span class="card-lable-value">${realEstate.getRelatedAdd().getCountry()}</span></p>
            </div>
            <div class="row">
                <p><b class="card-lable"><spring:message code="electrical.label.city"/> </b> <span class="card-lable-value"><spring:message code="${realEstate.getRelatedAdd().getCity()}"/></span></p>
            </div>
            <div class="row">
                <p><b class="card-lable"><spring:message code="electricals.label.last_price"/></b> <span class="card-lable-value">${realEstate.getRelatedAdd().getLastPrice()}</span></p>
            </div>
            <div class="text-center">
                <a href="/realEstate/${realEstate.getId()}" class="btn btn-primary"><spring:message code="open.btn"/></a>
            </div>
        </div>
        <div class="col-md-4">
            <div id="myCarousel-${realEstate.getRelatedAdd().getId()}" class="carousel slide" data-ride="carousel">

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <c:forEach var="path" items="${realEstate.getRelatedAdd().getImagesPaths()}" varStatus = "status">
                        <div class="item  ${status.first ?'active':'' }">
                            <img class="img-car" src="${path}" style="width:100%;">
                        </div>
                    </c:forEach>
                </div>

                <!-- Left and right controls -->
                <c:if test="${realEstate.getRelatedAdd().getImagesPaths().size() > 1}">
                    <a class="left carousel-control" href="#myCarousel-${realEstate.getRelatedAdd().getId()}" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel-${realEstate.getRelatedAdd().getId()}" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </c:if>
            </div>
            <h5 style="color: red">${ad.endIn()}</h5>
        </div>
    </div>
    </c:forEach>
</div>
<c:import url="footer.jsp"/>
</body>
</html>