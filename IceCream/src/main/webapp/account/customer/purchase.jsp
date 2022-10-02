<%@ page import="models.*, controllers.*, java.util.List" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

	List<OrderModel> orderList = OrderController.getAllOrder();
	request.setAttribute("orderList", orderList);
	
	List<CartModel> cartList = CartLogController.getAllCart();
	request.setAttribute("cartList", cartList);
	
	int UserId = (int) session.getAttribute("id");
	request.setAttribute("UserId", UserId);

%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Ice Cream ni Denver</title>

	<!-- FAVICON -->
	<link rel="icon" type="image" href="images/logo.png">

	<!-- FONT AWESOME -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />

	<!-- CSS -->
	<link rel="stylesheet" href="/IceCream/assets/css/style.css">
	<link rel="stylesheet" href="/IceCream/assets/css/bootstrap.css">
</head>

<body>
	<header id="header">
    <a href="#"><img class="logo " src="logo.png"> </a>
    <nav>
      <ul id="navbar">
        <li><input type="text" class="search-bar"></li>

        <li class="icon">
          <a href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
        </li>
        <li class="icon">
          <a href="#"><i class="fa-solid fa-cart-plus"></i></a>
        </li>
        <li class="icon">
          <a href="#"><i class="fa-solid fa-user"></i></a>
        </li>
        <li>
          <a href="#"><i id="close" class="fa-solid fa-xmark"></i></a>
        </li>
      </ul>


      <div id="mobile">
        <i class="fa-solid fa-magnifying-glass"></i>
        <i class="fa-solid fa-cart-plus"></i>
        <i class="fa-solid fa-user"></i>
        <i id="bar" class="fa-solid fa-bars"></i>
      </div>
    </nav>
  </header>
  <!-- Header last line -->

	<div class="row">
		<div class="col-3 ml-3" style="padding-top: 140px;">
			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column">
					<li class="nav-item">
						<a href="admin.html" class="nav-link">
							<i class="nav-icon fas fa-user"></i>
							<p>
								MY ACCOUNT
							</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="admin.html" class="nav-link active">
							<i class="nav-icon fas fa-cart-plus"></i>
							<p>
								MY PURCHASE
							</p>
						</a>
						<a href="admin.html" class="nav-link">
							<i class="nav-icon fas fa-cart-plus"></i>
							<p>
								CART
							</p>
						</a>


					</li>
					<li class="nav-item">
					</li>
				</ul>
			</nav>
			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
		<div class="col-8">
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-8">
							<h1 class="m-0">My Purchase</h1>
						</div>

						<div class="card m-2 col-12 bg-light">
							<div class="container-fluid">
								<div class="row">
									<nav class="navbar navbar-expand-lg navbar-light ">
										<ul class="navbar-nav mr-auto">
											<li class="nav-item active">
												<a class="nav-link" href="#" style="border-bottom: solid maroon;">All
													<span class="sr-only">(current)</span></a>
											</li>
											<li class="nav-item active">
												<a class="nav-link" href="#">To Pay <span
														class="sr-only">(current)</span></a>
											</li>
											<li class="nav-item active">
												<a class="nav-link" href="#">To Ship <span
														class="sr-only">(current)</span></a>
											</li>
											<li class="nav-item active">
												<a class="nav-link" href="#">To Receive <span
														class="sr-only">(current)</span></a>
											</li>
											<li class="nav-item active">
												<a class="nav-link" href="#">Completed <span
														class="sr-only">(current)</span></a>
											</li>
											<li class="nav-item active">
												<a class="nav-link" href="#">Cancelled <span
														class="sr-only">(current)</span></a>
											</li>
										</ul>
									</nav>
								</div>
							</div>
						</div>

						<div class="card m-2 col-12 bg-light">
							<div class="container-fluid">
								<div class="row">
									<div class="card-body">
										<table class="table table-sm ">
											<thead>
												<tr>
													<th></th>
													<th scope="col">SHOPPE</th>
													<th></th>
													<th scope="col">Price</th>
													<th scope="col">Total</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${ cartList }" var="data">
													<c:if test = "${ UserId == data.getUserId() }">
														<tr>
															<td></td>
															<td><img src="/IceCream/assets/images/index/${ ProductController.getProduct(data.getProductId()).getImagePath() }" alt="" border=3 height=100 width=100 /></td>
															<td>
																${ ProductController.getProduct(data.getProductId()).getName() }<br />
																<span class="text-muted">${ ProductController.getProduct(data.getProductId()).getDescription() }</span><br />
																<span class="text-muted">Quantity: x${ data.getQuantity() }</span>
															</td>
															<td>${ ProductController.getProduct(data.getProductId()).getPrice() }</td>
															<td>${ ProductController.getProduct(data.getProductId()).getPrice() * data.getQuantity() }</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
										<div class="subtotal float-right">
											<span class="text-black">Order Total:</span>
											<span class="text-muted">₱ 99,999.00</span>
										</div><br><br>
										<div class="text-right">
											<button class="btn btn-danger" type="button" name="">Rate</button>
											<button class="btn btn-warning" type="button" name="">Contact
												Seller</button>
											<button class="btn btn-warning" type="submit" name="submit">Submit</button>
										</div>
									</div>

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
</body>

</html>