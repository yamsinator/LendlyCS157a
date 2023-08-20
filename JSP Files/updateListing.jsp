<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style2.css">
<body>
<header class="header">
  <a href="SignedHomePage.jsp" class="logo">Lendly</a>
  <nav class="navbar">
    <a href="SignedHomePage.jsp" >Home</a>
    <a href="userListings.jsp" >View Listings</a>
    <a href="orderPage.jsp" >Check Order</a>
    <a href="userProfile.jsp">Profile</a>
    <a href="logOut.jsp" >Log Out</a>
    <a href="#"><i class="fa fa-shopping-cart"></i></a>
</nav>
</header>
<%
  /* Obtain information from the listing update form to send to MySQL Database */
  String serial = request.getParameter("serial");

	/* Change variable names to connect to local database */
	String db = "project_tables";

	/* Also change url link here to correct DB */ 
	String url = "jdbc:mysql://localhost:3306/project_tables?autoReconnect=true&useSSL=false";
	String userName = "root";

	/* Change password to your password */
	String pass = "La911200";
	
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
    String query = "SELECT serial_num, brand, device_type, list_description, model_name, price, device_cond, date_start, date_return, listing_id FROM listings WHERE serial_num = ?";
    PreparedStatement pstmt = con.prepareStatement(query);
    pstmt.setString(1, serial); // Set the parameter value
    ResultSet rs = pstmt.executeQuery();

    while(rs.next()) {
      /* This HTML form will fill out the update listing form with the listing info to be modified */
%>
  <form action="updateSuccess.jsp" method="post">
  <div class="container3">
    <div class="title">Update Listing</div>
    <div class="input-field">

    <input style="display: none" value="<%=rs.getString(10)%>" name="list_id"> 

    <label for="type"><b>Electronic Type</b></label>
    <input type="text" value="<%=rs.getString(3)%>" placeholder="Phone, Laptop, Smartwatch, ..." name="elecType" required>
  </div>
    <label for="list"><b>Brand</b></label>
    <input type="text" value="<%=rs.getString(2)%>" placeholder="What brand is your device from?" name="brand" required>

    <label for="list"><b>Listing Title</b></label>
    <input type="text" value="<%=rs.getString(4)%>" placeholder="Put a description of your device" name="listTitle" required>

    <label for="elecModel"><b>Device Model</b></label>
    <input type="text" value="<%=rs.getString(5)%>" placeholder="iPhone 8 or Samsung S20 ..." name="elecModel" required>

    <label for="type"><b>Serial Number</b></label>
    <input type="text" value="<%=rs.getString(1)%>" placeholder="Serial Number" name="serialNum" required>
    
    <br><br>
    <label for="price"><b>Electronic Price</b></label>
    <input type="number" id="elecPrice" name="elecPrice" placeholder="$" value="<%=rs.getString(6)%>" required/>
    <br><br>
    
    <label for="condition"><b>Electronic Condition</b></label>
    <input type="text" value="<%=rs.getString(7)%>" placeholder="New, Used, Open box, ..." name="elecCondition"/>

    <label for="availability"><b>Availability Dates</b></label>
    <br><br>
    <label for="from">From </label>
    <input type="text" id="firstDate" value="<%=rs.getString(8)%>" placeHolder="YYYY-MM-DD" name="firstDate"/>
    <label for="to"> To </label>
    <input type="text" id="secondDate" value="<%=rs.getString(9)%>" placeHolder="YYYY-MM-DD" name="secondDate"/>
	<br><br>

    <label for="image"><b>Images</b></label>
    <br><br>
    <input type="file" id="img" name="img" multiple accept="image/*">
    <div class="button-wrapper">
    <button type="submit" class="update-button">Update Electronic Listing</button>
    </div>
  </div>
  <div class="container" style="background-color:#081b29">
    <div class="button-wrapper">
      <button type="button" class="cancelbtn"><a href="userListings.jsp">Cancel</a></button>
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
