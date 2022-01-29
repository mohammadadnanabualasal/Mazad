<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<label for="title"><spring:message code="addCar.label.ad_title"/></label>
<textarea class="form-control" id="title" name="title"  rows="2" maxlength="100"></textarea>
<br/>
<label for="location"><spring:message code="addCar.label.location"/> </label>
<select id="location"  class="form-control" name="location">
    <option  value="0" selected><spring:message code="location.city.0"/></option>
    <c:forEach var="i" begin="1" end="11">
        <option  value="${i}"><spring:message code="location.city.${i}"/></option>
    </c:forEach>
</select>
<br/>
<label for="firstPrice"><spring:message code="addCar.label.initial_price"/></label>
<input  type="number" id="firstPrice" name="initialPrice" min="0" max="2147483647" value="1" placeholder="1"><spring:message code="sharedInputFields.jod"/>
<br/>
<label for="firstPrice"><spring:message code="addCar.label.endsafetr"/></label>
<input type="number" id="endsAfter" name="endsAfter" min="1" max="7" value="1" placeholder="1"><spring:message code="sharedInputFields.days"/>
<br/>
<label for="description"><spring:message code="addCar.label.description"/></label>
<textarea class="form-control" id="description" name="description" rows="5" maxlength="5000"></textarea>
<br/>
<label for="images"><spring:message code="addCar.label.images"/></label>
<br/>
<input name="images" type="file" class="form-control-file" id="images" multiple="multiple" accept="image/png, image/gif, image/jpeg"/>
<br/>