<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<c:forEach var="park" items="${parks}">

	<div <c:if test="${park.numberOfSurveys < 2}">style="display:none"</c:if> class="home-park-block">

		<a href="parkDetails?parkCode=${park.parkCode}"> 
			<c:set var="imageString" value="${park.parkCode}"/>
			<img src="img/parks/${fn:toLowerCase(imageString)}.jpg">
		</a>


		<div class="text-block">

			<h2 class="park-title">
				<a href="parkDetails?parkCode=${park.parkCode}"> 
						${park.parkName} has received ${park.numberOfSurveys} favorites!
				</a>
			</h2>


			<p class="park-description">
				<a href="parkDetails?parkCode=${park.parkCode}"> 
					${park.parkDescription}
				</a>
			</p>


		</div>

	</div>

</c:forEach>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />