<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>
		National Park Geek
	</title>
	<c:url var="stylesheetHref" value="/css/flybynight.css" />
	<link rel="stylesheet" href="${stylesheetHref}">
</head>
<body>
	<header>
		<c:url var="logoImgSrc" value="/img/flybynightlogo.png" />
		<img src="${logoImgSrc}" alt="Fly By Night Bank">
		<p class="motto">At Fly By Night, we treat your money as if it's our own.</p>
	</header>
	<nav>
		<ul>
			<c:url var="homePageHref" value="/" />
			<li><a href="${homePageHref}">Home</a></li>
			<c:url var="checkingAcctHref" value="/checkingApplication/personalInformationInput" />
			<li><a href="${checkingAcctHref}">Checking</a>
			<c:url var="stocksHref" value="/stocks" />
			<li><a href="${stocksHref}">Stocks</a></li>
			<c:url var="mortgageHref" value="/mortgageCalculatorInput" />
			<li><a href="${mortgageHref}">Mortgage</a></li>		
		</ul>
	</nav>
	<div id="container" class="wrapper">