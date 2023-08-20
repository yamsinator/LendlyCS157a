<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device=width,initial-scale=1.0">
    <title>Registered to Lendly</title>

    <link rel="stylesheet" href="style2.css">
</head>

<body>
    <h1 class="container">Successfully Updated your Listing!</h1>

    <div class="homeButton">
        <button type="button" class="cancelbtn"><a class="navbar" href="SignedHomePage.jsp">Return to Home</a></button>
    </div>

    <%
    /* Obtain information from the listing creation form to send to MySQL Database */
    String id = request.getParameter("list_id");
    String type = request.getParameter("elecType");
    String brand = request.getParameter("brand");
    String title = request.getParameter("listTitle");
    String model = request.getParameter("elecModel");
    String serialNum = request.getParameter("serialNum");
    String price = request.getParameter("elecPrice");
    String deviceCond = request.getParameter("elecCondition");
    String fromDate = request.getParameter("firstDate");
    String endDate = request.getParameter("secondDate");

    /* Initializing database */

    /* Change variable names to connect to local database */
    String db = "project_tables";

    /* Also change url link here to correct DB */
    String url = "jdbc:mysql://localhost:3306/project_tables?autoReconnect=true&useSSL=false";
    String userName = "root";

    /* Change password to your password */
    String pass = "fitlife";

    /* Try/Catch block to execute updates to the table when user updates their listing */
    /* Change database name, user, and password before running on a local machine */
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, userName, pass);

        Statement stmt = con.createStatement();
        Statement stmt2 = con.createStatement();
        Statement stmt3 = con.createStatement();
        Statement stmt4 = con.createStatement();
        Statement stmt5 = con.createStatement();

        /* Change name of table in this line */
        stmt.executeUpdate("UPDATE listings SET serial_num = '" + serialNum + "', brand = '" + brand + "', device_type = '" + type + "', list_description = '" + title + "', model_name= '" + model + "', price = '" + price + "', device_cond = '" + deviceCond + "', date_start = '" + fromDate + "', date_return = '" + endDate + "' WHERE listing_id = '" + id + "'");
        stmt2.executeUpdate("UPDATE device SET serial_num = '" + serialNum + "', device_type = '" + type + "'");
        stmt3.executeUpdate("UPDATE creates SET listing_serial_num = '" + serialNum + "' WHERE listing_id = '" + id + "'");
        stmt4.executeUpdate("UPDATE displays SET device_serial_num = '" + serialNum + "' WHERE listing_id = '" + id + "'");
        stmt5.executeUpdate("UPDATE category SET serial_num = '" + serialNum + "', brand_name = '" + brand + "' WHERE listing_id = '" + id + "'");
    } catch (Exception e) {
        System.out.println(e);
    }
    %>

</body>
</html>
