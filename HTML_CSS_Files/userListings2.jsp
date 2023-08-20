<!DOCTYPE html>
<html lang = "en">

<head>
    <meta charset = "UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device=width,initial-scale=1.0">
    <title>Welcome Back to Lendly</title>
    
    <link rel="stylesheet" href="style2.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
  <%
       
  String username = (String)session.getAttribute("user"); //retreives session info of user
  if(username == null) {
      response.sendRedirect("logInPage.html"); //redirects back to login page if not the user
  }
%>
    <header class="header">
  <a href="SignedHomePage.jsp" class="logo">Lendly</a>
        <nav class="navbar">
            <a href="SignedHomePage.jsp" class="active">Home</a>
            <a href="logOut.jsp" >Log Out</a>
            <a href="orderPage.jsp">Check Order</a>
            <a href="#"><i class="fa fa-shopping-cart"></i></a>
        </nav>
    </header>

    <form action="userListings.jsp" method="post">
        <div class="container1">
            <div class="title">Find your Listings</div>
            <div class="container" style="background-color:transparent">
              <div class="button-wrapper">
                <button type="submit">Check Listings</button>
              </div>
          </div>
      </div>
  </form>

</body>
</html>
