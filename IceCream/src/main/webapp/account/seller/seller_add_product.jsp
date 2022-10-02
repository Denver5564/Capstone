<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controllers.*, models.*, servlets.*, java.util.*" %>
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
   <link rel="stylesheet" type="text/css" href="/IceCream/assets/css/seller_addproduct.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
   <script src="js/datatable.js"></script>
</head>
<body>
   <div id="sidebar">
         <div class="sidebar-logo1">
            <a href="seller_index.jsp"><img src="/IceCream/assets/images/index/logo.png" class="sidebar-logo"></a>
         </div>
         
         <button class="accordion active"><i class="fa fa-shopping-bag"></i> Products</button>
            <div class="panel" style="max-height: 100px;">
               <a href="http://localhost:8080/IceCream/account/seller/seller_manage_product.jsp?list=all"><button class="panel-button">Manage Products</button></a>
               <a href="http://localhost:8080/IceCream/account/seller/seller_add_product.jsp"><button class="panel-button" style="background-color: rgb(209, 207, 207);">Add Product</button></a>
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
            
         
         <button class="logout"><i class="fa fa-sign-out"></i> Sign Out</button>

   </div>
 
<!-- PAGE CONTENT -->
<div id="content1" >
   <div id="page-header1">
      <div class="page-path">
         <span>Home > Product Management </span>
         <h3>Add Product</h3>
      </div>
   </div>

   <form class="add-form" action="http://localhost:8080/IceCream/FileUploadServlet" method="post" enctype="multipart/form-data">
      <div class="form">
        <fieldset>
          <legend>Add Product</legend>
          <input type="text" id="product-name" name="product_name"  placeholder="Product Name *" required>
          
<%
List<ProductModel> list = ProductController.getAllProductCategory();
request.setAttribute("list", list);
	%>          
            <!-- Category-->
          <div class="container">
  
            <div class="select-box">
              <div class="options-container acive">
              <input type="hidden" name="supplier_Id" value="<%= seller %>">
  <c:forEach items="${list}" var="u">
                <div class="option">
                  <input type="radio" class="radio" name="product_category_Id" id="dairy" value=" ${u.getId()}" />
                  <label for="ingredients">${u.getId()} ${u.getCategory_name()}</label>
                </div>
  </c:forEach>
              </div>
              <div class="selected">
                Select Category 
              </div>
            </div>
          </div>
<script>
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(350)
                .height(400);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
</script>  
            <!-- Product Info-->
            <div class="product-info">
                <div class="product-image"><p class="text"><img id="blah" src="#" alt="Product Image" /></p></div>
                <div class="upload-image-sec">
                  <!-- Upload Inputs-->
                  <p class="text"><img src="images/CakeIceCream1.jpg" alt=""> Add Image</p>
                  <div class="upload-catalouge">
                    <input type="file" name="product_image"class="fileupload" id="file-upload-btn" onchange="readURL(this);" multiple hidden>
                    <label for="file-upload-btn" class="upload-image"></label> 
                  </div>
                </div>
  
                <div class="variations">
                    <legend>Variations</legend>
                  <div class="select-flavor">
                    <p class="text"> Flavor Available</p>
                    <div class="flavors">
                      <input type="checkbox" class="flavor-checkbox" id="v" value="vanilla">
                      <input type="checkbox" class="flavor-checkbox" id="c" value="choco">
                      <input type="checkbox" class="flavor-checkbox" id="st" value="strawberry">
                    </div>
                  </div>
                  <div class="select-sizes">
                    <p class="text"> Sizes Available</p>
                    <div class="sizes">
                      <input type="checkbox" class="size-checkbox" id="s" value="s">
                      <input type="checkbox" class="size-checkbox" id="m" value="m">
                      <input type="checkbox" class="size-checkbox" id="l" value="l">
                      <input type="checkbox" class="size-checkbox" id="xl" value="xl">
                    </div>
                  </div>
               
                </div>
            </div> 
            
            <div class="product-specs">
              <input type="number" id="price" name="price" placeholder="price">
              <input type="text" id="pack-type" placeholder="Pack Type">
              <input type="text" id="ice-type" placeholder="Ice cream type">
              <input type="number" id="shell-life" placeholder="Shelf Life (in Months)">
              <input type="number" id="weight" placeholder="Weight (in Grams)">
              <input type="number" id="stocks" name="product_stock" min="5" placeholder="Item in Stocks (Minimum of 5)">
              <input type="text" id="pack-size" placeholder="Pack Size">
              <input type="text" id="ship-from" placeholder="Ship From">
            </div>
  
            <div class="buttons">
              <button class="btn" id="add-btn" type="submit"> add product</button>
              <button class="btn" id="save-btn"> save draft</button>
            </div>
        </fieldset>
      </div>
    </form>
</div>

<script src="/IceCream/assets/js/seller_addproduct.js"></script>
<script src="/IceCream/assets/js/seller_sidebar.js"></script>
</body>
</html>