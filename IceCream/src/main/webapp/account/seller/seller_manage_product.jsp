<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controllers.*, models.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session = request.getSession(false);
	String seller=(String)session.getAttribute("Id");
	
	if(session.getAttribute("Id")==null){
		response.sendRedirect("Login.jsp");
		}
%>

	
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
   <link rel="stylesheet" href="/IceCream/assets/css/seller_sidebaronly.css" />
   <link rel="stylesheet" href="/IceCream/assets/css/seller_manage_product.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

   <link rel="stylesheet" type="text/css" href="/IceCream/assets/css/seller_dataTables.css">

   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@ 4.6.1/dist/css/bootstrap.min.css">
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
            <a href="seller_index.jsp"><img src="/IceCream/assets/images/index/logo.png" class="sidebar-logo"></a>
         </div>
         
         <button class="accordion active"><i class="fa fa-shopping-bag"></i> Products</button>
            <div class="panel" style="max-height: 100px;">
               <a href="http://localhost:8080/IceCream/account/seller/seller_manage_product.jsp?list=all"><button class="panel-button" style="background-color: rgb(209, 207, 207);">Manage Products</button></a>
               <a href="http://localhost:8080/IceCream/account/seller/seller_add_product.jsp"><button class="panel-button">Add Product</button></a>
            </div>

         <button class="accordion"><i class="fa fa-list"></i> Orders</button>
            <div class="panel">
               <a href="seller_manage_order.jsp"><button class="panel-button">Manage Orders</button></a>
            </div>

         <button class="accordion"><i class="fa fa-question-circle"></i> Support</button>
         <div class="panel">
            <a href="#content3"><button class="panel-button">Help Center</button></a>
         </div>
            
         <button class="accordion"><i class="fa fa-user"></i> My Account</button>
            <div class="panel">
               <a href="#content3"><button class="panel-button">Account Settings</button></a>
            </div>
            
         
         <a href="seller_logout.jsp"><button class="logout"><i class="fa fa-sign-out"></i> Sign Out</button></a>

   </div>
 
<!-- PAGE CONTENT -->
<div id="content1" >
   <div id="page-header1">
      <div class="page-path">
         <span>Home > Product Management </span>
         <h3>Manage Products</h3>
      </div>
   </div>
   <div id="manage-navbar">
      <nav>
         <ul id="navbar">
            <li><a href="http://localhost:8080/IceCream/account/seller/seller_manage_product.jsp?list=all" id="denver"><button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo1">All</button></a></li>
            <li><a href="http://localhost:8080/IceCream/account/seller/seller_manage_product.jsp?list=active" id="denver"><button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo2">Active</button></a></li>
            <li><a href="http://localhost:8080/IceCream/account/seller/seller_manage_product.jsp?list=inactive" id="denver"><button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo3">Inactive</button></a></li>
            <li><a href="http://localhost:8080/IceCream/account/seller/seller_manage_product.jsp?list=pending" id="denver"><button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo4">Pending</button></a></li>
            <li><a href="http://localhost:8080/IceCream/account/seller/seller_manage_product.jsp?list=deleted" id="denver"><button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo5">Deleted</button></a></li>
         </ul>
      </nav>
   </div>

 <%
 String nab = request.getParameter("list");
 if(nab==null){
	 nab="all";
 }
 List<ProductModel> list = ProductController.getAllProductofEachSupplier((String)session.getAttribute("Id"), nab); 
	request.setAttribute("list", list);
	%>
   <div id="seller-table" class="section-padding2">
      <table id="table_id" class="display">
         <thead>
             <tr>
                 <th>Product Image</th>
                 <th>Name</th>
                 <th>Price</th>
                 <th>Stock</th>
                 <th>Status</th>
                 <th>Action</th>
             </tr>
         </thead>         
         <tbody>
<c:forEach items="${list}" var="u">
             <tr>
             	<td><img src="http://localhost:8080/IceCream/${ u.getImagePath() }" class="image_size"> </td>
                <td>${u.getName()} ${ u.getImagePath() }</td>  
                <td>${u.getPrice()}</td>
                <td>${u.getStock()}</td> 
                <td>${u.getStatus()}</td>
<% if(nab.equalsIgnoreCase("all")) {%>
    			<td>
    				<a href="#" class="fa fa-edit">Edit</a> 
    				<a href="#" class="fa fa-trash" style="color: red;">Delete</a>
    			</td>  
                <%} %>  
                
<% if(nab.equalsIgnoreCase("active")) {%>
                <td>
    				<a href="#" class="fa fa-edit">Edit</a> 
    			</td>     
                <%} %>  
                
<% if(nab.equalsIgnoreCase("inactive")) {%>
                <td>
    				<a href="#" class="fa fa-edit">Edit</a>
    			</td>     
                <%} %>                 

<% if(nab.equalsIgnoreCase("pending")) {%>
                <td>
    				<a href="#" class="fa fa-eye">View</a> 
    			</td>     
                <%} %>  
                                
<% if(nab.equalsIgnoreCase("deleted")) {%>
                <td>
    				<a href="#" class="fa fa-recycle">Restore</a> 
    			</td>     
                <%} %>     
             </tr>
             </c:forEach>
         </tbody>  
     </table>
   </div>
</div>

<script src="/IceCream/assets/js/seller_sidebar.js"></script>
</body>
</html>