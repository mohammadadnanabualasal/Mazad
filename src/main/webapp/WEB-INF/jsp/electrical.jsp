<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/css/shared.css" rel="stylesheet">
    <link href="/css/cars.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title lang="ar"><spring:message code="electricalpage.titel"/></title>
    <style>
        .padding-10{
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .details {
            margin-top: 0px !important;
            max-width: 100%;
        }
        .profile-text{
            color: black;
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
                    <a class="profile-text" href="/profile/${electrical.getRelatedAdd().getOwnerUser().getId()}">
                        <img src="/profileImage/${electrical.getRelatedAdd().getOwnerUser().getId()}" width="50" height="50" class="rounded-circle">
                        ${electrical.getRelatedAdd().getOwnerUser().getFirstName()} ${electrical.getRelatedAdd().getOwnerUser().getLastName()}
                    </a>
                </div>
                <div class="col-md-2">
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div id="myCarousel-${electrical.getRelatedAdd().getId()}" class="carousel slide" data-ride="carousel">
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <c:forEach var="path" items="${electrical.getRelatedAdd().getImagesPaths()}"
                                       varStatus="status">
                                <div class="item  ${status.first ?'active':'' }">
                                    <img class="img-car" src="${path}" style="width:100%;">
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Left and right controls -->
                        <c:if test="${electrical.getRelatedAdd().getImagesPaths().size() > 1}">
                            <a class="left carousel-control" href="#myCarousel-${electrical.getRelatedAdd().getId()}"
                               data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel-${electrical.getRelatedAdd().getId()}"
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
                    <div class="col-md-12">
                        <h2 class="text-left">${electrical.getRelatedAdd().getTitle()}</h2>
                        <br/>
                    </div>
                </div>
                <div class="row">
                    <p><b><spring:message code="electrical.label.country"> </b>${electrical.getRelatedAdd().getCountry()} </p>
                </div>
                <div class="row">
                    <p><b><spring:message code="electrical.label.city"/> </b> ${electrical.getRelatedAdd().getCity()} </p>
                </div>
                <div class="row">
    <p><b><spring:message code="electricals.label.last_price"/> </b>${electrical.getRelatedAdd().getLastPrice()}</p>
                </div>
                <div class="row">
                    <div class="col-md-12">
    <p><b><spring:message code="electricals.label.description"/> </b>${electrical.getRelatedAdd().getAdDescription()}</p>
                        <br/>
                    </div>
                </div>
                <div class="row">

    <p><b><spring:message code="electricals.label.condition"/> </b>${electrical.getDeviceCondition()}</p>

                </div>
                <div class="row">
                    <form role="form" method="post" action="/action/newPrice" name="car">
                        <label for="firstPrice">Bid</label>
                        <input  type="number" id="firstPrice" name="newPrice" min="${electrical.getRelatedAdd().getLastPrice()}" max="2147483647">
                        <input  type="number" hidden name="adId" value="${electrical.getRelatedAdd().getId()}">
                        <input  type="number" hidden name="redirectUrl" value="/car/${electrical.getId()}">
                        <br/>
                        <div class="col text-center">
                            <button type="submit" class="btn btn-primary center-col">22522</button>
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
