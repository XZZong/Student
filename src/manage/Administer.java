package manage;

public class Administer extends User{	
	Administer(){}
	
	public Administer(String name,String password,String role){
		setname(name);	
		setpassword(password);
		setrole(role);
	}		
}
