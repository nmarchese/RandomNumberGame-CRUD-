<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./rngCSS.css">
<title>Random Number Game</title>
</head>
<body>
<div class="content">
	<h2>Error:</h2>
	Players: 
	<c:forEach var="player" items="${samePlayers}">
		<c:out value="${player.name}"/>, 
	</c:forEach>
	chose the same number.
	<br>
	Each of their numbers have been reset to 0, please reset each on the previous screen before continuing.
	<form action="game.jsp" method="POST">
		<input type="submit" value="Return"/>
	</form>
</div>
</body>
</html>