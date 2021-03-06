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
    <link href="/css/login.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
            crossorigin="anonymous"></script>
    <title lang="ar"><spring:message code="loginpage.titel"/></title>

</head>
<body>
<c:import url="headr.jsp"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6 login-form container">
            <div class="container">
                <form role="form" method="post">
                    <h2 class="text-center"><spring:message code="login.page.sign_in"/> </h2>
                    <div class="form-group">
                        <label for="usernameId" class="col-sm-3 control-label" style="max-width: 50%"><spring:message code="login.page.email"/></label>
                        <div class="col-sm-9">
                            <input type="text" id="usernameId" name="userName"  class="form-control" autofocus required>
                        </div>
                    </div>
                    <div class="form-group " >
                        <label for="passwordId" class="col-sm-3 control-label" style="max-width: 50%"><spring:message code="login.page.password"/></label>
                        <div class="col-sm-9">
                            <input type="password" id="passwordId" name="password" class="form-control" autofocus required>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block"><spring:message code="login.page.login"/></button>
                    </div>
                    <div class="create-link">
                        <a class="create-link" href="/create"><spring:message code="login.page.create_new_account"/></a>
                    </div>
                    <div class ="row row-login">
                        <h3 class="warning">${error}</h3>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-3">
        </div>
    </div>
</div>

<c:import url="footer.jsp"/>
</body>
</html>