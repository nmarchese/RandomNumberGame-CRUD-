package data;

import java.util.List;

public interface PlayerDAO {
	public List<Player> getPlayers();
	public void addPlayer(Player player);
	public void removePlayer(String name);
	public void updatePlayer(String name, int num);
	public void writePlayersToFile();
}
