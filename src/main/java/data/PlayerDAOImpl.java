package data;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

public class PlayerDAOImpl implements PlayerDAO {
	private static final String FILE_NAME = "/WEB-INF/players.txt";
	private List<Player> players = new ArrayList<>();
	private List<Player> activePlayers;
	
	@Autowired
	private WebApplicationContext wac;
	
	@PostConstruct
	public void init() {
		try (InputStream is = wac.getServletContext().getResourceAsStream(FILE_NAME);
				BufferedReader br = new BufferedReader(new InputStreamReader(is));) {
			String line = br.readLine();
			while ((line = br.readLine()) != null) {
				String[] tokens = line.split("|");
				String name = tokens[0];
				int wins = Integer.parseInt(tokens[1]);
				players.add(new Player(name, wins));
			}
		} catch (Exception e) {
			System.err.println(e);
		}
	}
	
	@Override
	public List<Player> getPlayers() {
		activePlayers = new ArrayList<>();
		for (Player player : players) {
			if (player.isActive()) {
				activePlayers.add(player);
			}
		}
		return activePlayers;
	}
	
	@Override
	public void updatePlayer(String name, int num) {
		for (Player player : players) {
			if (player.getName().equalsIgnoreCase(name)) {
				player.setNumber(num);
			}
		}
	}
	
	@Override
	public void removePlayer(String name) {
		for (int i = 0; i < players.size(); i++) {
			Player player = players.get(i);
			if (player.getName().equalsIgnoreCase(name)) {
				player.setActive(false);
			}
		}
	}
	
	@Override
	public void addPlayer(Player p) {
		boolean newPlayer = true;
		for (Player player : players) {
			if (player.getName().equalsIgnoreCase(p.getName())) {
				player.setActive(true);
				newPlayer = false;
			}
		}
		if (newPlayer) {
			p.setActive(true);
			players.add(p);
		}
	}
	
	@Override
	public void writePlayersToFile() {
		String pathName = wac.getServletContext().getRealPath(FILE_NAME);
		try (PrintWriter bw = new PrintWriter(new FileWriter(pathName));){
			for (Player player : players) {
				bw.println(player);
			}
			bw.flush();
		} catch (IOException e) {
			System.out.println(e);
		}
	}

}
