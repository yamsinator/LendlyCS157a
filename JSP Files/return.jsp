<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Return Completed</title>
    <link rel="stylesheet" href="style2.css">
</head>
<body>
    <h1 class="container">Successfully Returned your Order!</h1>
    <div class="homeButton">
        <button type="button" class="cancelbtn"><a class="navbar" href="SignedHomePage.jsp">Return to Home</a></button>
    </div>

    <%
    /* Obtain information from the listing creation form to send to MySQL Database */
    String serialNum = request.getParameter("serialNumber");

    /* Initializing database */
    String db = "project_tables";
    String url = "jdbc:mysql://localhost:3306/project_tables?autoReconnect=true&useSSL=false";
    String userName = "root";
    String pass = "fitlife";

    /* Try/Catch block to execute updates to the table when the user updates their listing */
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, userName, pass);

        

        try {
            String queryCheck = "SELECT status FROM listings WHERE serial_num = ? ";
            PreparedStatement pstmtCheck = con.prepareStatement(queryCheck);
            pstmtCheck.setString(1, serialNum);
            ResultSet rsCheck = pstmtCheck.executeQuery();
            if(rsCheck.next()) {
                /* Checks if status of the item is active (1) and if it is change it to 0 for returns */
                /* Otherwise it will display an error saying that the item has already been returned */
                if(rsCheck.getString(1).equals("1")) {
                    /* Prepare the statements */
                    String updateListingsSQL = "UPDATE listings SET status = '0' WHERE serial_num = ?";

                    PreparedStatement updateListingsStmt = con.prepareStatement(updateListingsSQL);

                    /* Set the parameters for the prepared statements */
                    updateListingsStmt.setString(1, serialNum);

                    /* Execute the update in the listings table to make it available again for rent */
                    updateListingsStmt.executeUpdate();
                }
                else {
                    response.sendRedirect("returnedItem.html");
                }
            }
        }
        catch (Exception e) {
            out.println(e);
        }
    } catch (Exception e) {
        out.println(e);
    }
    %>

</body>
</html>
