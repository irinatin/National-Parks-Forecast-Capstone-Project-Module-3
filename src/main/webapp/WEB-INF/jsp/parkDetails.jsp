<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div id="bigPicHolder">
	<img id="bigPic" src="img/parks/${fn:toLowerCase(park.parkCode)}.jpg"
		class="detail-image">
</div>

<div id="hotdog">
	<div id="quoteHolder">
		<p id="quote">"${park.quote}"</p>
	</div>
	<div id="attribution">
		<p id="elephant">&nbsp; &nbsp;-&nbsp;${park.quoteSource}</p>
	</div>
</div>

<div class="detail-text-block">

	<h2>${park.parkName}</h2>

	<h3>Considered the best park in ${park.state}!</h3>

	<p>${park.parkDescription}</p>

</div>
<div id="centerer">
	<div id="stat-holder">

		<div class="statistics-box">

			<p class="subtitle">Acres of Land</p>
			<p class="big-number">${park.acreage}</p>

		</div>

		<div class="statistics-box">

			<p class="subtitle">Park Elevation</p>
			<p class="big-number">${park.elevation}</p>

		</div>

		<div class="statistics-box">

			<p class="subtitle">Miles of Trail</p>
			<p class="big-number">${park.milesOfTrail}</p>

		</div>

		<div class="statistics-box">

			<p class="subtitle">Campsites</p>
			<p class="big-number">${park.numberOfSites}</p>

		</div>

		<div class="statistics-box">

			<p class="subtitle">Founded in:</p>
			<p class="big-number">${park.yearFounded}</p>

		</div>

		<div class="statistics-box">

			<p class="subtitle">Visitors Each Year</p>
			<p class="big-number">${park.annualVisitorCount}</p>

		</div>

		<div class="statistics-box">

			<p class="subtitle">Animal Species</p>
			<p class="big-number">${park.numberOfAnimalSpecies}</p>

		</div>

		<div class="statistics-box">

			<p class="subtitle">To Enter</p>
			<p class="big-number">$${park.entryFee}</p>

		</div>
	</div>

</div>

<!--This is not yet linked to anything, but it sure is fun to click.-->


<div id="weather-box">


	<div id="today-weather">
		<c:set var="string1" value="${forecastOne.weather}" />
		<c:set var="string2" value="${fn:replace(string1,' ', '')}" />
		<h3>Today</h3>
		<img src="img/weather/${string2}.png">
		<p id="high-low">
			High:
			<c:if test="${tempCheck == true}">${forecastOne.highTemp}F</c:if>
			<c:if test="${tempCheck == false}">${(forecastOne.highTemp - 32) * 0.5556}C</c:if>
			Low:
			<c:if test="${tempCheck == true}">${forecastOne.lowTemp}F</c:if>
			<c:if test="${tempCheck == false}">${(forecastOne.lowTemp - 32) * 0.5556}C</c:if>
		</p>
		<p style="font-size: small"><a href="parkDetails?parkCode=${park.parkCode}&tempScale=Celsius">Click
			here for Celsius Temperatures</a> </p>
		<p style="font-size: small"><a href="parkDetails?parkCode=${park.parkCode}&tempScale=Fahrenheit">Click
			here for Fahrenheit Temperatures</a></p>






		<p id="advisory">${advisory}</p>
		<c:if test="${(forecastOne.highTemp - forecastOne.lowTemp) > 20}">
			<p>Wear breatheable layers!!!</p>
		</c:if>
	</div>
	<div>
		<h3 style="font-family: arial">Extended Forecast</h3>
		<div id="five-day">
			<br>
			<div class="daily">
				<c:set var="string1" value="${forecastTwo.weather}" />
				<c:set var="string2" value="${fn:replace(string1,' ', '')}" />
				<img src="img/weather/${string2}.png">

				<p id="high">
					High:
					<c:if test="${tempCheck == true}">${forecastTwo.highTemp}F</c:if>
					<c:if test="${tempCheck == false}">${(forecastTwo.highTemp - 32) * 0.5556}C</c:if>
				</p>

				<p id="low">
					Low:
					<c:if test="${tempCheck == true}">${forecastTwo.lowTemp}F</c:if>
					<c:if test="${tempCheck == false}">${(forecastTwo.lowTemp - 32) * 0.5556}C</c:if>
				</p>

			</div>

			<div class="daily">
				<c:set var="string1" value="${forecastThree.weather}" />
				<c:set var="string2" value="${fn:replace(string1,' ', '')}" />
				<img src="img/weather/${string2}.png">
				<p id="high">
					High:
					<c:if test="${tempCheck == true}">${forecastThree.highTemp}F</c:if>
					<c:if test="${tempCheck == false}">${(forecastThree.highTemp - 32) * 0.5556}C</c:if>
				</p>

				<p id="low">
					Low:
					<c:if test="${tempCheck == true}">${forecastThree.lowTemp}F</c:if>
					<c:if test="${tempCheck == false}">${(forecastThree.lowTemp - 32) * 0.5556}C</c:if>
				</p>

			</div>

			<div class="daily">
				<c:set var="string1" value="${forecastFour.weather}" />
				<c:set var="string2" value="${fn:replace(string1,' ', '')}" />
				<img src="img/weather/${string2}.png">
				<p id="high">
					High:
					<c:if test="${tempCheck == true}">${forecastFour.highTemp}F</c:if>
					<c:if test="${tempCheck == false}">${(forecastFour.highTemp - 32) * 0.5556}C</c:if>
				</p>

				<p id="low">
					Low:
					<c:if test="${tempCheck == true}">${forecastFour.lowTemp}F</c:if>
					<c:if test="${tempCheck == false}">${(forecastFour.lowTemp - 32) * 0.5556}C</c:if>
				</p>

			</div>

			<div class="daily">
				<c:set var="string1" value="${forecastFive.weather}" />
				<c:set var="string2" value="${fn:replace(string1,' ', '')}" />
				<img src="img/weather/${string2}.png">
				<p id="high">
					High:
					<c:if test="${tempCheck == true}">${forecastFive.highTemp}F</c:if>
					<c:if test="${tempCheck == false}">${(forecastFive.highTemp - 32) * 0.5556}C</c:if>
				</p>

				<p id="low">
					Low:
					<c:if test="${tempCheck == true}">${forecastFive.lowTemp}F</c:if>
					<c:if test="${tempCheck == false}">${(forecastFive.lowTemp - 32) * 0.5556}C</c:if>
				</p>

			</div>

		</div>
	</div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />


