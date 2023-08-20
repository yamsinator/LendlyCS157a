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
    <a href="#"class="active"><i class="fa fa-shopping-cart"></i></a>
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

    String serialNumber = request.getParameter("serialNumber");

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
    </tr>
</table>
    <link rel="stylesheet" href="style2.css">
    <form action="transaction.jsp" method="post">
        <div class="container1">
            <div class="title">Enter your information</div>
            <div class="user-details">
              
            <div class="input-field">
              <label for="email"><b>Email</b></label>
              <input type="text" placeholder="Email" name="email" required>
          </div>
          <div class="input-field">
            <label for="phone"><b>Phone Number</b></label>
            <input type="text" placeholder="Phone Number" name="phone"/>
        </div>

                <div class="input-field">
                    <label for="fname"><b>First Name</b></label>
                    <input type="text" placeholder="First Name" name="firstName" required>
                </div>
                <div class="input-field">
                    <label for="lname"><b>Last Name</b></label>
                    <input type="text" placeholder="Last Name" name="lastName" required>
                </div>
             
                <div class="input-field">
                    <label for="address"><b>Address</b></label>
                    <input type="text" placeholder="Address" name="addr"/>
                </div>
                <div class="input-field">
                    <label for="address2"><b>Apt, P.O. Box, Unit</b></label>
                    <input type="text" placeholder="Apt, P.O. Box, Unit" name="addr2" optional/>
                </div>
                <div class="input-field">
                    <label for="city"><b>City</b></label>
                    <input type="text" placeholder="City" name="city"/>
                </div>
                <div class="input-field">
                    <label for="state"><b>State</b></label>
                    <input type="text" placeholder="State" name="state"/>
                </div>
                <div class="input-field">
                    <label for="ccn"><b>Credit Card Number</b></label>
                    <input id="ccn" type="text" inputmode="numeric" placeholder="xxxx xxxx xxxx xxxx" name="ccn">
                </div>
                <div class="input-field">
                    <label for="zip"><b>Zip Code</b></label>
                    <input type="text" placeholder="Zip Code" name="zip"/>
                </div>
                <div class="input-field">
                    <label for="ccn"><b>Expiration Date</b></label>
                    <input type="text" placeholder="YYYY-MM" name="expire"/>
                </div>
                <div class="input-field">
                    <label for="ccn"><b>CCV</b></label>
                    <input type="text" placeholder="CVC number" name="ccv"/>
                </div>
            </div>
            <div class="container" style="background-color:transparent">

            </div>
            <div class="button-wrapper">
                <button type="submit">Complete order</button>
            </div>
        </div>

        <input type="hidden" value="<%=rs.getString(9)%>" name="serialNumber">
    </form>
    
<%
    }
    pstmt.close();

    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>
