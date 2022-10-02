<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.jar.JarException"%>
<%@ page import="org.json.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>

<%
Connection con = null;
Statement stmt = null;
ResultSet result = null;
    final String jdbcdriver="com.mysql.jdbc.Driver";
    final String url="jdbc:mysql://localhost/ice_cream_store";
    final String user="root";
    final String pass="0000";
    

        
    try{
        Class.forName(jdbcdriver);
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ice_cream_store?serverTimezone=UTC", "root", "0000");
    }catch(ClassNotFoundException e){
    }catch(SQLException e){}
    
    try{
        
        String query;
        
        stmt = con.createStatement();
        
        query = "SELECT * FROM tbl_order limit 1";
        result = stmt.executeQuery(query);
        
        if(!result.next()){
            out.print("0");
        }else{
            JSONArray array = new JSONArray();
            do{
                JSONObject denver = new JSONObject();
                denver.put("FirstName",result.getString("session_id"));
                denver.put("LastName",result.getString("orderDate"));
                denver.put("Location",result.getString("user_id"));
                array.put(denver.toString());
                
            }while(result.next());
            out.print(array);
        }
        
    }catch(SQLException e){
        out.print("Exception: "+e);
    }
    finally{
        if(stmt != null){
            try{
                stmt.close();
            }catch(SQLException e){}
        }
        if(con != null){
            try{
                con.close();
            }catch(SQLException e){}
        }
    }
%>