package manage;

public class User {
	private String name;
	private String password;
	private String role;	
	
	User(){}
	
	public User(String name,String password,String role){
		this.name = name;
		this.password = password;
		this.role = role;				
	}
		
	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String getpassword() {
		return password;
	}

	public void setpassword(String password) {
		this.password = password;
	}

	public String getrole() {
		return role;
	}

	public void setrole(String role) {
		this.role = role;
	}
	
	public void showMenu(){
	}
}
