<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<h2>National Parks Survey</h2>

<%-- <cc:url --%>

<form:form action="surveyPage" method="post" modelAttribute="survey" />

<div class="form">

<div class="formInputGroup">
<form:label path="parkCode">My Favorite Park Is:</form:label>
<form:select path="parkCode" id="parkCode" />

    <form:options items="${parks}" itemValue="${park.parkCode}" itemLabel="${park.parkName}" />
<%-- <c:forEach items="${parks}" var="park">
	<option value="${park.parkCode}">${park.parkName}</option>
</c:forEach> --%>
</select>
</div>

<div class="formInputGroup">
<form:label path="emailAddress">My Email Address Is:</form:label>
<form:input type="text" path="emailAddress" id="emailAddress"/>
<form:errors path="lastName" cssClass="error" />

</div>

<div class="formInputGroup">
	<label for="state">My State Where I Live Is:</label> <select
		name="state" id="state">
		<option value="AL">Alabama</option>
		<option value="AK">Alaska</option>
		<option value="AZ">Arizona</option>
		<option value="AR">Arkansas</option>
		<option value="CA">California</option>
		<option value="CO">Colorado</option>
		<option value="CT">Connecticut</option>
		<option value="DE">Delaware</option>
		<option value="DC">District Of Columbia</option>
		<option value="FL">Florida</option>
		<option value="GA">Georgia</option>
		<option value="HI">Hawaii</option>
		<option value="ID">Idaho</option>
		<option value="IL">Illinois</option>
		<option value="IN">Indiana</option>
		<option value="IA">Iowa</option>
		<option value="KS">Kansas</option>
		<option value="KY">Kentucky</option>
		<option value="LA">Louisiana</option>
		<option value="ME">Maine</option>
		<option value="MD">Maryland</option>
		<option value="MA">Massachusetts</option>
		<option value="MI">Michigan</option>
		<option value="MN">Minnesota</option>
		<option value="MS">Mississippi</option>
		<option value="MO">Missouri</option>
		<option value="MT">Montana</option>
		<option value="NE">Nebraska</option>
		<option value="NV">Nevada</option>
		<option value="NH">New Hampshire</option>
		<option value="NJ">New Jersey</option>
		<option value="NM">New Mexico</option>
		<option value="NY">New York</option>
		<option value="NC">North Carolina</option>
		<option value="ND">North Dakota</option>
		<option value="OH">Ohio</option>
		<option value="OK">Oklahoma</option>
		<option value="OR">Oregon</option>
		<option value="PA">Pennsylvania</option>
		<option value="RI">Rhode Island</option>
		<option value="SC">South Carolina</option>
		<option value="SD">South Dakota</option>
		<option value="TN">Tennessee</option>
		<option value="TX">Texas</option>
		<option value="UT">Utah</option>
		<option value="VT">Vermont</option>
		<option value="VA">Virginia</option>
		<option value="WA">Washington</option>
		<option value="WV">West Virginia</option>
		<option value="WI">Wisconsin</option>
		<option value="WY">Wyoming</option>
	</select>
</div>


<div class="formInputGroup">
<label for="activityLevel">My Activity Level Is:</label>
	<span>
		<input type="radio" name="activityLevel" value="Inactive" id="activityLevel">Inactive
		<input type="radio" name="activityLevel" value="Sedentary" id="activityLevel">Sedentary
		<input type="radio" name="activityLevel" value="Active" id="activityLevel">Active
		<input type="radio" name="activityLevel" value="Extremely Active" id="activityLevel">Extremely Active
	</span>
</div>

<div>
<input class= "submitButton" type="submit" value="Submit Survey!">
</div>

</div>
</form>



<c:import url="/WEB-INF/jsp/common/footer.jsp" />