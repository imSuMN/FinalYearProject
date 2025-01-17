package com.marvel.journals;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import ProjMyDetails.myDetailsDaw;

public class journalsDaw {

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

		Properties properties = new Properties();
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

	public List<journalData> getAllInfo() {

		List<journalData> journalData = new ArrayList<journalData>();
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "select * from journals";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				journalData pd = new journalData();
				pd.setTitleOfPaper(rs.getString("titleOfPaper"));
				pd.setAuthor(rs.getString("author"));
				pd.setDept(rs.getString("dept"));
				pd.setNameOfJournal(rs.getString("nameOfJournal"));
				pd.setYearOfPublication(rs.getString("yearOfPublication"));
				pd.setIssn(rs.getString("issn"));
				pd.setLink(rs.getString("link"));
				journalData.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return journalData;
	}

	public String insert(journalData jourData) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "insert into journals values(?,?,?,?,?,?,?)";
		// String Year = "";
		String titleOfPaper = jourData.getTitleOfPaper();
		String author = jourData.getAuthor();
		String dept = jourData.getDept();
		String nameOfJournal = jourData.getNameOfJournal();
		String yearOfpublication = jourData.getYearOfPublication();
		String issn = jourData.getIssn();
		String link = jourData.getLink();
//		int year = Integer.parseInt(yearOfpublication.substring(0, 4));
//		int month = Integer.parseInt(yearOfpublication.substring(5, 7));
//		if (month > 6) {
//			Year = Integer.toString(year) + "-" + Integer.toString(year + 1);
//		} else {
//			Year = Integer.toString(year - 1) + "-" + Integer.toString(year);
//		}
		PreparedStatement ps;
		try {
//			ps = con.prepareStatement("select * from journals where link ='" + link + "'");
//			ResultSet rs = ps.executeQuery();
//			if (rs.next()) {
//				result = "";
//				return result;
//			}
			ps = con.prepareStatement(sql);
			ps.setString(1, titleOfPaper);
			ps.setString(2, author);
			ps.setString(3, dept);
			ps.setString(4, nameOfJournal);
			ps.setString(5, yearOfpublication);
			ps.setString(6, issn);
			ps.setString(7, link);
			ps.executeUpdate();
			System.out.println(sql);
			System.out.println(ps);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not entered";
		}

		return result;
	}

	public void delete(String jname) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from journals where issn=?");
			ps.setString(1, jname);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}

		return;
	}

	public String update(journalData jourData, journalData jourDataPrev) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data updated successfully";
		String sql = "update journals set titleOfPaper=?, author=?, dept=?, nameOfJournal=?, yearOfPublication=?, issn=?, link=? where titleOfPaper= '"
				+ jourDataPrev.getTitleOfPaper() + "' and author= '" + jourDataPrev.getAuthor() + "' and dept= '"
				+ jourDataPrev.getDept() + "' and nameOfJournal= '" + jourDataPrev.getNameOfJournal()
				+ "' and yearOfPublication= '" + jourDataPrev.getYearOfPublication() + "' and issn= '"
				+ jourDataPrev.getIssn() + "' and link= '" + jourDataPrev.getLink() + "'";
		// String Year = "";
		String titleOfPaper = jourData.getTitleOfPaper();
		String author = jourData.getAuthor();
		String dept = jourData.getDept();
		String nameOfJournal = jourData.getNameOfJournal();
		String yearOfpublication = jourData.getYearOfPublication();
		String issn = jourData.getIssn();
		String link = jourData.getLink();
//		int year = Integer.parseInt(yearOfpublication.substring(0, 4));
//		int month = Integer.parseInt(yearOfpublication.substring(5, 7));
//		if (month > 6) {
//			Year = Integer.toString(year) + "-" + Integer.toString(year + 1);
//		} else {
//			Year = Integer.toString(year - 1) + "-" + Integer.toString(year);
//		}

		PreparedStatement ps;
		try {
			if (!link.equals(jourDataPrev.getLink())) {
				System.out.println("1");
				ps = con.prepareStatement("select * from journals where link ='" + link + "'");
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					result = "";
					return result;
				}
			}

			ps = con.prepareStatement(sql);
			ps.setString(1, titleOfPaper);
			ps.setString(2, author);
			ps.setString(3, dept);
			ps.setString(4, nameOfJournal);
			ps.setString(5, yearOfpublication);
			ps.setString(6, issn);
			ps.setString(7, link);
			ps.executeUpdate();
			System.out.println(sql);
			System.out.println(ps);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not updated";
		}

		return result;
	}

}
