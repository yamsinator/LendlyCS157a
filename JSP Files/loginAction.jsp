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
    String uname = request.getParameter("username");
    String psw = request.getParameter("pass");
	

	/* Change database name, user, and password before running on local machine */
	try {

		java.sql.Connection con;
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url, userName, pass); 

		Statement stmt = con.createStatement();
		
		/* out.println(db + " database successfully opened.<br/><br/>"); */

		/* Change name of table in this line */
	    ResultSet rs = stmt.executeQuery("SELECT username, password FROM userRegister WHERE username = '"+uname+"' "  );
        if(rs.next()) {
			/* If username matches check password */
            if(rs.getString(1).equals(uname)) {
				
				/* If password matches, redirect to main page */
                if(rs.getString(2).equals(psw)){
					session.setAttribute("user", uname);
                    response.sendRedirect("SignedHomePage.jsp");
                }
                else {
                    response.sendRedirect("loginFailed.html");
                }
            }
        }
		else {
			response.sendRedirect("loginFailed.html");
		}
	}
	catch (Exception e) {
		System.out.println(e);
	}
%>
