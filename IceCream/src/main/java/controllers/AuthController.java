package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

import connection.DatabaseConnection;
import models.UserModel;

public class AuthController {
	private static Connection connection = null;
	private static PreparedStatement statement = null;
	private static ResultSet result = null;
	
	public static UserModel Authenticate(UserModel user) {
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM tbl_user WHERE username = ? OR email = ? AND password = ?");
			
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getUsername());
			statement.setString(3, user.getPassword());
			
			result = statement.executeQuery();
			if (result.next()) {
				user = new UserModel();
				
				user.setId(result.getInt("id"));
				user.setUsername(result.getString("username"));
				user.setPassword(result.getString("password"));
				user.setUsertype(result.getInt("usertype"));
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return user;
	}
}
