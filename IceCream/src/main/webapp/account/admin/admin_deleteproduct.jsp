<%@ page language="java" contentType="text/html"
pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce?serverTimezone=UTC", "root", "0000");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM products WHERE product_id="+id);
response.sendRedirect("manageProduct.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>