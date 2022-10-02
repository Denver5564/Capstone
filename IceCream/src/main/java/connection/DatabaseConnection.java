package connection;

import java.sql.*;

public class DatabaseConnection {
	
	static String DRIVER = "com.mysql.cj.jdbc.Driver";
	static String CONNECTION_URL = "jdbc:mysql://localhost:3306/ice_cream_store?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	static String USERNAME = "root";
	static String PASSWORD = "0000";
	
	public static Connection getConnection() {
		Connection connection = null;
		
		try {
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return connection;
	}
}
