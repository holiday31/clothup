package clothup;

public class User {
	int id;
	String userId;
	String password;
	String name;
	String email;
	
	public User(String userid, String name, String password, String email) {
        this.userId = userid;
        this.name = name;
        this.password = password;
        this.email = email;

    }
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
