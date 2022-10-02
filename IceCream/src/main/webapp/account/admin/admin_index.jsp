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
   <title>Admin </title>
   
   <link rel="stylesheet" href="/IceCream/assets/css/admin_sidebar.css" />
   <link rel="stylesheet" href="/IceCream/assets/css/seller_dataTables.css">
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
   <script src="/IceCream/assets/js/seller_datatables.js"></script>
   
</head>
<body>
   <div id="sidebar">
         <div class="sidebar-logo1">
            <img src="/IceCream/assets/images/index/logo.png" class="sidebar-logo">
         </div>
         
         <button class="accordion active"><i class="fas fa-tachometer"></i> Dashboard</button>
            <div class="panel" style="max-height: 100px;">
               <a href="admin_index.jsp"><button class="panel-button" style="background-color: rgb(209, 207, 207);">Statistics</button></a>
            </div>

         <button class="accordion"><i class="fa-solid fa-list-check"></i> Management</button>
            <div class="panel">
               <a href="admin_manageproduct.jsp"><button class="panel-button">Manage Products</button></a>
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
         <h3>Stats</h3>
      </div>
   </div>
   
   <div class="container-stats">
      <div class="row">
      <!-- MANAGE PRODUCT-->
      <div class="col-md-4">
         <div class="card border-dark mb-3"  style="max-width: 17rem">
         <div class="card-body">
            <h6><i class="fas fa-cart-plus"></i>  Products</h6>
            <hr>
            <h4>
            <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ice_cream_store?serverTimezone=UTC", "root", "0000");
                Statement st = con.createStatement();
                String sql = "SELECT (SELECT COUNT(*) FROM tbl_product) AS Total_Products, (SELECT COUNT(*) FROM tbl_user)  AS Total_Users, (SELECT  COUNT(*) FROM tbl_prodreport)  AS Total_Reports FROM dual";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                	int totalproducts = rs.getInt("Total_Products");
                	int totalusers = rs.getInt("Total_Users");
                	int totalreports = rs.getInt("Total_Reports");
			%>
               <b><%=totalproducts %></b>
            </h4>
         </div>
         </div>
      </div>
         <!-- MANAGE USERS--> 
         <div class="col-md-4">
         <div class="card border-dark mb-3"  style="max-width: 17rem;">
            <div class="card-body">
               <h5><i class="fas fa-users"></i>Users</h5>
               <hr>
               <h4>
   
               <b><%=totalusers %></b>
               </h4>
 
            </div>
         </div>
         </div>
      <!-- REPORTS-->
         <div class="col-md-4">
         <div class="card border-dark mb-3"  style="max-width: 17rem;">
            <div class="card-body">
               <hh5><i class="fas fa-flag"></i> Reports</hh5>
               <hr>
               <h4>
               <b><%=totalreports %></b>
               <h4>
               <%    
                	}
				} catch (Exception e) {
				
                out.println(e);
            }
       		 %>
            </div>
         </div>
         </div>
      </div>
   </div>
   <div id="seller-table" class="section-padding2">
      <table id="table_id" class="display">
         <h4>Popular Products</h4>
         <thead>
            <tr>
               <th>Product Id</th>
               <th>Name</th>
               <th>Name</th>
               <th>Category</th>
               <th>Stock</th>
               <th>Price (₱)</th>
               <th>Created at</th>
               <th>Action</th>
            </tr>
         </thead>         
         <tbody>
            <tr>
               <td>1031</td>
               <td><img src="images/CakeIceCream1.jpg" height="50"></td>
                <td>Choco</td>
                <td>Cake</td>
                <td>3</td>
                <td>30</button></td>
                <td>2022-09-06</td>
                <td>
                  <a href="#" class="fa fa-edit"> Update &nbsp;</a>
                  <a href="#" class="fa fa-trash" style="color: red;"> Delete</a>
               </td> 
            </tr>

            <tr>
               <td>1302</td>
               <td>Image 2</td>
                <td>Strawberry</td>
                <td>Ice stick</td>
                <td>20</td>
                <td>40</td>
                <td>2022-09-06</td>
               <td>
                  <a href="#" class="fa fa-edit"> Update &nbsp;</a>
                  <a href="#" class="fa fa-trash" style="color: red;"> Delete</a>
               </td> 
            </tr>

         </tbody>  
      </table>
   </div>
</div>

<script src="/IceCream/assets/js/seller_sidebar.js"></script>
</body>
</html>