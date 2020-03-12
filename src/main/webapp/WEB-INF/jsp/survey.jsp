<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<form action="survey" method="post">
<span>
<label for="parkCode">First Seed :</label>
<select name="seedOne" id="seedOne">
<c:forEach var="park" items="parks">
	<option value="${park.parkCode}">${park.parkName}</option>
</c:forEach>
</select>




<c:import url="/WEB-INF/jsp/common/footer.jsp" />