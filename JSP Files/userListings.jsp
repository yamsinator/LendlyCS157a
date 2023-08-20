<%@page import="java.sql.*"%>
<html>
    <head>
        <title>Search Results</title>
    </head>
	<style>	
		.sort-arrow {
				display: none; /*hide arrow default */
				width: 0;
				height: 0;
				border-left: 5px solid transparent;
				border-right: 5px solid transparent;
			}
			
			.sort-arrow.show {
				display: inline-block; /* arrow is now shown when .show class is added */
			}
			
			.sort-arrow.asc {
				border-bottom: 5px solid transparent;
				border-top: 5px solid #2BCC0E;
			}
			
			.sort-arrow.desc {
				border-top: 5px solid transparent;
				border-bottom: 5px solid #2BCC0E;
			}
			
	</style>
	<link rel="stylesheet" href="listings.css">
	<link rel="stylesheet" href="style2.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <body> 

		<header class = "header1">
			<a class = "logo" >Listings created by you</a>
			
			<nav class="navbar">
				<a href="SignedHomePage.jsp" >Home</a>
				
				<a href="#" class="active">View Listings</a>
				<a href="orderPage.jsp" >Check Order</a>
				<a href="userProfile.jsp">Profile</a>
				<a href="logOut.jsp" >Log Out</a>
				<a href="#"><i class="fa fa-shopping-cart"></i></a>
			</nav>
		
	</header>

	<%
	/* Change variable names to connect to local database */
	String db = "project_tables";

	/* Also change url link here to correct DB */ 
	String url = "jdbc:mysql://localhost:3306/project_tables?autoReconnect=true&useSSL=false";
	String userName = "root";

	/* Change password to your password */
	String pass = "La911200";

	/* Get the username from the session */
	String username = (String)session.getAttribute("user");

	/* Check if the user is logged in */
	if(username == null) {
		response.sendRedirect("logInPage.html");
	} else {
		/* Change database name, user, and password before running on local machine */
		try {
			java.sql.Connection con;
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, userName, pass); 
%>

<!-- Creates the table for the user-created listings -->
<table id="rentedTable" border="0" align="center" style="text-align:center; margin:auto;">
	<caption><h1>Your Devices Being Rented</h1></caption>
	<thead>
		<tbody>
		<tr class="info">
			<th>Listing</th>
			<th>Customer</th>
			<th>Serial Number</th>
			<th>Brand</th>
			<th>Device Type</th>
			<th>Listing Description</th>
			<th>Model Name</th>
			<th>Price <span ></span></th>
			<th>Condition</th>
			<th>Start Date</th>
			<th>Return Date</th>
		</tr>
	</thead>

	<%
	Statement stmt = con.createStatement();

	ResultSet rs= stmt.executeQuery("SELECT listing_id, serial_num, brand, device_type, list_description, model_name, price, device_cond, date_start, date_return FROM listings JOIN userregister WHERE listings.status = '1' AND userregister.username LIKE '"+username+"' ") ;
	if(!rs.isBeforeFirst() ) { // if nothing in table
  %>
  <tr>
	<td colspan="11" style="text-align: center; font-size: 25px; color: #2BCC0E; margin-bottom: 75px; margin-top: 75px; text-decoration: none; font-weight: 600;">
	  No devices currently on rent  
	</td>
  </tr>
  <%
} else {

	while(rs.next()) {
%>
	<!-- THIS WILL PRINT OUT THE LISTINGS FROM THE USER -->
<tr class="info">
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td>
	<td class="price">$<%=rs.getString(7)%></td>
	<td><%=rs.getString(8)%></td>
	<td><%=rs.getString(9)%></td>
	<td><%=rs.getString(10)%></td>
</tr>    
</tbody>
<%
}}
%>
</table>

	<!-- Creates the table for the user-created listings -->
	<table id="searchTable" border="0" align="center" style="text-align:center; margin:auto;">
		<caption><h1>Your Listings</h1></caption>
		<thead>
			<tbody>
			<tr class="info">
				<th>Listing</th>
				<th>Serial Number</th>
				<th>Brand</th>
				<th>Device Type</th>
				<th>Listing Description</th>
				<th>Model Name</th>
				<th id="price-header">Price <span class="sort-arrow"></span></th>
				<th>Condition</th>
				<th>Start Date</th>
				<th>Return Date</th>
			</tr>
		</thead>

   <%
				Statement stmt2 = con.createStatement();

				ResultSet rs2 = stmt2.executeQuery("SELECT listing_id, serial_num, brand, device_type, list_description, model_name, price, device_cond, date_start, date_return FROM listings JOIN userregister WHERE userregister.username LIKE '"+username+"' ") ;
				while(rs2.next()) {
	%>
				<!-- THIS WILL PRINT OUT THE LISTINGS FROM THE USER -->
			<tr class="info">
				<td><%=rs2.getString(1)%></td>
				<td><%=rs2.getString(2)%></td>
				<td><%=rs2.getString(3)%></td>
				<td><%=rs2.getString(4)%></td>
				<td><%=rs2.getString(5)%></td>
				<td><%=rs2.getString(6)%></td>
				<td class="price">$<%=rs2.getString(7)%></td>
				<td><%=rs2.getString(8)%></td>
				<td><%=rs2.getString(9)%></td>
				<td><%=rs2.getString(10)%></td>
				<td>
					<form action="updateListing.jsp">
						<input style="display: none" value="<%=rs2.getString(2)%>" name="serial"> 
						<button type="submit" class="button">Modify Listing</button>
					</form>
				</td>
			</tr>    
	<%			
				}
			}
			catch (Exception e) {
				System.out.println(e);
			}
		}
	%>
	</tbody>
		</table>
		<script>
			$(document).ready(function() {
				//set to true initially for original table ordering
				let asc = true;
			
				$("#price-header").on("click", function() {
					//retrieve rows from the table body, except for header row
					let rows = $('#searchTable tbody  tr').get();
			
					//sort based on price
					rows.sort(function(a, b) {
						let A = parseFloat($(a).children('td').eq(6).text().replace('$', ''));
						let B = parseFloat($(b).children('td').eq(6).text().replace('$', ''));
			
						if(A < B) {
							return asc ? -1 : 1;
						}
						if(A > B) {
							return asc ? 1 : -1;
						}
						return 0;    
					});
			
					//updates direction of arrow based on sorted
				 $("#price-header .sort-arrow").addClass('show');
				if(asc) {
					$("#price-header .sort-arrow").removeClass('desc').addClass('asc');
				} else {
					$("#price-header .sort-arrow").removeClass('asc').addClass('desc');
				}
			
					asc = !asc;
					//append rows after sorting
					$.each(rows, function(index, row) {
						$('#searchTable').children('tbody').append(row);
					});
				});
			});
			</script>
    </body>
</html>
