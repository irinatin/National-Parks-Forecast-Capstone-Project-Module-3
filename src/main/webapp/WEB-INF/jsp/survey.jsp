<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<h2>National Parks Survey</h2>

<%-- <cc:url --%>

<form:form action="surveyPage" method="post" modelAttribute="survey">

<div class="form">

<div class="formInputGroup">
<form:label path="parkCode">My Favorite Park Is:</form:label>
<form:select path="parkCode" id="parkCode" >
    <form:options items="${parks}" itemValue="parkCode" itemLabel="parkName" />
<%-- <c:forEach items="${parks}" var="park">
	<option value="${park.parkCode}">${park.parkName}</option>
</c:forEach> --%>
</form:select>
</div>

<div class="formInputGroup">
<form:label path="emailAddress">My Email Address Is:</form:label>
<form:input type="text" path="emailAddress" id="emailAddress"/>
<form:errors path="emailAddress" style="color:red;" />

</div>

<div class="formInputGroup">
	<form:label path="state">My State Where I Live Is:</form:label> 
	<form:select path="state" id="state">
		<form:option item="Alabama" value="AL">Alabama</form:option>
		<form:option item="Alaska" value="AK">Alaska</form:option>
		<form:option item="Arizona" value="AZ">Arizona</form:option>
		<form:option item="Arkansas" value="AR">Arkansas</form:option>
		<form:option item="California" value="CA">California</form:option>
		<form:option item="Colorado" value="CO">Colorado</form:option>
		<form:option item="Connecticut" value="CT">Connecticut</form:option>
		<form:option item="Delaware" value="DE">Delaware</form:option>
		<form:option item="District Of Columbia" value="DC">District Of Columbia</form:option>
		<form:option item="Florida" value="FL">Florida</form:option>
		<form:option item="Georgia" value="GA">Georgia</form:option>
		<form:option item="Hawaii" value="HI">Hawaii</form:option>
		<form:option item="Idaho" value="ID">Idaho</form:option>
		<form:option item="Illinois" value="IL">Illinois</form:option>
		<form:option item="Indiana" value="IN">Indiana</form:option>
		<form:option item="Iowa" value="IA">Iowa</form:option>
		<form:option item="Kansas" value="KS">Kansas</form:option>
		<form:option item="Kentucky" value="KY">Kentucky</form:option>
		<form:option item="Louisiana" value="LA">Louisiana</form:option>
		<form:option item="Maine" value="ME">Maine</form:option>
		<form:option item="Maryland" value="MD">Maryland</form:option>
		<form:option item="Massachusetts" value="MA">Massachusetts</form:option>
		<form:option item="Michigan" value="MI">Michigan</form:option>
		<form:option item="Minnesota" value="MN">Minnesota</form:option>
		<form:option item="Mississippi" value="MS">Mississippi</form:option>
		<form:option item="Missouri" value="MO">Missouri</form:option>
		<form:option item="Montana" value="MT">Montana</form:option>
		<form:option item="Nebraska" value="NE">Nebraska</form:option>
		<form:option item="Nevada" value="NV">Nevada</form:option>
		<form:option item="New Hampshire" value="NH">New Hampshire</form:option>
		<form:option item="New Jersey" value="NJ">New Jersey</form:option>
		<form:option item="New Mexico" value="NM">New Mexico</form:option>
		<form:option item="New York" value="NY">New York</form:option>
		<form:option item="North Carolina" value="NC">North Carolina</form:option>
		<form:option item="North Dakota" value="ND">North Dakota</form:option>
		<form:option item="Ohio" value="OH">Ohio</form:option>
		<form:option item="Oklahoma" value="OK">Oklahoma</form:option>
		<form:option item="Oregon" value="OR">Oregon</form:option>
		<form:option item="Pennsylvania" value="PA">Pennsylvania</form:option>
		<form:option item="Rhode Island" value="RI">Rhode Island</form:option>
		<form:option item="South Carolina" value="SC">South Carolina</form:option>
		<form:option item="South Dakota" value="SD">South Dakota</form:option>
		<form:option item="Tennessee" value="TN">Tennessee</form:option>
		<form:option item="Texas" value="TX">Texas</form:option>
		<form:option item="Utah" value="UT">Utah</form:option>
		<form:option item="Vermont" value="VT">Vermont</form:option>
		<form:option item="Virginia" value="VA">Virginia</form:option>
		<form:option item="Washington" value="WA">Washington</form:option>
		<form:option item="West Virginia" value="WV">West Virginia</form:option>
		<form:option item="Wisconsin" value="WI">Wisconsin</form:option>
		<form:option item="Wyoming" value="WY">Wyoming</form:option>
	</form:select>
</div>


<div class="formInputGroup">
<form:label path="activityLevel">My Activity Level Is:</form:label>
	<span>
		<form:select path="activityLevel" id="activityLevel">
			<form:option item="Inactive" value="Inactive">Inactive</form:option>
			<form:option item="Sedentary" value="Sedentary">Sedentary</form:option>
			<form:option item="Active" value="Active">Active</form:option>
			<form:option item="Extremely Active" value="Extremely Active">Extremely Active</form:option>
		</form:select>
	</span>
</div>

<div>
<input type="submit" value="Submit Survey!" class= "submitButton">
</div>

</div>
</form:form>



<c:import url="/WEB-INF/jsp/common/footer.jsp" />