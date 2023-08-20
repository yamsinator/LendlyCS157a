<!DOCTYPE html>
<html lang = "en">

<head>
    <meta charset = "UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device=width,initial-scale=1.0">
    <title>Welcome to Lendly</title>
    <link rel="stylesheet" href="homePageStyle.css">
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

        <form class="search-bar" action="homeSearchAction.jsp" method="post">
            <div class="search-bar">
                <input type="text" placeholder="Search for a product..." name="searchBar">
                <button type="submit">Search</button>
            </div>
        </form>

        <nav class="navbar">
            <a href="SignedHomePage.jsp"class="active" >Home</a>
            <a href="userListings.jsp" >View Listings</a>
            <a href="orderPage.jsp" >Check Order</a>
            <a href="userProfile.jsp">Profile</a>
            <a href="logOut.jsp" >Log Out</a>
            <a href="cart.jsp"><i class="fa fa-shopping-cart"></i></a>
        </nav>
    </header>

    <section class="home">
        <div class="home-content">
            <h1>Welcome Back, <%=username %>!</h1>
            <h3>Transform Your Idle Electronics into Extra Income</h3>
            <p><b>Upgrade Your Tech Experience without Breaking the Bank</b></p>
            <div class="btn-box">
                <a href="userListings.jsp">View Rentals</a>
                <a href="createListing.html">Create Listing</a>
            </div>
         
        </div>
    </section>
</body>
</html>
