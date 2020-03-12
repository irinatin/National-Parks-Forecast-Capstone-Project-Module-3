<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<form action="survey" method="post">

<div class="form">

<div class="formInputGroup">
<label for="parkcode">My Favorite Park Is:</label>
<select name="parkcode" id="parkcode">
<c:forEach items="${parks}" var="park">
	<option value="${park.parkCode}">${park.parkName}</option>
</c:forEach>
</select>
</div>

<div class="formInputGroup">
<label for="emailaddress">My Email Address Is:</label>
<input type="text" name="emailaddress" id="emailaddress"/>
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
<label for="activitylevel">My Activity Level Is:</label>
	<span>
		<input type="radio" name="activitylevel" value="" id="activitylevel">Inactive
		<input type="radio" name="activitylevel" value="" id="activitylevel">Sedentary
		<input type="radio" name="activitylevel" value="" id="activitylevel">Active
		<input type="radio" name="activitylevel" value="" id="activitylevel">Extremely Active
	</span>
</div>

<div>
<input class= "submitButton" type="submit" value="Submit Survey!">
</div>

</div>
</form>



<c:import url="/WEB-INF/jsp/common/footer.jsp" />