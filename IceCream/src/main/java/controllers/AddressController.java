package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

import connection.DatabaseConnection;
import models.AddressModel;

public class AddressController {
	private static Connection connection = null;
	private static PreparedStatement statement = null;
	private static ResultSet result = null;
	
	public static AddressModel getAddress(int id) {
		AddressModel address = null;
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM tbl_address WHERE user_id = ?");
			
			statement.setInt(1, id);
			
			result = statement.executeQuery();
			
			while(result.next()) {
				address = new AddressModel();
				
				address.setUserId(result.getInt("user_id"));
				address.setCellphone(result.getString("cellphone"));
				address.setTelephone(result.getString("telephone"));
				address.setAddress(result.getString("address"));
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return address;
	}
	
	public static boolean updateAddress(AddressModel address) {
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("UPDATE tbl_address SET cellphone = ? WHERE user_id = ?");
			
			statement.setString(1, address.getCellphone());
			statement.setInt(2, address.getUserId());
			
			statement.executeUpdate();
			
			return Boolean.TRUE;
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
			return Boolean.FALSE;
		}
	}
}
