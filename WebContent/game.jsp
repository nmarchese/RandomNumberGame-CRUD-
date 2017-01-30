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
	<h2>Random Number Game</h2>
	<h3>Players:</h3>
	<div class="table">
		<table>
			<tr>
				<th>Name</th>
				<th colspan="2"> Change Number</th>
				<th>Remove</th>
			</tr>
			<c:forEach var="player" items="${players}">
				<form action="UpdatePlayer.do" method="POST">
					<tr>
						<td><c:out value="${player.name}"/></td>
						<td><input type="password" name="newNum"/></td>
						<td><button name="submitName" value="${player.name}">Change Number</button></td>
						<td><button name="removeName" value="${player.name}">Remove</button></td>
					</tr>
				</form>
			</c:forEach>
		</table>
	</div>
	<br>
	<h3>Add Player:</h3>
	<form class="addPlayerForm" action="NewPlayer.do" method="POST">
		Name: <input type="text" name="name"/>
		Number: <input type="password" name="number"/>
		<input type="submit" value="Add Player"/>
	</form>
	<br>
	<form action="play.do" method="POST">
	<c:if test="${playerCount >= 2}">
		<input type="submit" value="Play"/>
	</c:if>
	<c:if test="${playerCount < 2 || playerCount == null}">
		<input type="button" value="Play" disabled/>
	</c:if>
	</form>
</div>
</body>
</html>