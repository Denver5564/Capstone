<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
   <link rel="stylesheet" href="/IceCream/assets/css/seller_sidebaronly.css" />
   <link rel="stylesheet" href="/IceCream/assets/css/customer_account_settings.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- FAVICON -->
   <link rel="icon" type="image" href="/IceCream/assets/images/index/logo.png">

<!-- FONT AWESOME -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<!-- CSS -->
	<link rel="stylesheet" href="/IceCream/assets/css/styles.css">
	<link rel="stylesheet" type="text/css" href="../mypurchase/styles/bootstrap_v4.css"> 
	

	<!-- Header CSS -->
	<link rel="stylesheet" href="/IceCream/assets/css/customer_css.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
   <script src="js/datatable.js"></script>
</head>
<body>

   <header id="header" class="section-padding1 ">
      <a href="#"><img class="logo " src="/IceCream/assets/images/index/logo.png"> </a>
      <input type="text" class="search-bar">
      <a href="#"><button type="submit" class="search-bar-submit"><i class="fa fa-search"></i></button></a>
      <a href="#"><button type="submit" class="header-cart"><i class="fa fa-shopping-cart"></i></button></a>
      <a href="#"><button type="submit" class="header-profile"><i class="fa fa-user"></i></button></a>


      <div id="mobile">
         <i class="fa-solid fa-magnifying-glass"></i>
         <i class="fa-solid fa-cart-plus"></i>
         <i class="fa-solid fa-user"></i>
         <i id="bar" class="fa-solid fa-bars"></i>
      </div>
   </header>

   <div class="row">
      <div class="col-3 ml-3" style="padding-top: 140px;">
      
      <!-- Sidebar Menu -->
      <nav class="mt-2">
         <ul class="nav nav-pills nav-sidebar flex-column">
            <li class="nav-item">
               <a href="/account_settings/account_settings.html" class="nav-link">
                    <i class="nav-icon fas fa-user"></i>
                    <p>
                      MY ACCOUNT
                    </p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="../mypurchase/my_purchase.html" class="nav-link">
                    <i class="nav-icon fas fa-cart-plus"></i>
                    <p>
                      MY PURCHASE
                    </p>
                  </a>
                </li>
              <li class="nav-item">
                  <a href="/cart/cart.html" class="nav-link">
                    <i class="nav-icon fas fa-cart-plus"></i>
                    <p>
                      CART
                    </p>
                  </a>
                </li>
              </ul>
            </nav>
            <!-- /.sidebar-menu -->
          </div>
          <!-- /.sidebar -->
   
<!-- PAGE CONTENT -->
<div id="content1" >
   <div id="cont-acc">
      <div class="cont-box">
         <div class="acc-title">
            <span class="maintitle">My Profile</span><br>
            <span class="subtitle">Account Protection</span>
         </div>
         <div class="acc-form">
            <form action="">
               <label>Username</label><input type="text" value="Mizaki" class="username" readonly><br>
               <label>Name</label><input type="text" value="Roldan" placeholder="First Name">
               <input type="text" value="Ramirez" placeholder="Middle Name">
               <input type="text" value="Rendon" placeholder="Last Name"><br>
               <label>Email</label><input type="email" value="RoldanRR@gmail.com" class="acc-email"><br>
               <label>Shop Name</label><input type="text" value="Roldan Ice Cream Store" class="acc-storename"><br>
               <label>Phone Number</label><input type="text" value="09183219832"><br>
               <label>Date of Birth</label><select class="acc-bday">
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
               <label>Gender</label><select class="acc-gender">
                  <option>Male</option>
                  <option>Female</option>
                  <option>Other</option>
               </select><br>
               <button type="submit" class="acc-submit">Save</button>
            </form>
         </div>
      </div>
   </div>
</div>

<script src="/js/sidebar.js"></script>
</body>
</html>