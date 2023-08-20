<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style2.css">
<header class="header">
  <a href="HomePage.html" class="logo">Lendly</a>
  <nav class="navbar">
      <a href="SignedHomePage.jsp" >Home</a>
  </nav>
</header>
<body>
  <h1 class="container">Successfully Removed Item From Cart!</h1>

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
	
	/* Obtain information from the cart page to send to MySQL Database */
	String serialNumber = request.getParameter("serialNumber");

	//brand, device_type, list_description, price, device_cond, date_start, date_return, username, serial_num
	
	/* Change database name, user, and password before running on local machine */
	try {
		java.sql.Connection con;
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url, userName, pass); 

		String removeQuery = "DELETE FROM shopping_cart WHERE serial_num = ?";
		PreparedStatement pstmtRemove = con.prepareStatement(removeQuery);
		pstmtRemove.setString(1, serialNumber); // Set the parameter value
		pstmtRemove.executeUpdate();
		pstmtRemove.close();
	}

	catch (Exception e) {
		System.out.println(e);
	}
%>
