<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style2.css">
<%
String username = (String)session.getAttribute("user"); //retreives session info of user
if(username == null) {
    response.sendRedirect("logInPage.html"); //redirects back to login page if not the user
}
%>
<body>
<header class="header">
  <a href="SignedHomePage.jsp" class="logo">Lendly</a>
  <nav class="navbar">
    <a href="SignedHomePage.jsp" >Home</a>
    <a href="userListings.jsp" >View Listings</a>
    <a href="orderPage.jsp" >Check Order</a>
    <a href="userProfile.jsp"class="active">Profile</a>
    <a href="logOut.jsp" >Log Out</a>
    <a href="#"><i class="fa fa-shopping-cart"></i></a>
</nav>
</header>
<%
  /* Obtain information from the listing update form to send to MySQL Database */

	/* Change variable names to connect to local database */
	String db = "project_tables";

	/* Also change url link here to correct DB */ 
	String url = "jdbc:mysql://localhost:3306/project_tables?autoReconnect=true&useSSL=false";
	String userName = "root";

	/* Change password to your password */
	String pass = "fitlife";
	
	/* Change database name, user, and password before running on local machine */
	try {
		java.sql.Connection con;
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url, userName, pass); 


    /* Query Statements to update the database after user modifies the listing */
		// Statement stmt1 = con.createStatement();
		// Statement stmt2 = con.createStatement();
		// Statement stmt3 = con.createStatement();
		// Statement stmt4 = con.createStatement();
		// Statement stmt5 = con.createStatement();
		
    /* Query Statement to pull info from database in order for user to update information */
    String query = "SELECT * FROM userregister WHERE username = ?";
    PreparedStatement pstmt = con.prepareStatement(query);
    pstmt.setString(1, username); // Set the parameter value
    ResultSet rs = pstmt.executeQuery();

    while(rs.next()) {
      /* This HTML form will fill out the update listing form with the listing info to be modified */
%>
<form action="updateProfileSuccess.jsp" method="post">
    <div class="container1">
      <div class="title">Update Your Profile</div>
        <div class="user-details">
          <input type="hidden" value="<%=rs.getString("userID")%>" name="userID">
    
    <div class="input-field">
    <label for="fname"><b>First Name</b></label>
    <input type="text" value="<%=rs.getString("first_name")%>" placeholder="First Name" name="firstName" required>
  </div>

  <div class="input-field">
    <label for="lname"><b>Last Name</b></label>
    <input type="text" value="<%=rs.getString("last_name")%>" placeholder="Last Name" name="lastName" required>
    </div>

    <div class="input-field">
    <label for="phone"><b>Phone Number</b></label>
    <input type="text" value="<%=rs.getString("phone")%>" placeholder="Phone Number" name="phone"/>
    </div>

    <div class="input-field">
    <label for="email"><b>Email</b></label>
<input type="text" value="<%=rs.getString("email")%>" placeholder="Email" name="email" required>
</div>

<div class="input-field">
<label for="address"><b>Address</b></label>
<input type="text" value="<%=rs.getString("address")%>" placeholder="Address" name="address" required>
</div>
<div class="input-field">
<label for="apt"><b>Apt, P.O. Box, Unit</b></label>
<input type="text" value="<%=rs.getString("apt")%>" placeholder="Apt, P.O. Box, Unit" name="apt"/>
</div>

<div class="input-field">
<label for="city"><b>City</b></label>
<input type="text" value="<%=rs.getString("city")%>" placeholder="City" name="city" required>
</div>

<div class="input-field">
<label for="state"><b>State</b></label>
<input type="text" value="<%=rs.getString("state")%>" placeholder="State" name="state" required>
</div>
<div class="input-field">
<label for="zip"><b>Zip Code</b></label>
<input type="text" value="<%=rs.getString("zip")%>" placeholder="Zip Code" name="zip" required>
</div>
<div class="input-field">
<label for="username"><b>Username</b></label>
<input type="text" value="<%=rs.getString("username")%>" placeholder="Username" name="username" required readonly>
</div>
<div class="input-field">
<label for="password"><b>Password</b></label>
<input type="password" value="<%=rs.getString("password")%>" placeholder="Password" name="password" required readonly>
</div>
</div>
      <div class="button-wrapper">
      <button type="submit">Update Your Profile</button>
      </div>
    </div>

  
    <div class="container" style="background-color:#081b29">
      <div class="button-wrapper">
      <button type="button" class="cancelbtn">Cancel</button>
      </div>
    </div>
  </form>

<%
    }
  pstmt.close();
  con.close();
	}

  
	catch (Exception e) {
		System.out.println(e);
	}
%>
</body>
</html>
