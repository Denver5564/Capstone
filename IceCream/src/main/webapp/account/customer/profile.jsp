<%@ page import="models.*, controllers.*, utils.StringUtils" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
   <link rel="stylesheet" href="/IceCream/assets/css/profile/sidebaronly.css" />
   <link rel="stylesheet" href="/IceCream/assets/css/profile/account_settingss.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" type="text/css" href="/IceCream/assets/css/profile/dataTables.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
   <script src="/IceCream/assets/js/settings/datatable.js"></script>
</head>

<body>
   <div id="sidebar">
      <div class="sidebar-logo1">
         <img src="images/logo.png" class="sidebar-logo">
      </div>

      <button class="accordion"><i class="fa fa-shopping-bag"></i> Products</button>
      <div class="panel">
         <a href="#content2"><button class="panel-button">Manage Products</button></a>
         <a href="#content2"><button class="panel-button">Add Product</button></a>
      </div>

      <button class="accordion"><i class="fa fa-list"></i> Orders</button>
      <div class="panel">
         <a href="#content3"><button class="panel-button">Manage Orders</button></a>
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
   <div id="content1">
      <div id="page-header1">
         <div class="page-path">
            <span>Home > My Account </span>
            <h3>Update Profile</h3>
         </div>
      </div>

      <div id="cont-acc">
         <div class="cont-box">
            <div class="acc-title">
               <span class="maintitle">My Profile</span><br>
               <span class="subtitle">Account Protection</span>
            </div>
            <div class="acc-form">
               <form method="POST" action="/IceCream/assets/actions/updateProfile.jsp">
               	  <input type="hidden" name="id" value="<%= session.getAttribute("id") %>" />
               	  <input type="hidden" name="userId" value="<%= session.getAttribute("id") %>" />
               	  <input type="hidden" name="updatedAt" value="<%= StringUtils.translateDateTime() %>"  />
               
                  <label>Username</label>
                  <input type="text" name="Username" value="<%= UserController.getUser((int) session.getAttribute("id")).getUsername() %>" class="username" readonly><br />
                  
                  <label>Name</label>
                  <input type="text" name="firstName" value="<%= ProfileController.getProfile((int) session.getAttribute("id")).getFirstName() %>" placeholder="First Name">
                  <input type="text" name="middleName" value="<%= ProfileController.getProfile((int) session.getAttribute("id")).getMiddleName() %>" placeholder="Middle Name">
                  <input type="text" name="lastName" value="<%= ProfileController.getProfile((int) session.getAttribute("id")).getLastName() %>" placeholder="Last Name"><br />
                  
                  <label>Email</label>
                  <input type="email" name="email" value="<%= UserController.getUser((int) session.getAttribute("id")).getEmail() %>" class="acc-email"><br>
                  
                  <label>Shop Name</label>
                  <input type="text" name="shopName" value="<%= ProfileController.getProfile((int) session.getAttribute("id")).getShopName() %>" class="acc-storename"><br>
                  
                  <label>Phone Number</label>
                  <input type="text" name="cellphone" value="<%= AddressController.getAddress((int) session.getAttribute("id")).getCellphone() %>"><br>
                  
                  <label>Date of Birth</label>
                  <select class="acc-bday">
                     <option value="1">1</option>
                     <option value="1">2</option>
                     <option value="1">3</option>
                     <option value="1">4</option>
                     <option value="1">5</option>
                     <option value="1">6</option>
                  </select>
                  <select class="acc-bday">
                     <option value="1">January</option>
                     <option value="1">February</option>
                     <option value="1">March</option>
                     <option value="1">April</option>
                     <option value="1">May</option>
                     <option value="1">June</option>
                  </select>
                  <select class="acc-bday">
                     <option value="1">2000</option>
                     <option value="1">2001</option>
                     <option value="1">2002</option>
                     <option value="1">2003</option>
                     <option value="1">2004</option>
                     <option value="1">2005</option>
                  </select><br>
                  <label>Gender</label>
                  <select name="gender" class="acc-gender">
                     <option value="1">Male</option>
                     <option value="0">Female</option>
                     <option value="2">Other</option>
                  </select><br />
                  <button type="submit" class="acc-submit">Save</button>
               </form>
            </div>
         </div>
      </div>
   </div>

   <script src="/IceCream/assets/js/settings/sidebar.js"></script>
</body>

</html>