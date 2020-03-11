<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<c:forEach var="park" items="${parks}">

	<div class="home-park-block">

		<a href="/detail?parkcode=${park.parkCode}"> 
			<img src="/img/${park.parkCode}.png">
		</a>


		<div class="text-block">

			<h2 class="park-title">
				<a href="/detail?parkcode=${park.parkCode}"> 
					${park.parkName} 
				</a>
			</h2>


			<p class="park-description">
				<a href="/detail?parkcode=${park.parkCode}"> 
					${park.parkDescription}
				</a>
			</p>


		</div>

	</div>

</c:forEach>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />