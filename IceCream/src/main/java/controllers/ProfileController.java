package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

import connection.DatabaseConnection;
import models.ProfileModel;

public class ProfileController {
	private static Connection connection = null;
	private static PreparedStatement statement = null;
	private static ResultSet result = null;
	
	public static ProfileModel getProfile(int id) {
		ProfileModel profile = null;
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM tbl_profile WHERE user_id = ?");
			
			statement.setInt(1, id);
			
			result = statement.executeQuery();
			
			while (result.next()) {
				profile = new ProfileModel();
				
				profile.setFirstName(result.getString("firstName"));
				profile.setMiddleName(result.getString("middleName"));
				profile.setLastName(result.getString("lastName"));
				profile.setShopName(result.getString("shopName"));
				profile.setGender(result.getInt("gender"));
				profile.setDateOfBirth(result.getString("dateOfBirth"));
			}
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return profile;
	}
	
	public static boolean updateProfile(ProfileModel profile) {
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("UPDATE tbl_profile SET firstName = ?, middleName = ?, lastName = ?, shopName = ?, gender = ?, updatedAt = ? WHERE user_id = ?");
			
			statement.setString(1, profile.getFirstName());
			statement.setString(2, profile.getMiddleName());
			statement.setString(3, profile.getLastName());
			statement.setString(4, profile.getShopName());
			statement.setInt(5, profile.getGender());
			statement.setString(6, profile.getUpdatedAt());
			statement.setInt(7, profile.getUserId());
			
			statement.executeUpdate();
			
			return Boolean.TRUE;
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
			return Boolean.FALSE;
		}
	}
}
