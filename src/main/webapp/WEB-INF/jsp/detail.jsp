<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/jsp/common/header.jsp" />



<img src="/img/${park.parkCode}.png" class="detail-image">

<div class="detail-text-block">

	<h2>${park.parkName}</h2>
	
	<h3>Considered the best park in ${park.state}!</h3>
	
	<p>${park.description}</p>

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
	
		<!--I don't want to build this until I've talked through how we're 
		going to format the forecast stuff when we pass it to the view-->
		<div id="today-weather">
			<h3>Today</h3>
			<p>High: ${forecast.highTemp} Low: ${forecast.lowTemp}</p>
		</div>
		<div id="five-day"></div>
	
	</div>

</div>




<c:import url="/WEB-INF/jsp/common/footer.jsp" />


