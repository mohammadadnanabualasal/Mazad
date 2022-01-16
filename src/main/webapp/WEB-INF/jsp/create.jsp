<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib
        uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/rtl.css">
    <link href="/css/shared.css" rel="stylesheet">
    <link href="/css/create.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
    </script>
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
        <div class="col-md-3">
        </div>
        <div class="col-md-6 create-container">
            <div class="container">
                <form class="form-horizontal" role="form" method="post">
                    <h2>Registration</h2>
                    <div class="form-group">
                        <label for="firstName" class="col-sm-4 control-label">First Name</label>
                        <div class="col-sm-9" >
                            <input type="text" id="firstName" name="firstName" placeholder="First Name" class="form-control"
                                   autofocus required value="${usersEntity.getFirstName()}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="middleName" class="col-sm-4 control-label">Middle Name</label>
                        <div class="col-sm-9">
                            <input name="middleName" type="text" id="middleName" placeholder="Middle Name" class="form-control" autofocus required value="${usersEntity.getMiddleName()}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastName" class="col-sm-4 control-label">Last Name</label>
                        <div class="col-sm-9" >
                            <input type="text" id="lastName" name="lastName" placeholder="Last Name" class="form-control" autofocus required value="${usersEntity.getLastName()}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-4 control-label">Email</label>
                        <div class="col-sm-9">
                            <input type="email" id="email"  placeholder="Email" class="form-control" name= "email" required value="${usersEntity.getEmail()}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-4 control-label">Password</label>
                        <div class="col-sm-9">
                            <input type="password" id="password" name="password" placeholder="Password" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="passwordConfirmation" class="col-sm-4 control-label">Confirm Password</label>
                        <div class="col-sm-9">
                            <input type="password" id="passwordConfirmation" name="passwordConfirmation" placeholder="Password" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber" class="col-sm-4 control-label">Phone number </label>
                        <div class="col-sm-9" >
                            <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Phone number" class="form-control" required value="${usersEntity.getPhoneNumber()}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="creditCardId" class="col-sm-4 control-label">Credit Card Number</label>
                        <div class="col-sm-9">
                            <input type="number" id="creditCardId" name="creditCardId" placeholder="Credit Card Number" class="form-control" required value="${usersEntity.getCreditCardId()}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="country" class="col-sm-4 control-label">Country</label>
                        <div class="col-sm-9">
                            <input type="text" id="country" name="country" placeholder="Country" class="form-control" required value="${usersEntity.getCountry()}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="city" class="col-sm-4 control-label">City</label>
                        <div class="col-sm-9">
                            <input type="text" id="city" name="city" placeholder="City" class="form-control" required value="${usersEntity.getCity()}">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Register</button>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <h3 class="warning">${error}</h3>
                        </div>
                    </div>
                </form> <!-- /form -->
            </div>
        </div>
        <div class="col-md-3">
        </div>
    </div>
</div>
</body>
</html>