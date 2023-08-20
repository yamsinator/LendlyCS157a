<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang = "en">

<head>
    <meta charset = "UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device=width,initial-scale=1.0">
    <title>Cart</title>
    
    <link rel="stylesheet" href="listings.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<%
String username = (String)session.getAttribute("user"); //retreives session info of user
if(username == null) {
    response.sendRedirect("logInPage.html"); //redirects back to login page if not the user
}
%>
<body>
    <header class="header1">
  <a href="SignedHomePage.jsp" class="logo">Lendly</a>
  <nav class="navbar">
    <a href="SignedHomePage.jsp" >Home</a>
   
    <a href="userListings.jsp" >View Listings</a>
    <a href="orderPage.jsp" >Check Order</a>
    <a href="userProfile.jsp">Profile</a>
    <a href="logOut.jsp" >Log Out</a>
    <a href="#" class="active"><i class="fa fa-shopping-cart"></i></a>
</nav>
    </header>

    <table border="0" align="center" style="text-align:center; margin:auto;">
			<caption><h1> </h1></caption>
			<thead>
				<tbody>
				<tr class="info">
					<th>Brand</th>
					<th>Device Type</th>
					<th>Description</th>
					<th>Price</th>
					<th>Condition</th>
					<th>Start Date</th>
					<th>Return Date</th>
          <th>Renter</th>
				</tr>
			</thead>
 <%

    
    String serialNumber = request.getParameter("serialNum");

    String db = "project_tables";
    String url = "jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false";
    String userName = "root";
    String pass = "fitlife";

    try {
      java.sql.Connection con;
      Class.forName("com.mysql.cj.jdbc.Driver");
      con = DriverManager.getConnection(url, userName, pass);

    // Use PreparedStatement with a placeholder for the parameter
    String query = "SELECT DISTINCT brand, device_type, list_description, price, device_cond, date_start, date_return, username, serial_num FROM listings JOIN userregister WHERE listings.email = userregister.email AND serial_num = ?";
    PreparedStatement pstmt = con.prepareStatement(query);
    pstmt.setString(1, serialNumber); // Set the parameter value
    ResultSet rs = pstmt.executeQuery();
    
    while (rs.next()) {
%>
    <tr class="info">
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td class="price">$<%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(7)%></td>
        <td><%=rs.getString(8)%></td>
        <td><form action="checkout.jsp" method="post">
            <input type="hidden" value="<%=rs.getString(9)%>" name="serialNumber">
            <button type="submit" class="button">Checkout</button>
            </form>
        </td>
        <td><form action="removeCart.jsp" method="post">
            <input type="hidden" value="<%=rs.getString(9)%>" name="serialNumber">    
            <button type="submit" class="removebtn">Remove</button>
            </form>
        </td>
    </tr>
<%
    }
    pstmt.close();
    
    //checks if the serial number is not already in the cart
    String queryCheck = "SELECT COUNT(*) FROM shopping_cart WHERE serial_num = ?";
    PreparedStatement pstmtCheck = con.prepareStatement(queryCheck);
    pstmtCheck.setString(1, serialNumber);
    ResultSet rsCheck = pstmtCheck.executeQuery();
    if(rsCheck.next() && rsCheck.getInt(1) == 0){//if there is a next row and nothing there
        //inserts serial num in cart if not already in
        String insertQuery = "INSERT INTO shopping_cart(serial_num) VALUES(?)";
        PreparedStatement pstmtInsert = con.prepareStatement(insertQuery);
        pstmtInsert.setString(1, serialNumber); // Set the parameter value
        pstmtInsert.executeUpdate();
        pstmtInsert.close();
    }
    pstmtCheck.close();

    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>
