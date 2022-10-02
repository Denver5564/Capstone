<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Manage Product</title>
   <link rel="stylesheet" href="/IceCream/assets/css/admin_sidebar.css" />
   <link rel="stylesheet" href="/IceCream/assets/css/admin_manageproduct.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

   <link rel="stylesheet" href="/IceCream/assets/css/seller_dataTables.css">

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
   <script src="/IceCream/assets/js/admin_datatable_desc.js"></script>
</head>
<body>
   <div id="sidebar">
         <div class="sidebar-logo1">
            <img src="/IceCream/assets/images/index/logo.png" class="sidebar-logo">
         </div>
         
         <button class="accordion"><i class="fas fa-tachometer"></i> Dashboard</button>
            <div class="panel">
               <a href="admin_index.jsp"><button class="panel-button">Statistics</button></a>
            </div>

         <button class="accordion active"><i class="fa-solid fa-list-check"></i> Management</button>
            <div class="panel" style="max-height: 100px;">
               <a href="admin_manageproduct.jsp"><button class="panel-button" style="background-color: rgb(209, 207, 207);">Manage Products</button></a>
               <a href="admin_manageuser.jsp"><button class="panel-button">Manage Users</button></a>
            </div>

         <button class="accordion"><i class="fas fa-flag"></i> Reports</button>
         <div class="panel">
            <a href="admin_managereport.jsp"><button class="panel-button">Product Issue</button></a>
         </div>
            
         <button class="accordion"><i class="fa fa-user"></i> My Account</button>
            <div class="panel">
               <a href="account_settings.html"><button class="panel-button">Account Settings</button></a>
            </div>
            
         
         <button class="logout"><i class="fa fa-sign-out"></i> Sign Out</button>

   </div>
 
<!-- PAGE CONTENT -->
<div id="content1" >
   <div id="page-header1">
      <div class="page-path">
         <span>Admin > Management </span>
         <h3>Manage Product</h3>
      </div>
   </div>

   <div id="manage-navbar">
      <nav>
         <ul id="navbar">
           <li><a href ="manageProduct.jsp"><button class="btn btn-primary" data-toggle="collapse" data-target="manageProduct.jsp">All</button></a></li>
            <li><a href ="manageAccepted.jsp"><button class="btn btn-primary" data-toggle="collapse" data-target="#demo">Accepted</button></a></li>
            <li><a href ="managePending.jsp"><button class="btn btn-primary" data-toggle="collapse" data-target="#demo">Pending</button></a></li>
            <li><a href ="manageRejected.jsp"><button class="btn btn-primary" data-toggle="collapse" data-target="#demo">Rejected</button></a></li>
            <li><button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo2">Reported</button></li>
         </ul>
      </nav>
   </div>
 	
    
   <div id="seller-table" class="section-padding2">
      <table id="table_id" class="display">
         <h4>All Products</h4>
         <thead>
            <tr>
               <th>Product Id</th>
               <th>Image</th>
               <th>Name</th>
               <th>Category</th>
               <th>Stock</th>
               <th>Price (₱)</th>
               <th>Created at</th>
               <th>Action</th>
            </tr>
         </thead>    
         	<%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ice_cream_store?serverTimezone=UTC", "root", "0000");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM ice_cream_store.tbl_product order by createdAt desc;";
                ResultSet rs = st.executeQuery(sql);
			%>
         		<tr>
         		<%while (rs.next()) {
                    int id = rs.getInt("id");
					String filename = rs.getString("image_path");
					String name= rs.getString("name");
					String category=rs.getString("description");
					int stock= rs.getInt("stock");
					float price= rs.getFloat("price");
					String date= rs.getString("createdAt");
        		     %>
                    <td><%=id%></td>
                	<td><img src="http://localhost:8080/IceCream/<%=filename%>" class="image_size"></td>
      				<td><%= name%></td>
     				<td><%=category%></td>
      				<td><%=stock%></td>
      				<td><%=price%></td>
      				<td><%=date%></td>
      				<td>
                  <a class="fa fa-eye"> <button class="view" type ="button" onclick="openPopup(<%=id%>)"> View&nbsp;</button></a>
	                  <div class="popup" id="<%=id%>">
	                  	<%-- Palagay na lang ng filename --%>
	                  	<img src="http://localhost:8080/IceCream/<%=filename%>">
	                  	<input type="hidden" name="id" value="<%=id%>">
	                  	<p> Name:<%= name%></p>
	                  	<p> Category:<%= category%></p>
	                  	<p> Stock:<%= stock%></p>
	                  	<p> Price: <%= price%></p>
	                  	<button class="reject" onclick="closePopup(<%=id%>)"> Close &nbsp;</button>
	                  </div>
                  <a href="deleteProduct.jsp?id=<%=id %>" class="fa fa-trash" style="color:red;">Delete</a>
               		</td> 
            	</tr>
            	<%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
      </table>
   
   </div>
   
</div>

<script src="/IceCream/assets/js/admin_manageproduct.js"></script>
<script src="/IceCream/assets/js/seller_sidebar.js"></script>
</body>
</html>