<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device=width,initial-scale=1.0">
    <title>Profile Updated Successfully</title>
    <link rel="stylesheet" href="style2.css">
</head>
<body>
    <%
    /* Obtain information from the profile update form */
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String apt = request.getParameter("apt");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String zip = request.getParameter("zip");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    /* Database connection details */
    String db = "project_tables";
    String url = "jdbc:mysql://localhost:3306/project_tables?autoReconnect=true&useSSL=false";
    String userName = "root";
    String pass = "fitlife";
    
    /* Try/Catch block to execute the update to the table when user updates their profile */
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, userName, pass);
        
        /* Prepare the UPDATE query */
        String updateQuery = "UPDATE userregister SET first_name=?, last_name=?, phone=?, email=?, address=?, apt=?, city=?, state=?, zip=?, password=? WHERE username=?";
        PreparedStatement pstmt = con.prepareStatement(updateQuery);
        
        /* Set the parameters for the prepared statement */
        pstmt.setString(1, firstName);
        pstmt.setString(2, lastName);
        pstmt.setInt(3, Integer.parseInt(phone));
        pstmt.setString(4, email);
        pstmt.setString(5, address);
        pstmt.setString(6, apt);
        pstmt.setString(7, city);
        pstmt.setString(8, state);
        pstmt.setInt(9, Integer.parseInt(zip));
        pstmt.setString(10, password);
        pstmt.setString(11, username);
        
        /* Execute the update */
        pstmt.executeUpdate();
        
        /* Close the resources */
        pstmt.close();
        con.close();
    } catch (Exception e) {
        System.out.println(e);
    }
    %>

    <h1 class="container">Successfully Updated Your Profile!</h1>
    <div class="homeButton">
        <button type="button" class="cancelbtn"><a class="navbar" href="SignedHomePage.jsp">Return to Home</a></button>
    </div>
</body>
</html>
