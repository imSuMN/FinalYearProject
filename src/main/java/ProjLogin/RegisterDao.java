package ProjLogin;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

public class RegisterDao {

	private String dbUrl = "jdbc:mysql://localhost:3306/finalyearproject";
	private String dbUname = "root";
	private String dbPassword = "Gaurav@123";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";

	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	public String insert(Member myuser) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "insert into myuser values(?,?)";

		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, myuser.getUname());
			ps.setString(2, myuser.getPassword());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not entered";
		}
		return result;
	}
	
	
	public String insertTemp(TempMember myuser) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "insert into myusertemp values(?,?,?,?)";

		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, myuser.getUname());
			ps.setString(2, myuser.getPassword());
			ps.setString(3, myuser.getRole());
			ps.setString(4, myuser.getDepartment());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not entered";
		}
		return result;
	}
	
	public void removeTemp(String myuser) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "delete from myusertemp where uname=?";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, myuser);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not entered";
		}
	}
	
	
	public void addPerm(String myuser, int role) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sq = "select * from myusertemp where uname='"+myuser+"'";
		String sql = "delete from myusertemp where uname='"+myuser+"'";
		String sql2 = "insert into designation values(?,"+role+")";
		PreparedStatement ps;
		PreparedStatement ps1;
		PreparedStatement ps2;
		try {
			ps1 = con.prepareStatement(sq);
			ps = con.prepareStatement(sql);
			ps2 = con.prepareStatement(sql2);
			//ps.setString(1, myuser);
			//ps1.setString(1, myuser);
			ps2.setString(1, myuser);
			ResultSet rss = ps1.executeQuery();
			rss.next();
			System.out.println(rss.getString(1));
			Member myusr = new Member(rss.getString(1),rss.getString(2));
			insert(myusr);
			ps2.executeUpdate();
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<TempMember> getTempUsers() {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "select * from myusertemp";
		ArrayList<TempMember> temp = new ArrayList<TempMember>();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnsNumber = metaData.getColumnCount();
			while(rs.next()) {
				TempMember tempMember = new TempMember(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
				temp.add(tempMember);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not entered";
		}
		return temp ;
	}

}
