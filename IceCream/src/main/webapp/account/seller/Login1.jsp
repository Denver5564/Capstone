<%@ page import="controllers.*" language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>

<jsp:useBean id="ee" class="models.UserModel"></jsp:useBean>
<jsp:setProperty property="*" name="ee"/>
	
<% 	// Request Settings for Account
	String email = request.getParameter("email");
	String password = request.getParameter("password"); 
%>
		
<% //Settings for MySQL Connection
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ice_cream_store?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","0000");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from tbl_user where email = '"+ email +"' or username = '"+ email +"' ");
	
//If Else statement for Auth
		if(rs.next()){ 													//If email or user is correct
			if(rs.getString("password").equals(password)){				//If password is correct
				if(rs.getInt("usertype")== 2){					//If usertype is correct
					session.setAttribute("Id",rs.getString(1));
					session.setAttribute("email", ee.getEmail());
					String redirectURL = "seller_index.jsp";
					response.sendRedirect(redirectURL);
					}
				else if(rs.getInt("usertype")== 3){			//If usertype is correct
					session.setAttribute("Id",rs.getString(1));
					session.setAttribute("email", ee.getEmail());
					String redirectURL = "seller_index.jsp";
					response.sendRedirect(redirectURL);
					}
				else{
					String redirectURL = "Login.jsp?status=failed1";	//If wrong login form
					response.sendRedirect(redirectURL);
					}
				}
			else{
				String redirectURL = "Login.jsp?status=failed2";		//If password is incorrect
				response.sendRedirect(redirectURL);
				}
			}
		else{
			String redirectURL = "Login.jsp?status=failed3";			//If email or username is incorrect
			response.sendRedirect(redirectURL);
			}
%>