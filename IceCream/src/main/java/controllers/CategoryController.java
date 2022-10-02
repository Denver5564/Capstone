package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

import connection.DatabaseConnection;
import models.CategoryModel;

public class CategoryController {
	private static Connection connection = null;
	private static PreparedStatement statement = null;
	private static ResultSet result = null;
	
	public static CategoryModel getCategory(int id) {
		CategoryModel category = null;
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM tbl_category WHERE id = ?");
			
			statement.setInt(1, id);
			
			result = statement.executeQuery();
			
			while (result.next()) {
				category = new CategoryModel();
				
				category.setCategoryName(result.getString("cat_name"));
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return category;
	}
}
