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
            <a href="#" class="active"><i class="fa fa-shopping-cart"></i></a>
        </nav>
    </header>

    <table border="0" align="center" style="text-align:center; margin:auto;">
			<caption><h1> </h1></caption>
			<thead>
				<tbody>
				<tr class="info">
                    <th>Order Number</th>
					<th>Brand</th>
					<th>Device Type</th>
					<th>Description</th>
					<th>Price</th>
					<th>Condition</th>
					<th>Start Date</th>
					<th>Return Date</th>
                    <th>Serial Number</th>
				</tr>
			</thead>
 <%

    
    String email = request.getParameter("email");

    String db = "project_tables";
    String url = "jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false";
    String userName = "root";
    String pass = "fitlife";

    try {
      java.sql.Connection con;
      Class.forName("com.mysql.cj.jdbc.Driver");
      con = DriverManager.getConnection(url, userName, pass);

    // Use PreparedStatement with a placeholder for the parameter
    String query = "SELECT order_id, brand, device_type, list_description, price, device_cond, date_start, date_return, device_serial_num FROM(SELECT DISTINCT brand, device_type, list_description, price, device_cond, date_start, date_return, device_serial_num, orders.email, order_id FROM orders join listings WHERE orders.device_serial_num = listings.serial_num)test	WHERE test.email = ? ";
    
    PreparedStatement pstmt = con.prepareStatement(query);
    pstmt.setString(1, email); // Set the parameter value
    ResultSet rs = pstmt.executeQuery();
    
    while (rs.next()) {
%>
    <tr class="info">
        <td><%=rs.getString(1)%></td> <!-- orderID -->
        <td><%=rs.getString(2)%></td> <!-- brand -->
        <td><%=rs.getString(3)%></td> <!-- device_type -->
        <td><%=rs.getString(4)%></td> <!-- list_description -->
        <td class="price">$<%=rs.getString(5)%></td>  <!-- price -->
        <td><%=rs.getString(6)%></td>  <!-- device_cond -->
        <td><%=rs.getString(7)%></td> <!-- date_start -->
        <td><%=rs.getString(8)%></td>  <!-- date_return -->
        <td><%=rs.getString(9)%></td>  <!-- serialNum -->
        <td><form action="return.jsp" method="post">
          <input type="hidden" value="<%=rs.getString(9)%>" name="serialNumber">
          <button type="submit" class="button">Return Item</button>
          </form>
      </td>
    </tr>
<%
    }
    pstmt.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>
