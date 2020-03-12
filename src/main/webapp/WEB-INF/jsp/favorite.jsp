<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />



<c:forEach items="${parks}" var="park">
	<c:set var=parks value="${park.parkName}" />
	<img src="<c:url value="img/${park.parkCode}.jpg"/>" />



</c:forEach>











<c:import url="/WEB-INF/jsp/common/footer.jsp" />
