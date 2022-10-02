package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import connection.DatabaseConnection;
import models.TransactionModel;

public class TransactionController {
	private static Connection connection = null;
	private static PreparedStatement statement = null;
	private static ResultSet result = null;
	
	public static List<TransactionModel> getOrderPerSeller() {
		List<TransactionModel> transactionList = new ArrayList<TransactionModel>();
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("select * from tbl_order as f1 inner join tbl_cartlog as f2 on f1.session_id = f2.session_id\r\n"
					+ "inner join tbl_product as f3 on f2.product_id = f3.id\r\n"
					+ "inner join tbl_user as f4 on f3.seller_Id = f4.id ;");
			result = statement.executeQuery();
			
			while (result.next()) {
				TransactionModel transact = new TransactionModel();
				
				transact.setId(result.getInt("id"));
				transact.setSession_id(result.getString("session_id"));
				transact.setProduct_name(result.getString("name"));
				transact.setQuantity(result.getInt("quantity"));
				transact.setTotalPrice(result.getFloat("totalPrice"));
				transact.setStatus(result.getString("status"));
				
				transactionList.add(transact);
			}
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return transactionList;
	}
	
	public static List<TransactionModel> getAllOrderOfEverySeller(String id) {
		List<TransactionModel> transactionList = new ArrayList<TransactionModel>();
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("select * from tbl_order where seller_id = ?;");
			
			statement.setString(1, id);
			
			result = statement.executeQuery();
			
			while (result.next()) {
				TransactionModel transact = new TransactionModel();
				
				transact.setId(result.getInt("id"));
				transact.setUser_id(result.getInt("user_id"));;
				transact.setSession_id(result.getString("session_id"));
				transact.setTotalPrice(result.getFloat("totalPrice"));
				transact.setStatus(result.getString("status"));
				transact.setOrderDate(result.getString("orderDate"));
				
				transactionList.add(transact);
			}
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return transactionList;
	}
}
