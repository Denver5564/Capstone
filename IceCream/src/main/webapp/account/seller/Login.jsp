<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign-in and Sign-up</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/IceCream/assets/css/seller_bootstrap.css" />
    <link rel="stylesheet" href="/IceCream/assets/css/seller_login.css" />
    <style>
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: #603913;
   color: #fdbd32;
   text-align: center;
   padding: 5px;
}
</style>

  </head>
  <body>

<!-- As a heading -->
<div class="container">
<nav class="navbar navbar-light fixed-top navbar-dark bg-dark">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1"><img src="/IceCream/assets/images/index/logo.png" class="login-img-logo"></span>
  </div>
</nav>
    <div class="form-wrap container-fluid">
      <div class="container shadow">
        <div class="row">
          <div class="col-md-6 p-0 m-0">
            <button class="btn-block active" id="btn-1">Sign in</button>
          </div>
          <div class="col-md-6 m-0 p-0">
            <button class="btn-block" id="btn-2">Sign up</button>
          </div>
        </div>
        <div class="row justify-content-center align-items-center" id="signin">
          <div class="col-md-12">

<!-- Login form -->       
            <form action="Login1.jsp" class="form p-5" method="post">
              <div class="row mt-3">
                <div class="col-12">
                  <label for="username">Email</label>
                  <input type="text" class="form-control" name="email"/>
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-12">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" name="password"/>
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-1">
                  <input type="checkbox" name="remember" id="remember" />
                </div>
                <div class="col-11">
                  <label for="password">Remember me</label>
                </div>
              </div>
              <input
                type="submit"
                value="Sign in"
                class="btn-block rounded mt-5 bt-login"
              />
            </form>
<!-- End of Login form -->       

     
          </div>
        </div>
        <div class="row justify-content-center align-items-center display-none" id="signup">
          <div class="col-md-12">
            <form action="" class="form p-5">
              <div class="row mt-3">
                <div class="col-6">
                  <label for="username">Firstname*</label>
                  <input type="text" class="form-control" />
                </div>
                <div class="col-6">
                  <label for="username">Lastname*</label>
                  <input type="text" class="form-control" />
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-md-3">
                  <label for="password">Email*</label>
                </div>
                <div class="col-md-9">
                  <input type="text" class="form-control" />
                </div>
                <!-- <input type="text" class="form-control"> -->
              </div>
              <div class="row mt-3">
                <div class="col-md-3">
                  <label for="password">Password*</label>
                </div>
                <div class="col-md-9">
                  <input type="password" class="form-control" />
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-1">
                  <input type="checkbox" name="remember" id="remember" />
                </div>
                <div class="col-11">
                  <label for="password">Remember me</label>
                </div>
              </div>
              <input
                type="submit"
                value="Submit"
                class="btn-block rounded mt-5 bt-login"
              />
            </form>
          </div>
        </div>
      </div>
    </div>
 
</div> 
 <div class="footer">
  <p>ⓒ Copyright Ice Cream. All rights Reserved</p>
</div>
    <script src="/IceCream/assets/js/seller_login.js"></script>
    <script>
      $(document).ready(function () {
        $("#btn-2").click(function () {
          $("#btn-2").addClass("active");
          $("#btn-1").removeClass("active");
          $("#signin").toggleClass("display-none");
          $("#signup").removeClass("display-none");
        });
        $("#btn-1").click(function () {
          $("#btn-1").addClass("active");
          $("#btn-2").removeClass("active");
          $("#signin").removeClass("display-none");
          $("#signup").addClass("display-none");
        });
      });
    </script>
  </body>
</html>