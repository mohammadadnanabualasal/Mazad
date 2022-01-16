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
    <title lang="ar"><spring:message code="home.title"/></title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
            crossorigin="anonymous"></script>
</head>
<body>
<c:import url="headr.jsp"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4  center-col">
            <br/>
            <br/>
            <form role="form" method="post" action="/action/addCar" name="car" >
                <div class="form-group">

                    <label for="title"><spring:message code="addCar.label.ad_title"/></label>
                    <textarea class="form-control" id="title" name="title"  rows="2"></textarea>
                    <br/>
                    <label for="location"><spring:message code="addCar.label.location"/> </label>
                    <select id="location"  class="form-control" name="location">
                        <option value=""></option>
                        <c:forEach var="i" begin="0" end="11">
                            <option  value="${i}"><spring:message code="addCar.location.${i}"/></option>
                        </c:forEach>
                    </select>
                    <br/>
                    <label><spring:message code="addCar.label.car_maker"/></label>
                    <select id="carMaker" name="carMaker" class="form-control">
                        <option selected></option>
                        <c:forEach var="i" begin="1" end="38">
                            <option  value="${i}"><spring:message code="addCar.maker.${i}"/></option>
                        </c:forEach>
                    </select>
                    <br/>
                    <br/>
                    <label for="CarModel">Car Model</label>
                    <textarea class="form-control" id="CarModel" name="carModel"  rows="1"></textarea>
                    <br/>
                    <label for="Year"><spring:message code="add.label.year"/></label>
                    <input name="year" type="number" min="1970" max="2022" step="1" id="Year" value="2000"/>
                    <br/>
                    <label><spring:message code="addCar.label.car_condition"/></label>
                    <select id="condition" name="condition" class="form-control">
                        <option selected></option>
                        <option value="1">New</option>
                        <option value="2">Used</option>
                    </select>
                    <br/>
                    <label><spring:message code="addCar.label.transmission_type"/></label>
                    <select id="tarnsType" name="tarnsType" class="form-control">
                        <option selected></option>
                        <option value="1">Manual</option>
                        <option value="2">Auto</option>
                        <option value="2">Other</option>
                    </select>
                    <br/>
                    <label><spring:message code="addCar.label.fuel_type"/></label>
                    <select id="fuelType" name="fuelType" class="form-control">
                        <option selected></option>
                        <option value="1">Gasolin</option>
                        <option value="2">Diesel</option>
                        <option value="3">Eliecteric</option>
                        <option value="4">Hybrid</option>
                    </select>
                    <br/>
                    <label for="kilometers"><spring:message code="addCar.label.kilometers"/></label>
                    <input  type="number" id="kilometers" name="kilometers" min="0" >
                    <br/>
                    <label for="firstPrice"><spring:message code="addCar.label.initial_price"/></label>
                    <input  type="number" id="firstPrice" name="firstPrice" min="0" >
                    <br/>
                    <br/>
                    <label for="description"><spring:message code="addCar.label.description"/></label>
                    <textarea class="form-control" id="description" name="description" rows="5"></textarea>
                    <br/>
                    <label for="images"><spring:message code="addCar.label.images"/></label>
                    <br/>
                    <input name="images" type="file" class="form-control-file" id="images" multiple="multiple" accept="image/png, image/gif, image/jpeg"/>
                    <br/>
                </div>
                <div class="col text-center">
                    <button type="submit" class="btn btn-primary center-col"><spring:message code="addCar.label.submit"/></button>
                </div>
            </form>
            <div class="row">
                <div class="col-md-6">
                </div>
                <div class="col-md-6">
                </div>
            </div>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</div>
</body>
</html>