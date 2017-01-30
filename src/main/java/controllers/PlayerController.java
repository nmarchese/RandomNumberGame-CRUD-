package controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import data.Player;
import data.PlayerDAO;

@Controller
public class PlayerController {
	
	@Autowired
	PlayerDAO playerDAO;
	
	public void setPlayerDAO(PlayerDAO dao) {
		this.playerDAO = dao;
	}
	
	@RequestMapping(path="UpdatePlayer.do", params="newNum", method=RequestMethod.POST)
	public String removePlayer(String removeName, String submitName, String newNum, HttpSession session) {
		if (removeName == null && submitName != null) {
			int num;
			try {
				num = Integer.parseInt(newNum);
				if (num < 1) {
					num = 1;
				} else if (num > 100) {
					num = 100;
				}
			} catch (Exception e) {
				return "error";
			}
			playerDAO.updatePlayer(submitName, num);
		} else if (removeName != null) {
			playerDAO.removePlayer(removeName);
		}
		session.setAttribute("playerCount", playerDAO.getPlayers().size());
		session.setAttribute("players", playerDAO.getPlayers());
		return "game";
	}
	
	@RequestMapping(path="NewPlayer.do", method=RequestMethod.POST)
	public String updatePlayers(Player player, HttpSession session) {
		playerDAO.addPlayer(player);
		if (player.getNumber() < 0) {
			return "error";
		}
		session.setAttribute("players", playerDAO.getPlayers());
		session.setAttribute("playerCount", playerDAO.getPlayers().size());
		return "game";
	}
	
	@RequestMapping(path="play.do", method=RequestMethod.POST) 
	public String play(HttpSession session) {
		
		if (checkNums().size() > 0) {
			session.setAttribute("samePlayers", checkNums());
			return "playersHaveSameNum";
		}
		
//		int randomNumber = 10;  // tie test case
		
		int randomNumber = (int)((Math.random() * 100) + 1);
		List<Player> players = playerDAO.getPlayers();
		Player winner = players.get(0);
		Player runnerUp = players.get(1);
		int winnerDist = ensurePositive(winner.getNumber() - randomNumber);
		int runnerUpDist = ensurePositive(runnerUp.getNumber() - randomNumber);
		for (Player player : players) {
			int playerDist = ensurePositive(player.getNumber() - randomNumber);
			if (playerDist < winnerDist) {
				runnerUp = winner;
				runnerUpDist = winnerDist;
				winner = player;
				winnerDist = playerDist;
			}
		}
		
		boolean tie = false;
		for (Player player : players) {
			int playerDist = ensurePositive(player.getNumber() - randomNumber);
			if (winner.getName() != player.getName()) {
				if (playerDist == winnerDist) {
					tie = true;
					List<Player> tiedPlayers = new ArrayList<>();
					tiedPlayers.add(winner);
					tiedPlayers.add(player);
					session.setAttribute("tiedPlayers", tiedPlayers);
				}
			}
		}
		winner.setWins();
		playerDAO.writePlayersToFile();
		session.setAttribute("randomNumber", randomNumber);
		session.setAttribute("winner", winner);
		session.setAttribute("winnerDist", winnerDist);
		session.setAttribute("runnerUp", runnerUp);
		session.setAttribute("runnerUpDist", runnerUpDist);
		session.setAttribute("players", players);
		session.setAttribute("tie", tie);
		return "result";
	}
	
	public int ensurePositive(int dist) {
		if (dist < 0) {
			dist = dist * -1;
		}
		return dist;
	}
	
	public List<Player> checkNums() {
		List<Player> samePlayers = new ArrayList<>();
		List<Player> players = playerDAO.getPlayers();
		for (int i = 0; i < players.size(); i++) {
			for (int j = i+1; j < players.size(); j++) {
				if (players.get(i).getNumber() == players.get(j).getNumber()) {
					samePlayers.add(players.get(i));
					samePlayers.add(players.get(j));
				}
			}
		}
		for (Player player : samePlayers) {
			player.setNumber(0);
		}
		return samePlayers;
	}
}
