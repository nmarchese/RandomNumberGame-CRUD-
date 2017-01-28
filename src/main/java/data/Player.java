package data;

public class Player {
	private String name;
	private int wins;
	private boolean active;
	private int number;
	
	public Player(String name, int wins) {
		this.name = name;
		this.wins = wins;
	}
	
	public Player() {
	}

	public String getName() {
		return name;
	}

	public int getNumber() {
		return number;
	}
	
	public int getWins() {
		return wins;
	}
	
	public boolean isActive() {
		return active;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public void setNumber(int number) {
		this.number = number;
	}
	public void setNumber(String number) {
		try {
			this.number = Integer.parseInt(number);
		} catch (NumberFormatException e) {
			this.number = -1;
		}
	}
	
	public void setWins() {
		this.wins++;
	}
	
	public void setActive(boolean active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return name + "|" + wins;
	}
	
	
	
}
