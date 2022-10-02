package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import connection.DatabaseConnection;
import models.CartModel;

public class CartLogController {
	private static Connection connection = null;
	private static PreparedStatement statement = null;
	private static ResultSet result = null;
	
	public static boolean SaveCart(CartModel cart) {
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("INSERT INTO tbl_cartlog (user_id, session_id, product_id, quantity, createdAt)" +
					"VALUES (?, ?, ?, ?, ?)");
			
			statement.setInt(1, cart.getUserId());
			statement.setString(2, cart.getSessionId());
			statement.setInt(3, cart.getProductId());
			statement.setInt(4, cart.getQuantity());
			statement.setString(5, cart.getCreatedAt());
			
			statement.execute();
			
			return Boolean.TRUE;
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
			return Boolean.FALSE;
		}
	}
	
	public static CartModel getCart(int id) {
		CartModel cart = null;
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM tbl_cartlog WHERE id = ?");
			
			statement.setInt(1, id);
			
			result = statement.executeQuery();
			
			while (result.next()) {
				cart = new CartModel();
				
				cart.setId(result.getInt("id"));
				cart.setUserId(result.getInt("user_id"));
				cart.setSessionId(result.getString("session_id"));
				cart.setProductId(result.getInt("product_id"));
				cart.setQuantity(result.getInt("quantity"));
				cart.setCreatedAt(result.getString("createdAt"));
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return cart;
	}
	
	public static List<CartModel> getAllCart() {
		List<CartModel> cartList = new ArrayList<CartModel>();
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM tbl_cartlog");
			result = statement.executeQuery();
			
			while (result.next()) {
				CartModel cart = new CartModel();
				
				cart.setId(result.getInt("id"));
				cart.setUserId(result.getInt("user_id"));
				cart.setSessionId(result.getString("session_id"));
				cart.setProductId(result.getInt("product_id"));
				cart.setQuantity(result.getInt("quantity"));
				cart.setCreatedAt(result.getString("createdAt"));
				
				cartList.add(cart);
			}
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return cartList;
	}
}
