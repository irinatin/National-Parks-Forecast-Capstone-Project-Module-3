<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>
		National Park Geek
	</title>
	<c:url var="stylesheetHref" value="/css/style.css" />
	<link rel="stylesheet" href="${stylesheetHref}">
</head>
<body>
	<header>
		<c:url var="logoImgSrc" value="/img/logo.png" />
		<a href="home"><img src="${logoImgSrc}" alt="National Park Geek logo"></a>
	</header>
	<nav><a href="home">Home </a><a href="surveypage"> Survey</a></nav>
	<div id="container">