package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import connection.DatabaseConnection;
import models.OrderModel;

public class OrderController {

	private static Connection connection = null;
	private static PreparedStatement statement = null;
	private static ResultSet result = null;
	
	public static boolean SaveCart(OrderModel order) {
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("INSERT INTO tbl_order (user_id, seller_Id, session_id, orderDate, totalPrice, createdAt)" +
					"VALUES (?, ?, ?, ?, ?, ?)");
			
			statement.setInt(1, order.getUserId());
			statement.setInt(2, order.getSeller_Id());
			statement.setString(3, order.getSessionId());
			statement.setString(4, order.getOrderDate());
			statement.setInt(5, order.getTotalPrice());
			statement.setString(6, order.getCreatedAt());
			
			statement.execute();
			
			return Boolean.TRUE;
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
			return Boolean.FALSE;
		}
	}
	
	public static OrderModel getOrder(int id) {
		OrderModel order = null;
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM tbl_order WHERE session_id = ?");
			
			statement.setInt(1, id);
			
			result = statement.executeQuery();
			
			while (result.next()) {
				order = new OrderModel();
				
				order.setId(result.getInt("id"));
				order.setUserId(result.getInt("user_id"));
				order.setSessionId(result.getString("session_id"));
				order.setOrderDate(result.getString("orderDate"));
				order.setTotalPrice(result.getInt("totalPrice"));
				order.setStatus(result.getString("status"));
				order.setCreatedAt(result.getString("createdAt"));
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return order;
	}
	
	public static List<OrderModel> getAllOrder() {
		List<OrderModel> orderList = new ArrayList<OrderModel>();
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM tbl_order");
			result = statement.executeQuery();
			
			while (result.next()) {
				OrderModel order = new OrderModel();
				
				order.setId(result.getInt("id"));
				order.setUserId(result.getInt("user_id"));
				order.setSessionId(result.getString("session_id"));
				order.setOrderDate(result.getString("orderDate"));
				order.setTotalPrice(result.getInt("totalPrice"));
				order.setStatus(result.getString("status"));
				order.setCreatedAt(result.getString("createdAt"));
				
				orderList.add(order);
			}
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return orderList;
	}
}
