package ProjMyDetails;

import java.io.InputStream;
import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import ProjLogin.TempMember;

public class myDetailsDaw {

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
		// Object filePath = "./src/main/java/configsetting.properties";
		Connection con = null;
		// final Properties props = new Properties();
//		try {
//			props.load(new FileInputStream((String) filePath));
//			String dbUrl = props.getProperty("dbUrl");
//			String dbUname = props.getProperty("dbUname");
//			String dbPassword = props.getProperty("dbPassword");
//			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
//		} catch (FileNotFoundException e1) {
//			e1.printStackTrace();
//		} catch (IOException e1) {
//			e1.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}

		Properties properties = new Properties();

		// Use the class loader to load the resource
		try (InputStream inputStream = myDetailsDaw.class.getClassLoader()
				.getResourceAsStream("configsetting.properties")) {
			if (inputStream != null) {
				properties.load(inputStream);
				String dbUrl = properties.getProperty("dbUrl");
				String dbUname = properties.getProperty("dbUname");
				String dbPassword = properties.getProperty("dbPassword");
				con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
				// Now you can access properties using properties.getProperty("key")
			} else {
				System.out.println("Unable to locate the properties file.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public MyDetailsData getAllInfo(String user) {

		loadDriver(dbDriver);
		Connection con = getConnection();

		String sql = "select * from mydetails where uname = '" + user + "'";
		PreparedStatement ps;
		MyDetailsData mtd = new MyDetailsData();
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				mtd.setfName(rs.getString("fName"));
				if (rs.getString("mName") == null) {
					mtd.setmName("");
				} else {
					mtd.setmName(rs.getString("mName"));
				}
				mtd.setlName(rs.getString("lName"));
				mtd.setaName(rs.getString("aName"));
				mtd.setPhn(rs.getString("phn"));
				// mtd.setuName(rs.getString("uName"));
				mtd.setudob(rs.getString("udob"));
				mtd.setTcsionId(rs.getString("tcsionId"));
				mtd.setDesignation(rs.getString("designation"));
				mtd.setSubject(rs.getString("subjects"));
				mtd.setHighestQualification(rs.getString("highestQualification"));
				mtd.setAnyOther(rs.getString("anyOther"));
				mtd.setTeachingExp(rs.getString("teachingExp"));
				mtd.setTeachingMethods(rs.getString("teachingMethods"));
				mtd.setTechnologyUses(rs.getString("technologyUses"));
				mtd.setSmd(rs.getString("smd"));
				mtd.setCeqt(rs.getString("ceqt"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mtd;
	}

	public String insert(MyDetailsData myDetailsData) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "insert into mydetails values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, myDetailsData.getfName());
			ps.setString(2, myDetailsData.getmName());
			ps.setString(3, myDetailsData.getlName());
			ps.setString(4, myDetailsData.getuName());
			ps.setString(5, myDetailsData.getaName());
			ps.setString(6, myDetailsData.getPhn());
			ps.setString(7, myDetailsData.getudob());
			ps.setString(8, myDetailsData.getTcsionId());
			ps.setString(9, myDetailsData.getDesignation());
			ps.setString(10, myDetailsData.getSubject());
			ps.setString(11, myDetailsData.getHighestQualification());
			ps.setString(12, myDetailsData.getAnyOther());
			ps.setString(13, myDetailsData.getTeachingExp());
			ps.setString(14, myDetailsData.getTeachingMethods());
			ps.setString(15, myDetailsData.getTechnologyUses());
			ps.setString(16, myDetailsData.getSmd());
			ps.setString(17, myDetailsData.getCeqt());

			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not entered";
		}
		return result;
	}

	public int update(MyDetailsData myDetailsData, String user) {
		int status = 0;
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "update mydetails set fName=?,mName=?,lName=?,aName=?,phn=?,udob=?,tcsionId=?,designation=?,subjects=?,highestQualification=?,anyOther=?,teachingExp=?,teachingMethods=?,technologyUses=?,smd=?,ceqt=? where uname = '"
				+ user + "'";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, myDetailsData.getfName());
			ps.setString(2, myDetailsData.getmName());
			ps.setString(3, myDetailsData.getlName());
			ps.setString(4, myDetailsData.getaName());
			ps.setString(5, myDetailsData.getPhn());
			ps.setString(6, myDetailsData.getudob());
			ps.setString(7, myDetailsData.getTcsionId());
			ps.setString(8, myDetailsData.getDesignation());
			ps.setString(9, myDetailsData.getSubject());
			ps.setString(10, myDetailsData.getHighestQualification());
			ps.setString(11, myDetailsData.getAnyOther());
			ps.setString(12, myDetailsData.getTeachingExp());
			ps.setString(13, myDetailsData.getTeachingMethods());
			ps.setString(14, myDetailsData.getTechnologyUses());
			ps.setString(15, myDetailsData.getSmd());
			ps.setString(16, myDetailsData.getCeqt());

			status = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	
	
	public ArrayList<String> getTempUsers() {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "select * from myusertemp";
		ArrayList<String> temp = new ArrayList<String>();
		PreparedStatement ps;
		
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnsNumber = metaData.getColumnCount();
			
			while (rs.next()) {
				String tempMember = rs.getString(1)+';'+ rs.getString(2)+';'+ rs.getString(3)+';'+
						rs.getString(4);
				temp.add(tempMember);
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "";
		}
		return temp;
		
	}
	
	
	public ArrayList<String> getRoles() {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "select * from roles";
		ArrayList<String> temp = new ArrayList<String>();
		PreparedStatement ps;
		
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnsNumber = metaData.getColumnCount();
			
			while (rs.next()) {
				String tempMember = rs.getString(1)+';'+ rs.getString(2);
				temp.add(tempMember);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return temp;
		
	}

}
