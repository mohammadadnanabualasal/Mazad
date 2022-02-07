<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="<spring:message code="html.dir"/>">
<head>
    <link rel="icon" href="/x/jm-logo.jpeg">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/rtl.css">
    <link href="/css/home.css" rel="stylesheet">
    <link href="/css/shared.css" rel="stylesheet">
    <title lang="ar"><spring:message code="home.title"/></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
            crossorigin="anonymous"></script>
</head>
<body>

<c:import url="headr.jsp"/>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <div class="container cards-continer">
            <div class="row">
                <div class="col-sm-4 p-1">
                    <div class="card shadow  mb-5 bg-body rounded" onclick="location.href='/furnitures';">
                        <img src="/x/furniture.jpg" class="card-img-top imgx" alt="...">
                        <div class="card-body">
                            ${adsCount.get("furniture")}
                            <h3 class="card-title" dir="rtl"><spring:message code="main.page.label.furniture"/></h3>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 p-1">
                    <div class="card shadow  mb-5 bg-body rounded" onclick="location.href='/electricals';"
                         >
                        <img src="/x/electrical.jpg" class="card-img-top imgx" alt="...">
                        <div class="card-body">
                            ${adsCount.get("electricals")}
                            <h3 class="card-title"><spring:message code="main.page.label.electrical"/></h3>

                        </div>
                    </div>
                </div>
                <div class="col-sm-4 p-1">
                    <div class="card shadow  mb-5 bg-body rounded" onclick="location.href='/cars';"
                         >
                        <img src="/x/cars.jpg" class="card-img-top imgx" alt="...">
                        <div class="card-body">
                            ${adsCount.get("cars")}
                            <h3 class="card-title"><spring:message code="main.page.label.cars"/></h3>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 p-1">
                    <div class="card shadow  mb-5 bg-body rounded" onclick="location.href='/real-estates';"
                         >
                        <img src="/x/real-estate.jpg" class="card-img-top imgx" alt="...">
                        <div class="card-body">
                            ${adsCount.get("realEstates")}
                            <h3 class="card-title"><spring:message code="main.page.label.real-estate"/></h3>

                        </div>
                    </div>
                </div>
                <div class="col-sm-4 p-1">
                    <div class="card shadow  mb-5 bg-body rounded" onclick="location.href='/others';"
                         >
                        <img src="/x/other_things.png" class="card-img-top imgx" alt="...">
                        <div class="card-body">
                            ${adsCount.get("others")}
                            <h3 class="card-title"><spring:message code="main.page.label.other_things"/></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>
<c:import url="footer.jsp"/>
</body>
</html>