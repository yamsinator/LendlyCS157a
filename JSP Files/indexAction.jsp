<%@page import="java.sql.*"%>

<%
	/* Change variable names to connect to local database */
	String db = "project_tables";

	/* Also change url link here to correct DB */ 
	String url = "jdbc:mysql://localhost:3306/project_tables?autoReconnect=true&useSSL=false";
	String userName = "root";

	/* Change password to your password */
	String pass = "fitlife";
	
/* Obtain information from the signUpPage form to send to MySQL Database */

	String fname = request.getParameter("firstName");
	String lname = request.getParameter("lastName");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	String addr2 = request.getParameter("addr2");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String zip = request.getParameter("zip");
	String email = request.getParameter("email");
	String psw = request.getParameter("pass");
	String uname = request.getParameter("username");
	

	/* Change database name, user, and password before running on local machine */
	try {

		java.sql.Connection con;
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url, userName, pass); 

		Statement stmt = con.createStatement();

			/* Change name of table in this line */
		stmt.executeUpdate("INSERT INTO userregister(first_name, last_name, phone, address, apt, city, state, zip, email, username, password) VALUES('"+fname+"', '"+lname+"', '"+phone+"', '"+addr+"', '"+addr2+"', '"+city+"', '"+state+"', '"+zip+"', '"+email+"', '"+uname+"', '"+psw+"') ");
		response.sendRedirect("registerSuccess.html");
	}

	catch (Exception e) {
		System.out.println(e);
	}
%>
