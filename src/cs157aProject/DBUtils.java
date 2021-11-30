package cs157aProject;

import java.sql.*;
import java.util.ArrayList;

import cs157aProject.model.Account;
import cs157aProject.model.Course;
import cs157aProject.model.Preference;
import cs157aProject.model.Profile;
import cs157aProject.model.StudentAccount;

public class DBUtils {

	public static Account findUser(Connection conn, String username, String password) throws SQLException {
		String sql = "SELECT * FROM account WHERE account.username = '" + username + "' AND password = '" + password + "'";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()){
			int id = rs.getInt("accountID");
			Account user = new Account();
			user.setAccountID(id);
			user.setUsername(username);
			user.setPassword(password);
			return user;
		}
		return null;
	}
	
	public static void createAccount(Connection conn, String username, String password) throws SQLException{
		String sql = "SELECT max(accountID) AS maxID FROM account;";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		int id = 0;
		if (rs.next()) {
			id = rs.getInt("maxID") + 1;
		}

		sql = "INSERT INTO account VALUES (" + id + ", '" + username + "', '" + password + "');";
		Statement stmt2 = conn.createStatement();
		stmt2.executeUpdate(sql);
	}
	
	//by accountId
	public static StudentAccount findStudentAccount(Connection conn, int accountID) throws SQLException{
		String sql = "SELECT * FROM studentaccount WHERE accountID = " + accountID;
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			StudentAccount stuAcc = new StudentAccount();
			stuAcc.setAccountID(accountID);
			stuAcc.setCampusID(rs.getInt("campusID"));
			stuAcc.setStudentName(rs.getString("studentName"));
			return stuAcc;
		}
		return null;
	}
	
	//by campusID
	public static String campusLookup(Connection conn, int campusID) throws SQLException
	{
		String sql = "SELECT * FROM campus WHERE campusID = " + campusID;
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			return rs.getString("campus_name");
		}
		return null;
	}
	
	//by profile/studentID
	public static int[] findEnrollments(Connection conn, int profileID) throws SQLException{
		String sql = "SELECT courseID FROM enrollment WHERE studentID = " + profileID;
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		ArrayList<Integer> courses = new ArrayList<Integer>();
		while (rs.next()) {
			courses.add(rs.getInt("courseID"));
		}
		
		int result[] = new int[courses.size()];
		
		for (int i = 0; i < courses.size(); i++) {
			result[i] = courses.get(i);
		}
		
		return result;
	}
	
	//find profileID from accountID
	public static int findProfileID(Connection conn, int accountID) throws SQLException{
		String sql = "SELECT profileID FROM has WHERE accountID = " + accountID;
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			return rs.getInt("profileID");
		}
		return 0;
	}
	
	//find accountID from profileID
	public static int findAccountID(Connection conn, int profileID) throws SQLException{
		String sql = "SELECT accountID FROM has WHERE profileID = " + profileID;
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			return rs.getInt("accountID");
		}
		return 0;
	}
	
	//by courseID
	public static String findCourseName(Connection conn, int courseID) throws SQLException{
		String sql = "SELECT * FROM course WHERE courseID = " + courseID;
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			return rs.getString("course_name");
		}
		return null;
	}
	
	public static int findCourseID(Connection conn, String courseName) throws SQLException{
		String sql = "SELECT * FROM course WHERE course_name = '" + courseName + "'";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			return rs.getInt("courseID");
		}
		return 0;
	}
	
	
	public static void updateEnrolls(Connection conn, int[] courseID, int studentID, int campusID) throws SQLException{
		String sql = "DELETE FROM enrollment WHERE studentID = " + studentID;
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		
		//sql = "INSERT INTO enrollment VALUES(?,?,?)";
		PreparedStatement pst = conn.prepareStatement("INSERT INTO enrollment VALUES(?,?,?)");
		for (int id : courseID) {
			pst.setInt(1, studentID);
			pst.setInt(2, id);
			pst.setInt(3, campusID);
			pst.executeUpdate();
		}
		
		
	}
	
	public static String[] getCourseList(Connection conn) throws SQLException{
		String sql = "SELECT course_name FROM course";
		
		ArrayList<String> al = new ArrayList<String>();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
			al.add(rs.getString("course_name"));
		}
		
		String[] result = new String[al.size()];
		
		for (int i = 0; i < result.length; i++) {
			result[i] = al.get(i);
		}
		return result;
	}
	
	//use with sql query generated in FilterServlet, give profileIDs
	public static int[] filterWithQuery(Connection conn, String sql) throws SQLException{
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		ArrayList<Integer> al = new ArrayList<Integer>();
		while(rs.next()) {
			al.add(rs.getInt("profileID"));
		}
		
		int[] result = new int[al.size()];
		for (int i = 0; i < result.length; i++) {
			result[i] = al.get(i);
		}
		return result;
	}
	
	
	public static Preference findPreference(Connection conn, int profileID) throws SQLException{
		String sql = "SELECT * FROM preferences WHERE profileID = " + profileID;
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			Preference p = new Preference();
			p.setProfileID(profileID);
			p.setLocation(rs.getString("location"));
			p.setOnlineOpt(rs.getString("onlineOption"));
			return p;
		}
		return null;
	}
	
	public static Profile findProfile(Connection conn, int profileID) throws SQLException{
		String sql = "SELECT * FROM profile WHERE profileID = " + profileID;
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			Profile pro = new Profile();
			pro.setProfileID(profileID);
			pro.setDescription(rs.getString("description"));
			return pro;
		}
		return null;
		
	}
}
