<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style2.css">
<header class="header">
  <a href="SignedHomePage.jsp" class="logo">Lendly</a>
  <nav class="navbar">
	<a href="SignedHomePage.jsp">Home</a>
	<a href="logOut.jsp" >Log Out</a>
	<a href="userListings.jsp" >View Listings</a>
	<a href="orderPage.jsp" >Check Order</a>
	<a href="userProfile.jsp">Profile</a>
	<a href="#"><i class="fa fa-shopping-cart"></i></a>
</nav>
</header>
<body>
  <h1 class="container">Successfully Created your Listing!</h1>

<div class="homeButton">
  <button type="button" class="cancelbtn"><a class="navbar" href="SignedHomePage.jsp">Return to Home</a></button>
</div>
</body>
<%
	/* Change variable names to connect to local database */
	String db = "project_tables";

	/* Also change url link here to correct DB */ 
	String url = "jdbc:mysql://localhost:3306/project_tables?autoReconnect=true&useSSL=false";
	String userName = "root";

	/* Change password to your password */
	String pass = "fitlife";
	
/* Obtain information from the listing creation form to send to MySQL Database */
	String type = request.getParameter("elecType");
	String brand = request.getParameter("brand");
	String title = request.getParameter("listTitle");
	String model = request.getParameter("elecModel");
	String serialNum = request.getParameter("serialNum");
	String price = request.getParameter("elecPrice");
	String deviceCond = request.getParameter("elecCondition");
	String fromDate = request.getParameter("firstDate");
	String endDate = request.getParameter("secondDate");
	String userEmail = request.getParameter("email");
	
	/* Change database name, user, and password before running on local machine */
	try {
		java.sql.Connection con;
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url, userName, pass);
	
		// Create prepared statements
		PreparedStatement insertListingStmt = con.prepareStatement("INSERT INTO listings(serial_num, brand, device_type, list_description, model_name, price, device_cond, date_start, date_return, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		PreparedStatement insertDeviceStmt = con.prepareStatement("INSERT INTO device(serial_num, device_type) VALUES (?, ?)");
		PreparedStatement insertCreatesStmt = con.prepareStatement("INSERT INTO creates(listing_serial_num, creation_id) VALUES (?, (SELECT userID FROM userregister WHERE email = ?))");
		PreparedStatement insertDisplaysStmt = con.prepareStatement("INSERT INTO displays(listing_id, device_serial_num) VALUES ((SELECT listing_id FROM listings WHERE serial_num = ?), ?)");
		PreparedStatement insertCategoryStmt = con.prepareStatement("INSERT INTO category(serial_num, brand_name) VALUES (?, ?)");
		PreparedStatement insertBelongsToStmt = con.prepareStatement("INSERT INTO belongsto(device_serial_num, owner_email) VALUES (?, ?)");
		PreparedStatement insertOwns = con.prepareStatement("INSERT INTO owns(renter_seller_id, device_serial_num) VALUES((SELECT userID FROM userregister WHERE email = ?), ?)");
		PreparedStatement insertRenter = con.prepareStatement("INSERT INTO renter(seller_id, first_name, last_name, address) VALUES((SELECT userID FROM userregister WHERE email = ?), (SELECT first_name FROM userregister WHERE email = ?), (SELECT last_name FROM userregister WHERE email = ?), (SELECT address FROM userregister WHERE email = ?))");

		// Set values for prepared statements
		insertListingStmt.setString(1, serialNum);
		insertListingStmt.setString(2, brand);
		insertListingStmt.setString(3, type);
		insertListingStmt.setString(4, title);
		insertListingStmt.setString(5, model);
		insertListingStmt.setString(6, price);
		insertListingStmt.setString(7, deviceCond);
		insertListingStmt.setString(8, fromDate);
		insertListingStmt.setString(9, endDate);
		insertListingStmt.setString(10, userEmail);
		insertListingStmt.executeUpdate();
	
		insertDeviceStmt.setString(1, serialNum);
		insertDeviceStmt.setString(2, type);
		insertDeviceStmt.executeUpdate();
	
		insertCreatesStmt.setString(1, serialNum);
		insertCreatesStmt.setString(2, userEmail);
		insertCreatesStmt.executeUpdate();
	
		insertDisplaysStmt.setString(1, serialNum);
		insertDisplaysStmt.setString(2, serialNum);
		insertDisplaysStmt.executeUpdate();
	
		insertCategoryStmt.setString(1, serialNum);
		insertCategoryStmt.setString(2, brand);
		insertCategoryStmt.executeUpdate();
	
		insertBelongsToStmt.setString(1, serialNum);
		insertBelongsToStmt.setString(2, userEmail);
		insertBelongsToStmt.executeUpdate();

		insertOwns.setString(1, userEmail);
		insertOwns.setString(2, serialNum);
		insertOwns.executeUpdate();

		insertRenter.setString(1, userEmail);
		insertRenter.setString(2, userEmail);
		insertRenter.setString(3, userEmail);
		insertRenter.setString(4, userEmail);
	
		// Close prepared statements
		insertListingStmt.close();
		insertDeviceStmt.close();
		insertCreatesStmt.close();
		insertDisplaysStmt.close();
		insertCategoryStmt.close();
		insertBelongsToStmt.close();
		insertOwns.close();
		insertRenter.close();
	
		response.sendRedirect("listingSuccess.html");
	} catch (Exception e) {
		System.out.println(e);
	}
%>
