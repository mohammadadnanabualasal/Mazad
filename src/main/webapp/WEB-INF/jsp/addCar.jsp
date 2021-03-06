<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>


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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
            crossorigin="anonymous"></script>
    <title lang="ar"><spring:message code="addCar.title"/></title>

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
            <form role="form" method="post" action="/action/addCar" name="car" enctype="multipart/form-data">
                <div class="form-group">
                    <h2 class="text-center"><spring:message code="addCar.label"/></h2>
                    <c:import url="sharedInputFields.jsp"/>
                    <label><spring:message code="addCar.label.car_maker"/></label>
                    <select id="carMaker" name="carMaker" class="form-control">
                        <option selected></option>
                        <c:forEach var="i" begin="1" end="38">
                            <option  value="${i}"><spring:message code="addCar.maker.${i}"/></option>
                        </c:forEach>
                    </select>
                    <br/>
                    <br/>
                    <label for="CarModel"><spring:message code="addCar.label.car_model"/> </label>
                    <textarea class="form-control" id="CarModel" name="carModel"  rows="1"></textarea>
                    <br/>
                    <label><spring:message code="addCar.label.car_condition"/></label>
                    <select id="condition" name="condition" class="form-control">
                        <option selected></option>
                        <option value="1"><spring:message code="condition.new"/></option>
                        <option value="2"><spring:message code="condition.used"/></option>
                    </select>
                    <br/>
                    <label><spring:message code="addCar.label.transmission_type"/></label>
                    <select id="tarnsType" name="transType" class="form-control">
                        <option selected></option>
                        <option value="1"><spring:message code="transmission_type.Manual"/> </option>
                        <option value="2"><spring:message code="transmission_type.Auto"/></option>
                        <option value="2"><spring:message code="transmission_type.Other"/></option>
                    </select>
                    <br/>
                    <label><spring:message code="addCar.label.fuel_type"/></label>
                    <select id="fuelType" name="fuelType" class="form-control">
                        <option selected></option>
                        <option value="1"><spring:message code="fuel_type.Gasolin"/> </option>
                        <option value="2"><spring:message code="fuel_type.Diesel"/></option>
                        <option value="3"><spring:message code="fuel_type.Eliecteric"/></option>
                        <option value="4"><spring:message code="fuel_type.Hybrid"/></option>
                    </select>
                    <br/>
                    <label for="kilometers"><spring:message code="addCar.label.kilometers"/></label>
                    <input  type="number" id="kilometers" name="kilometers" min="0" max="2147483647">
                    <br/>
                    <label for="Year"><spring:message code="addCar.label.year"/></label>
                    <input name="year" type="number" min="1970" max="2022" step="1" id="Year" value="2000"/>
                    <br/>
                    <label for="color"><spring:message code="addCar.label.color"/></label>
                    <select id="color" name="color" class="form-control">
                        <option selected></option>
                        <c:forEach begin="1" end="10" var="c">
                            <c:set var="color"><spring:message code="color.${c}"/></c:set>
                            <option style="background-color: ${color}" value="${color}">${color}</option>
                        </c:forEach>
                    </select>
                    <br/>
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
<c:import url="footer.jsp"/>
</body>
</html>