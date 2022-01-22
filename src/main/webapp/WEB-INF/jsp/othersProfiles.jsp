<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="<spring:message code="html.dir"/>">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/rtl.css">
    <link href="/css/shared.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
            crossorigin="anonymous"></script>
    <title lang="ar"><spring:message code="profilepage.titel"/></title>


</head>
<body>
<c:import url="headr.jsp"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6 login-form container-shadow">
            <div class="container">
                <div class="row">
                    <div class="text-center image-center"> <img src="/profileImage/${userProfile.getId()}" width="200" height="200" class="rounded-circle"> </div>
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
            </div>
        </div>
        <div class="col-md-3">
        </div>
    </div>
</div>
</body>
</html>