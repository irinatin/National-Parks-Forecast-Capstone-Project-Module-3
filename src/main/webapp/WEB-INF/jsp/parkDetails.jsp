<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  


<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div id="bigPicHolder">
<img id="bigPic" src="img/parks/${fn:toLowerCase(park.parkCode)}.jpg" class="detail-image">	
</div>
	
	<div id="hotdog"
>	<div id="quoteHolder">
		<p id="quote">"${park.quote}"</p>
	</div>
	<div id="attribution">
		<p id="elephant"> &nbsp; &nbsp;-&nbsp;${park.quoteSource}</p>
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
		<c:set var="string1" value="${forecastOne.weather}"/>
		<c:set var="string2" value="${fn:replace(string1,' ', '')}" />
			<h3>Today</h3>
 			<img src="img/weather/${string2}.png">
 			<p id="high-low">High: ${forecastOne.highTemp} Low: ${forecastOne.lowTemp}</p>
 			<c:url var="formAction" value="parkDetails?parkCode=${park.parkCode}"/> 
 				<%-- <form method="GET" action= "${formAction}">
 				<input type="checkbox" name="control" id="control" />
 				<c:when test="control">
 			<p> id="high-low">High:${((forecastOne.highTemp -32) / 1.8)} Low: ${((forecastOne.lowTemp -32) / 1.8)}  </p>
 				</c:when>
 				<c:otherwise>
 				<p id="high-low">High: ${forecastOne.highTemp} Low: ${forecastOne.lowTemp}</p>
 				</c:otherwise>
 				
 				</form> --%>
 				
 				
 				
				<label for="control">
				Click to enable Celcius.
				</label>
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
					<c:set var="string1" value="${forecastTwo.weather}"/>
					<c:set var="string2" value="${fn:replace(string1,' ', '')}" />
				 	<img src="img/weather/${string2}.png">
				 	<p id="high">High: ${forecastTwo.highTemp}</p>
				 	<p id="low">Low: ${forecastTwo.lowTemp}</p>
				 		
			</div>
			
			<div class="daily">
					<c:set var="string1" value="${forecastThree.weather}"/>
					<c:set var="string2" value="${fn:replace(string1,' ', '')}" />
				 	<img src="img/weather/${string2}.png">
				 	<p id="high">High: ${forecastThree.highTemp}</p>
				 	<p id="low">Low: ${forecastThree.lowTemp}</p>
				 		
			</div >
			
			<div class="daily">
					<c:set var="string1" value="${forecastFour.weather}"/>
					<c:set var="string2" value="${fn:replace(string1,' ', '')}" />
				 	<img src="img/weather/${string2}.png">
				 	<p id="high">High: ${forecastFour.highTemp}</p>
				 	<p id="low">Low: ${forecastFour.lowTemp}</p>
				 		
			</div>
			
			<div class="daily">
					<c:set var="string1" value="${forecastFive.weather}"/>
					<c:set var="string2" value="${fn:replace(string1,' ', '')}" />
				 	<img src="img/weather/${string2}.png">
				 	<p id="high">High: ${forecastFive.highTemp}</p>
				 	<p id="low">Low: ${forecastFive.lowTemp}</p>
				 	
				 	
				 		
			</div>
		
		</div>
		</div>
	</div>


<div>
    <label for="toggle">Toggle</label>
    
    <input type="checkbox" id="toggle" class="visually-hidden">

    <div class="control-me"></div>
</div>




<c:import url="/WEB-INF/jsp/common/footer.jsp" />


