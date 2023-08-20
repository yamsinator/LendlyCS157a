<!DOCTYPE html>
<html lang = "en">

<head>
    <meta charset = "UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device=width,initial-scale=1.0">
    <title>Email for Orders</title>
    
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
            <a href="SignedHomePage.jsp" >Home</a>
            <a href="userListings.jsp">View Listings</a>
            <a href="logOut.jsp" >Log Out</a>
            <a href="#"><i class="fa fa-shopping-cart"></i></a>
        </nav>
    </header>

        <div class="container1">
            <div class="title">Find your Orders</div>
            <div class="container" style="background-color:transparent">
              <div class="input-field">
                <form action="orderPage2.jsp" method="post">
                  <label for="type"><b>Enter Email Used for the order</b></label>
                  <input type="text" placeholder="Enter email" name="email" required>
                  <button type="submit">Check Listings</button>
                </form>
              </div>
          </div>
        </div>

</body>
</html>
