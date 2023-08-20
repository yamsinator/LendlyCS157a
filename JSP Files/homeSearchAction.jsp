<%@page import="java.sql.*"%>
<html lang ="en">
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
	<head>
		<meta charset = "UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device=width,initial-scale=1.0">
		<title>Search Results</title>
		<link rel="stylesheet" href="listings.css">
		<link rel="stylesheet" href="style2.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	</head>
	<body> 	<%
		String username = (String)session.getAttribute("user"); //retreives session info of user
	%>
    	<header class="header1">
			<%
        			if(username == null) {
				%>
				<a href = "HomePage.html" class="logo">Search Results</a>

				<%
					} else{
				%>
				<a href = "SignedHomePage.jsp" class="logo">Search Results</a>

				<%
					}
				%>
			<!-- Adding Search Bar if user wants to search for another item -->
			<form class="search-bar" action="homeSearchAction.jsp" method="post">
            	<div class="search-bar">
               	 	<input type="text" placeholder="Search for a product..." name="searchBar">
               		<button type="submit">Search</button>
            	</div>
        	</form>

			<nav class="navbar">
				<!-- Checks if user is logged in and if so it will hide these. Other wise it'll show. -->
				<%
        			if(username == null) {
				%>
			
				<a href="HomePage.html">Home</a>
						<a href="signUpPage.html" >Sign Up</a>
						<a href="logInPage.html" >Log In</a>
        		<%	
					}else {
					
    			%>
				<nav class="navbar">
					<a href="SignedHomePage.jsp" >Home</a>
					
					<a href="userListings.jsp" >View Listings</a>
					<a href="orderPage.jsp" >Check Order</a>
					<a href="userProfile.jsp">Profile</a>
					<a href="logOut.jsp" >Log Out</a>
				</nav>
				<%	
					}
					
    			%>
				
			
			</nav>
    	</header>
	
			<!-- Create the table to display the listings -->			
			<table id="searchTable" border="0" align="center" style="text-align:center; margin:auto;">
				<caption><h1> </h1></caption>
				<thead>
					<tbody>
            	<tr class="info">
                	<th>Brand</th>
					<th>Device Type</th>
					<th>Listing Description</th>
					<th id="price-header">Price <span class="sort-arrow"></span></th>
					<th>Condition</th>
					<th>Start Date</th>
					<th>Return Date</th>
					<th>Renter</th>
            	</tr>
				</thead>
        	<%
	        	/* Change variable names to connect to local database */
	        	String db = "project_tables";

	        	/* Also change url link here to correct DB */ 
	        	String url = "jdbc:mysql://localhost:3306/project_tables?autoReconnect=true&useSSL=false";
	        	String userName = "root";

	        	/* Change password to your password */
	        	String pass = "La911200";
	
            	/* Obtain information the user types to do a search for a product */
	        	String search = request.getParameter("searchBar");

	        	/* Change database name, user, and password before running on local machine */
	        	try {

		        	java.sql.Connection con;
		        	Class.forName("com.mysql.cj.jdbc.Driver");
		        	con = DriverManager.getConnection(url, userName, pass); 

		        	Statement stmt = con.createStatement();
					Statement stmt2 = con.createStatement();

			    	/* Change name of table in this line */
		        	ResultSet rs = stmt.executeQuery("SELECT DISTINCT brand, device_type, list_description, price, device_cond, date_start, date_return, username, serial_num FROM listings join userregister WHERE list_description LIKE '%"+search+"%' AND userregister.email = listings.email AND status = '0' ");
		        	
					/* Set rs in the session so it can be transfered to the cart */
					session.setAttribute("resultset", rs);
					while(rs.next()) {
				%>
				<!-- THIS WILL PRINT OUT THE LISTINGS THE USER SEARCHED -->
				<tr class="info">
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td name="description"><%=rs.getString(3)%></td>
					<td class="price">$<%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
					<!-- Step 1: Wrap the row with <form> element -->
					<form action="cart.jsp" method="post">
					  <!-- Step 2: Add hidden input fields -->
					  <input type="hidden" value="<%=rs.getString(9)%>" name="serialNum"></td>
					  <td><button type="submit">Add to Cart</button></td>
					</form>
				  </tr>
<%  
				}
	        }

	catch (Exception e) {
		System.out.println(e);
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
				let A = parseFloat($(a).children('td').eq(3).text().replace('$', ''));
				let B = parseFloat($(b).children('td').eq(3).text().replace('$', ''));
	
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