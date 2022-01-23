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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
            crossorigin="anonymous"></script>
    <title lang="ar"><spring:message code="addFurniture.title"/></title>

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
            <form role="form" method="post" action="/action/addFurniture" name="car" enctype="multipart/form-data">
                <div class="form-group">
                    <h2 class="text-center"><spring:message code="addFurniture.label"/> </h2>

                    <label for="title"><spring:message code="addFurniture.label.ad_title"/></label>
                    <textarea class="form-control" id="title" name="title"  rows="2" maxlength="100"></textarea>
                    <br/>
                    <label for="location"><spring:message code="addFurniture.label.location"/></label>
                    <select id="location"  class="form-control" name="location">
                        <option value=""></option>
                        <c:forEach var="i" begin="0" end="11">
                            <option  value="${i}"><spring:message code="location.city.${i}"/></option>
                        </c:forEach>
                    </select>
                    <br/>
                    <label> <spring:message code="addFurniture.label.condition"/></label>
                    <select id="condition" name="condition" class="form-control">
                        <option selected></option>
                        <option value="1"><spring:message code="condition.new"/> </option>
                        <option value="2"><spring:message code="condition.used"/></option>
                    </select>
                    <br/>
                    <label for="firstPrice"><spring:message code="addFurniture.label.initial_price"/> </label>
                    <input type="number" id="firstPrice" name="initialPrice" min="0" max="2147483647">
                    <br/>
                    <br/>
                    <label for="description"><spring:message code="addFurniture.label.description"/></label>
                    <textarea class="form-control" id="description" name="description" rows="5" maxlength="5000"></textarea>
                    <br/>
                    <label for="images"><spring:message code="addFurniture.label.images"/></label>
                    <br/>
                    <input name="images" type="file" class="form-control-file" id="images" multiple="multiple" accept="image/png, image/gif, image/jpeg"/>
                    <br/>
                </div>
                <div class="col text-center">
                    <button type="submit" class="btn btn-primary center-col"><spring:message code="addFurniture.label.submit"/></button>
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