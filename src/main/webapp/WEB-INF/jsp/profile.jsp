<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="<spring:message code="html.dir"/>">
<head><link rel="icon" href="/x/jm-logo.jpeg">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/rtl.css">
    <link href="/css/shared.css" rel="stylesheet">
    <link href="/css/cars.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
            crossorigin="anonymous"></script>
    <title lang="ar"><spring:message code="profilepage.titel"/></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <script>
        function changImage(){
            document.getElementById("imageForm").submit();
        }
    </script>

</head>
<body>
<c:import url="headr.jsp"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6">
            <div class="container login-form container-shadow">
                <div class="row">
                    <div class="text-center image-center"> <img src="/profileImage/${userProfile.getId()}" width="200" height="200" class="rounded-circle"> </div>
                </div>
                <div class="row">
                    <div class="col-sm-5 form-group">
                        <form id="imageForm" action="/addProfilePicture" method="post" enctype="multipart/form-data">
                            <input id="imageFile" name="imageFile" type="file" class="form-control-file" multiple onchange="changImage()">
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-5">
                        <h6 class="mb-0"><spring:message code="profile.full_name"/></h6>
                    </div>
                    <div class="col-sm-7 text-secondary">
                        ${userProfile.getFirstName()} ${userProfile.getMiddleName()} ${userProfile.getLastName()}
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-5">
                        <h6 class="mb-0"><spring:message code="profile.email"/></h6>
                    </div>
                    <div class="col-sm-7 text-secondary">
                        ${userProfile.getEmail()}
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-5">
                        <h6 class="mb-0"><spring:message code="profile.phone_number"/></h6>
                    </div>
                    <div class="col-sm-7 text-secondary">
                        ${userProfile.getPhoneNumber()}
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-5">
                        <h6 class="mb-0"><spring:message code="profile.country"/></h6>
                    </div>
                    <div class="col-sm-7 text-secondary">
                        ${userProfile.getCountry()}
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-5">
                        <h6 class="mb-0"><spring:message code="profile.city"/></h6>
                    </div>
                    <div class="col-sm-7 text-secondary">
                        ${userProfile.getCity()}
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-5">
                        <h6 class="mb-0"><spring:message code="profile.credit_card_number"/></h6>
                    </div>
                    <div class="col-sm-7 text-secondary">
                        ${userProfile.getCreditCardId()}
                    </div>
                </div>
                <br/>
            </div>
            <br/>
            <br/>
            <c:forEach items="${ads}" var="entity">
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
                                <div class="col-4"></div>
                                <div class="col-5">
                                    <div class="text-center">
                                        <a href="/action/deleteAd/${entity.getRelatedAdd().getTypeId()}/${entity.getId()}" class="btn btn-primary"
                                           style="background-color: red;">Delete</a>
                                    </div>
                                </div>
                                <div class="col-3"></div>
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
                        <h5 style="color: red;font-size: 14px;">${entity.getRelatedAdd().endIn()}</h5>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="col-md-3">
        </div>
    </div>
</div>
<c:import url="footer.jsp"/>
</body>
</html>