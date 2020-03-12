<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  


<c:import url="/WEB-INF/jsp/common/header.jsp" />



<img src="img/parks/${fn:toLowerCase(park.parkCode)}.jpg" class="detail-image">

<div class="detail-text-block">

	<h2>${park.parkName}</h2>
	
	<h3>Considered the best park in ${park.state}!</h3>
	
	<p>${park.parkDescription}</p>

	<p id="quote">${park.quote}</p>
	<p id="attribution">${park.quoteSource}</p>
	
	
	<div id="stat-holder">
	
		<div class="statistics-box">
		
			<p class="big-number">${park.acreage}</p>
			<p class="subtitle">Acres of Land</p>
		
		</div>
		
		<div class="statistics-box">
		
			<p class="big-number">${park.elevation}</p>
			<p class="subtitle">Park Elevation</p>
		
		</div>
		
		<div class="statistics-box">
		
			<p class="big-number">${park.milesOfTrail}</p>
			<p class="subtitle">Miles of Trail</p>
		
		</div>
		
		<div class="statistics-box">
		
			<p class="big-number">${park.numberOfSites}</p>
			<p class="subtitle">Campsites</p>
		
		</div>
		
		<div class="statistics-box">
		
			<p class="subtitle">Founded in:</p>
			<p class="big-number">${park.yearFounded}</p>
		
		</div>
		
		<div class="statistics-box">
		
			<p class="big-number">${park.annualVisitorCount}</p>
			<p class="subtitle">Visitors Each Year</p>
		
		</div>
		
		<div class="statistics-box">
		
			<p class="big-number">${park.numberOfAnimalSpecies}</p>
			<p class="subtitle">Animal Species</p>
		
		</div>
		
		<div class="statistics-box">
		
			<p class="big-number">$${park.entryFee}</p>
			<p class="subtitle">To Enter</p>
		
		</div>

	</div>

	<!--This is not yet linked to anything, but it sure is fun to click.-->
	<input type="checkbox" name="control" id="control" />
	<label for="control">
	Click to enable Celcius.
	</label>
	
	<div id="weather-box">
	
		
		<div id="today-weather">
		<c:set var="string1" value="${forecastOne.weather}"/>
		<c:set var="string2" value="${fn:replace(string1,' ', '')}" />
			<h3>Today</h3>
 			<img src="img/weather/${string2}.png">
 			<p id="high-low">High: ${forecastOne.highTemp} Low: ${forecastOne.lowTemp}</p>
 			<p id="advisory">${advisory}</p>
		</div>
		<div id="five-day"></div>
	
	</div>

</div>




<c:import url="/WEB-INF/jsp/common/footer.jsp" />


