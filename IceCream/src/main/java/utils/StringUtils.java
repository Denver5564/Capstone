package utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import models.CartModel;

public class StringUtils {
	
	private static Date date = new Date();
	
	public static String generateUUID() {
		UUID uuid = UUID.randomUUID();
		
		return uuid.toString();
	}
	
	public static Date getSqlDate() {
		return new java.sql.Date(date.getTime());
	}
	
	public static Timestamp getSqlTimeStamp() {
		return new java.sql.Timestamp(date.getTime());
	}
	
	public static String translateDateTime() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return format.format(date);
	}
	
	public static String translateUserType(int UserType) {
		return UserType == 1 ? "Administrator" : UserType == 2 ? "Seller" : UserType == 3 ? "User" : "NULL";
	}
}
