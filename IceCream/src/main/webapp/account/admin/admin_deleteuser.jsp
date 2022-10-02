<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%

String id=request.getParameter("id");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ice_cream_store?serverTimezone=UTC", "root", "0000");
		Statement st=conn.createStatement();
		int i=st.executeUpdate("DELETE FROM tbl_user WHERE id="+id);
		response.sendRedirect("admin_manageuser.jsp");
		}
	catch(Exception e){
		System.out.print(e);
		e.printStackTrace();
		}
%>