package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import connection.DatabaseConnection;
import models.UserModel;

public class UserController {
	private static Connection connection = null;
	private static PreparedStatement statement = null;
	private static ResultSet result = null;
	
	public static boolean SaveUser(UserModel user) {		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("INSERT INTO tbl_user (username, password, usertype)"
					+ "vALUES (?, ?, ?)");
			
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getPassword());
			statement.setInt(3, user.getUsertype());
			
			return statement.execute();
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
			return Boolean.FALSE;
		}
	}
	
	public static UserModel getUser(int id) {
		UserModel user = null;
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM tbl_user WHERE id = ?");
			
			statement.setInt(1,  id);
			result = statement.executeQuery();
			
			while (result.next()) {
				user = new UserModel();
				
				user.setId(result.getInt("id"));
				user.setUsername(result.getString("username"));
				user.setEmail(result.getString("email"));
				user.setPassword(result.getString("password"));
				user.setOldPassword(result.getString("old_password"));
				user.setUsertype(result.getInt("usertype"));
				user.setSqlDate(result.getDate("createdAt"));
				user.setFirstLogin(result.getInt("isFirstLogin"));
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		return user;
	}
	
	public static UserModel getJoinedDate(int id) {
		UserModel user = null;
		int value1 = 0;
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT Month(curdate())-MONTH(createdAt) as join123 from tbl_user where id = ?");
			
			statement.setInt(1,  id);
			result = statement.executeQuery();
			
			while (result.next()) {
				user = new UserModel();
				
				if(result.getInt("join123")==0) {
					value1 = 1;
				}
				
				else {
					value1=result.getInt("join123");
				}
				
				user.setJoinedDate(value1);
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		return user;
	}
	
	public static List<UserModel> getAllUsers() {
		List<UserModel> userList = new ArrayList<UserModel>();
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM tbl_user");
			result = statement.executeQuery();
			
			while (result.next()) {
				UserModel user = new UserModel();
				user.setId(result.getInt(0));
				user.setUsername(result.getString(1));
				user.setPassword(result.getString(2));
				
				userList.add(user);
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return userList;
	}
	
	public static boolean updateUser(UserModel user) {
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("UPDATE tbl_user SET email = ? WHERE id = ?");
			
			statement.setString(1, user.getEmail());
			statement.setInt(2, user.getId());
			
			statement.executeUpdate();
			
			return Boolean.TRUE;
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
			return Boolean.FALSE;
		}
	}
}
