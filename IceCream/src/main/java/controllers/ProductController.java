package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import connection.DatabaseConnection;
import models.ProductModel;

public class ProductController {
	private static Connection connection = null;
	private static PreparedStatement statement = null;
	private static ResultSet result = null;
	
	public static ProductModel getProduct(int id) {
		ProductModel product = null;
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM tbl_product WHERE id = ?");
			
			statement.setInt(1, id);
			
			result = statement.executeQuery();
			
			while (result.next()) {
				product = new ProductModel();
				
				product.setId(result.getInt("id"));
				product.setSeller_Id(result.getInt("seller_Id"));
				product.setCategoryId(result.getInt("category_id"));
				product.setName(result.getString("name"));
				product.setDescription(result.getString("description"));
				product.setStock(result.getInt("stock"));
				product.setPrice(result.getInt("price"));
				product.setImagePath(result.getString("image_path"));
				product.setStatus(result.getString("status"));
				product.setCreatedAt(result.getDate("createdAt"));
				product.setUpdatedAt(result.getDate("updatedAt"));
			}
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return product;
	}
	
	public static ProductModel getCountProduct(int id) {
		ProductModel product = null;
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT count(*) as count1 FROM tbl_product WHERE seller_Id = ? group by seller_Id ");
			
			statement.setInt(1, id);
			
			result = statement.executeQuery();
			
			while (result.next()) {
				product = new ProductModel();
				
				product.setProductCount(result.getInt("count1"));
			}
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return product;
	}
	
	public static List<ProductModel> getAllProduct() {
		List<ProductModel> productList = new ArrayList<ProductModel>();
		
		try {
			connection = DatabaseConnection.getConnection();
			statement = connection.prepareStatement("SELECT * FROM ice_cream_store.tbl_product inner join tbl_category on category_id = tbl_category.id;");
			result = statement.executeQuery();
			
			while (result.next()) {
				ProductModel product = new ProductModel();
				
				product.setId(result.getInt("id"));
				product.setSeller_Id(result.getInt("seller_Id"));
				product.setCategoryId(result.getInt("category_id"));
				product.setCategory_name(result.getString("cat_name"));
				product.setName(result.getString("name"));
				product.setDescription(result.getString("description"));
				product.setStock(result.getInt("stock"));
				product.setPrice(result.getInt("price"));
				product.setImagePath(result.getString("image_path"));
				product.setStatus(result.getString("status"));
				product.setCreatedAt(result.getDate("createdAt"));
				product.setUpdatedAt(result.getDate("updatedAt"));
				
				productList.add(product);
			}
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
		}
		
		return productList;
	}
	
	public static List<ProductModel> getAllProductCategory(){
		List<ProductModel> list = new ArrayList<ProductModel>();
		
		try {
			connection=DatabaseConnection.getConnection();
			statement=connection.prepareStatement("select * from tbl_category;");
			result=statement.executeQuery();
			
			while(result.next()) {
				ProductModel pc = new ProductModel();
				pc.setId(result.getInt("Id"));
				pc.setCategory_name(result.getString("cat_name"));
				pc.setCategory_image(result.getString("cat_img"));
				list.add(pc);
			}
		}
		catch(Exception e){
			System.out.println(e);
			e.printStackTrace();
		    JOptionPane.showMessageDialog(null, e);
		}
		return list;
	}
	
	public static List<ProductModel> getAllProductofEachSupplier(String id, String nav){
		List<ProductModel> list = new ArrayList<ProductModel>();
		
		if(nav.equalsIgnoreCase("all")) {
			try {
				connection=DatabaseConnection.getConnection();
				statement=connection.prepareStatement("select * from tbl_product where seller_Id= '"+id+"'; ");
				result=statement.executeQuery();
				
				while(result.next()) {
					ProductModel pro = new ProductModel();
					pro.setName(result.getString("name"));
					pro.setImagePath(result.getString("image_path"));
					pro.setPrice(result.getInt("price"));
					pro.setStatus(result.getString("status"));
					pro.setStock(result.getInt("stock"));
					list.add(pro);
				}
			}
			catch(Exception e){
				System.out.println(e);
				e.printStackTrace();
			    JOptionPane.showMessageDialog(null, e);
			}
			return list;
		}
		
		else {
		try {
			connection=DatabaseConnection.getConnection();
			statement=connection.prepareStatement("select * from tbl_product where seller_Id= '"+id+"' and status = '"+nav+"';");
			result=statement.executeQuery();
			
			while(result.next()) {
				ProductModel pro = new ProductModel();
				pro.setName(result.getString("name"));
				pro.setImagePath(result.getString("image_path"));
				pro.setPrice(result.getInt("price"));
				pro.setStatus(result.getString("status"));
				pro.setStock(result.getInt("stock"));
				list.add(pro);
			}
		}
		catch(Exception e){
			System.out.println(e);
			e.printStackTrace();
		    JOptionPane.showMessageDialog(null, e);
		}
		return list;
		}
	}
}
