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
<body class="bg-image"style="background-image: url( '/image/900/900/background.jpeg');height: 130vh; background-size:100% 100%; background-repeat: no-repeat">
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

                    <label for="title">Ad title</label>
                    <textarea class="form-control" id="title" name="title"  rows="2"></textarea>
                    <br/>
                    <label for="location">Location</label>
                    <select id="location"  class="form-control" name="location">
                        <option value=""></option>
                        <option value="0">اربد </option>
                        <option value="1">جرش </option>
                        <option value="2">عجلون </option>
                        <option value="3">البلقاء </option>
                        <option value="4">مأدبا </option>
                        <option value="5">المفرق </option>
                        <option value="6">الزرقاء </option>
                        <option value="7">عمان </option>
                        <option value="8">الكرك </option>
                        <option value="9">الطفيلة </option>
                        <option value="10">معان </option>
                        <option value="11">العقبة </option>
                    </select>
                    <br/>
                    <label> Condition</label>
                    <select id="condition" name="condition" class="form-control">
                        <option selected></option>
                        <option value="1">New</option>
                        <option value="2">Used</option>
                    </select>
                    <br/>
                    <label for="firstPrice">First Price </label>
                    <input type="number" id="firstPrice" name="firstPrice" min="0" >
                    <br/>
                    <br/>
                    <label for="description">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="5"></textarea>
                    <br/>
                    <label for="images">Images</label>
                    <br/>
                    <input name="images" type="file" class="form-control-file" id="images" multiple="multiple" accept="image/png, image/gif, image/jpeg"/>
                    <br/>
                </div>
                <div class="col text-center">
                    <button type="submit" class="btn btn-primary center-col">Submit</button>
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