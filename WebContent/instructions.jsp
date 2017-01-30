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
<a class="instructions" href="game.jsp">Back to Game</a>
<div class="content">
	<h2>Random Number Game</h2>
	<h3>Instructions:</h3>
	<p>To play, each player must enter their name and a number between 1 and 100.The game can be played by clicking
	the 'Play' button at the bottom of the page at any time, once at least 2 players have entered.<br><br>
	When 'Play' is clicked a random number between 1 and 100 is generated. The winner is the person who chose the
	number closest to the number that is generated.<br><br>
	Players can change their number at any time before clicking 'Play', by inputing a new number in the field next to their
	name and clicking 'Change Number'. If a number that is less than 1 or greater than 100 gets through, it will
	be set to 1 or 100 respectively.<br><br>
	If two players have chosen the same number, a message will be displayed when 'Play' is clicked. Both players with the
	same number will have their numbers reset to 0 and must choose a new number before attempting to play again.<br><br>
	In the event of a tie a message will be displayed and to choose a definitive winner the user must navigate back to the
	game page and remove all other players not involved in the tie. Players may change their number before the tie-breaker.</p>
</div>
</body>
</html>