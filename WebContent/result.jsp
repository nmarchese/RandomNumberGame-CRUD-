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
	<h2>Results</h2>
	<p><span class="header"> Random Number: </span><c:out value="${randomNumber}"/> </p>
	<br>
	<c:if test="${tie}">
		<h3>Tie:</h3>
		<p>
			<span class="bold">Players:</span>
			<c:forEach var="player" items="${tiedPlayers}">
				<c:out value="${player.name}"/>(<c:out value="${player.number}"/>), 
			</c:forEach>
			tied for the win.
		</p>
		<p><span class="header"> Distance Off: </span><c:out value="${winnerDist}"/> </p>
		<p> To tie-break, return to click 'Tie-Break' below and remove all players not involved in tie. </p>
		<form action="game.jsp" method="POST">
			<input type="submit" value="Tie Break"/>
		</form>
		<br>
	</c:if>
	<c:if test="${!tie}">
		<p><span class="header"> Winner: </span><c:out value="${winner.name}"/> </p>
		<p><span class="header"> Number: </span><c:out value="${winner.number}"/> </p>
		<p><span class="header"> Distance Off: </span><c:out value="${winnerDist}"/> </p>
	</c:if>
	<br>
	<p><span class="header"> Runner Up: </span><c:out value="${runnerUp.name}"/> </p>
	<p><span class="header"> Number: </span><c:out value="${runnerUp.number}"/> </p>
	<p><span class="header"> Distance Off: </span><c:out value="${runnerUpDist}"/> </p>
	<br><br>
	<table>
		<thead class="header"> Players: </thead>
		<tr>
			<th>Name</th><th>Number</th><th>Total Wins</th>
		</tr>
		<c:forEach var="player" items="${players}">
			<tr>
				<td><c:out value="${player.name}"/></td>
				<td><c:out value="${player.number}"/></td>
				<td><c:out value="${player.wins}"/></td>
			</tr>
		</c:forEach>
	</table>
	<form action="game.jsp" method="POST">
		<input type="submit" value="Return to Players Screen"/>
	</form>
	<!--
		TODO style
	-->
</div>
</body>
</html>