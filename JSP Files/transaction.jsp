<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Completed</title>
    <link rel="stylesheet" href="style2.css">
</head>
<body>
    <h1 class="container">Successfully placed your Order!</h1>
    <div class="homeButton">
        <button type="button" class="cancelbtn"><a class="navbar" href="SignedHomePage.jsp">Return to Home</a></button>
    </div>

    <%
    /* Obtain information from the listing creation form to send to MySQL Database */
    String first_name = request.getParameter("firstName");
    String last_name = request.getParameter("lastName");
    String address = request.getParameter("addr");
    String address2 = request.getParameter("addr2");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String ccn = request.getParameter("ccn");
    String zip = request.getParameter("zip");
    String exp = request.getParameter("expire");
    String ccv = request.getParameter("ccv");
    String serialNum = request.getParameter("serialNumber");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    /* Initializing database */
    String db = "project_tables";
    String url = "jdbc:mysql://localhost:3306/project_tables?autoReconnect=true&useSSL=false";
    String userName = "root";
    String pass = "La911200";

    /* Try/Catch block to execute updates to the table when the user updates their listing */
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, userName, pass);

        /* Prepare the statements */
        String insertCustomerSQL = "INSERT INTO customer(first_name, last_name, address, apt, city, state, zip, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertOrdersSQL = "INSERT INTO orders(device_serial_num, email) VALUES (?, ?)";
        String insertTransactionSQL = "INSERT INTO transaction(customer_id, card_number, expire, ccv) VALUES (?, ?, ?, ?)";
        String updateListingsSQL = "UPDATE listings SET status = '1' WHERE serial_num = ?";
        String insertRentsTo = "INSERT INTO rentsto(customer_id) VALUES(?)";

        PreparedStatement insertCustomerStmt = con.prepareStatement(insertCustomerSQL, Statement.RETURN_GENERATED_KEYS);
        PreparedStatement insertOrdersStmt = con.prepareStatement(insertOrdersSQL);
        PreparedStatement insertTransactionStmt = con.prepareStatement(insertTransactionSQL);
        PreparedStatement updateListingsStmt = con.prepareStatement(updateListingsSQL);
        PreparedStatement insertRentsToStmt = con.prepareStatement(insertRentsTo);
        

        /* Set the parameters for the prepared statements */
        insertCustomerStmt.setString(1, first_name);
        insertCustomerStmt.setString(2, last_name);
        insertCustomerStmt.setString(3, address);
        insertCustomerStmt.setString(4, address2);
        insertCustomerStmt.setString(5, city);
        insertCustomerStmt.setString(6, state);
        insertCustomerStmt.setString(7, zip);
        insertCustomerStmt.setString(8, phone);
        insertCustomerStmt.setString(9, email);

      

        /* Initializing customerId */
        int customerId = 0;
        /* Execute the prepared statements */
        try {
            insertCustomerStmt.executeUpdate();
            ResultSet generatedKeys = insertCustomerStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                customerId = generatedKeys.getInt(1);
            } else {
                out.println("Failed to fetch customerId.");
            }
        } catch (SQLException e) {
            out.println("Failed to execute insertCustomerStmt: " + e.getMessage());
        }
        insertOrdersStmt.setString(1, serialNum);
        insertOrdersStmt.setString(2, email);


        if (customerId != 0) {
            insertTransactionStmt.setInt(1, customerId);
            insertRentsToStmt.setInt(1, customerId);
            insertTransactionStmt.setString(2, ccn);
            insertTransactionStmt.setString(3, exp);
            insertTransactionStmt.setString(4, ccv);
            insertTransactionStmt.executeUpdate();
        } else {
            out.println("Failed to get customer_id. The transaction could not be created.");
        }
updateListingsStmt.setString(1, serialNum);


        insertOrdersStmt.executeUpdate();
        updateListingsStmt.executeUpdate();

        

    } catch (Exception e) {
        out.println(e);
    }
    %>

</body>
</html>
