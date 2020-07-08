package fun.dayue.po;

public class User {
	private Integer id;
	private String username;
	private String password;
	private String telephone;
	private int admin;
	
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", telephone=" + telephone + ", admin=" + admin
				+ "]";
	}

	public User(Integer id, String username, String password, String telephone,
			int admin) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.telephone = telephone;
		this.admin = admin;
	}
	public User(Integer id) {
		super();
		this.id = id;
	}
	public User(String username, String password, String telephone) {
		super();
		this.username = username;
		this.password = password;
		this.telephone = telephone;
	}
	

}
