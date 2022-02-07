<%@ page import="com.example.mazad.entities.UsersEntity" %>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    $(document).ready(function () {
        $("#locales").change(function () {
            var selectedOption = $('#locales').val();
            if (selectedOption != '') {
                window.location.replace('?lang=' + selectedOption);
            }
        });
    });
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<link href="/css/header.css" rel="stylesheet">


<%

    pageContext.setAttribute("user",(UsersEntity)session.getAttribute("user"));
%>

<div class="container-fluid sticky">
    <div class="row header">
        <div class="col-md-12">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link active"  href="/home" ><spring:message code="main.page.label.website.home"/></a>
                </li>
                <c:if test="${user != null && user.isAdmin()}">
                    <li class="nav-item">
                        <a class="nav-link active" href="/action/adminTools"><spring:message code="headr.admin_tools"/></a>
                    </li>
                </c:if>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"><spring:message code="main.page.label.website.Post"/></a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/addFurniture"><spring:message code="main.page.label.furniture"/></a>
                        <a class="dropdown-item" href="/addElectrical"><spring:message code="main.page.label.electrical"/></a>
                        <a class="dropdown-item" href="/addCar"><spring:message code="main.page.label.cars"/></a>
                        <a class="dropdown-item" href="/addRealEstate"><spring:message code="main.page.label.real-estate"/></a>
                        <a class="dropdown-item" href="/addOthers"><spring:message code="main.page.label.other_things"/></a>
                    </div>
                </li>
                <li class="nav-item ">
                    <c:choose>
                        <c:when test="${user != null}">
                            <a class="nav-link dropdown-toggle" href="#" id="profileDropDown" data-toggle="dropdown">${user.firstName} ${user.lastName}</a>
                            <div class="dropdown-menu" aria-labelledby="profileDropDown">
                                <a class="dropdown-item" href="/profile"><spring:message code="main.page.dropdown.profile"/></a>
                                <a class="dropdown-item" href="/logout"><spring:message code="main.page.dropdown.logout"/></a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link" href="/login"><spring:message code="main.page.label.website.login"/></a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="nav-item li-center">
                    <h2  class="nav-link" href="#"><spring:message code="main.page.label.website.name"/></h2>
                </li>
                <li class="nav-item">
                    <select class="nav-link" id="locales" aria-labelledby="dropdownMenuButton">
                        <option class="dropdown-item disabled" value=""><spring:message code="lang.eng.label"/></option>
                        <option class="dropdown-item" value="en"><spring:message code="lang.eng"/></option>
                        <option class="dropdown-item" value="ar"><spring:message code="lang.ar"/></option>
                    </select>
                </li>
            </ul>
        </div>
    </div>
</div>


