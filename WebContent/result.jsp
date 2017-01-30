<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./rngCSS.css">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab|Russo+One" rel="stylesheet"><title>Random Number Game</title>
</head>
<body>
<div class="content">
	<h2>Results</h2>
	<h3><span class="header"> Random Number:<span class="space">-</span></span><c:out value="${randomNumber}"/> </h3>
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
		<h4><span class="header"> Winner:<span class="space">-</span></span></span><c:out value="${winner.name}"/> </h4>
		<p><span class="header"> Number:<span class="space">-</span></span></span><c:out value="${winner.number}"/> </p>
		<p><span class="header"> Distance Off:<span class="space">-</span></span></span><c:out value="${winnerDist}"/> </p>
	</c:if>
	<h4><span class="header"> Runner Up:<span class="space">-</span></span></span><c:out value="${runnerUp.name}"/> </h4>
	<p><span class="header"> Number:<span class="space">-</span></span></span><c:out value="${runnerUp.number}"/> </p>
	<p><span class="header"> Distance Off:<span class="space">-</span></span></span><c:out value="${runnerUpDist}"/> </p>
	<br>
	<h4><span class="header"> Players: </span></h4>
	<table class="table2">
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
	<br>
	<form action="game.jsp" method="POST">
		<input type="submit" value="Return to Players Screen"/>
	</form>
	<!--
		TODO style
	-->
</div>
</body>
</html>