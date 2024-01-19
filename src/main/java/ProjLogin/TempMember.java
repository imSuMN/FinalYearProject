package ProjLogin;

public class TempMember {

	private String uname, password,role,department;

	public TempMember() {
		super();
	}

	public TempMember(String uname, String password, String role, String department) {
		super();
		this.uname = uname;
		this.password = password;
		this.department = department;
		this.role = role;
	}

	public String getUname() {
		return uname;
	}
	
	public String getRole() {
		return role;
	}
	
	public String getDepartment() {
        return department;
    }

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
