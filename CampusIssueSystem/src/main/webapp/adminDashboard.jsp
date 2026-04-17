<%@ page import="java.sql.*" %>

<style>
body {
    font-family: Arial;
    background: #f5f7fa;
    margin: 0;
}

.header {
    background: #2196F3;
    color: white;
    padding: 15px;
    display: flex;
    justify-content: space-between;
}

.header button {
    background: white;
    color: #2196F3;
    border: none;
    padding: 8px;
    border-radius: 5px;
}

.container {
    max-width: 900px;
    margin: 20px auto;
}

.card {
    background: white;
    padding: 15px;
    margin-bottom: 15px;
    border-radius: 10px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
}

button {
    background: #2196F3;
    color: white;
    border: none;
    padding: 8px;
    border-radius: 5px;
}

select {
    padding: 5px;
}
</style>

<div class="header">
    <h2>Admin Dashboard</h2>
    <div>
        <a href="login.html"><button>User Login</button></a>
    </div>
</div>

<div class="container">

<%
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/campus_db",
    "root",
    "12345"
);

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM issues");

while(rs.next()){
%>

<div class="card">
<b>User:</b> <%= rs.getString("username") %><br>
<b>Issue:</b> <%= rs.getString("issue_type") %><br>
<b>Status:</b> <%= rs.getString("status") %><br>

<form action="updateStatus" method="post">
    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

    <select name="status">
        <option>Pending</option>
        <option>Resolved</option>
    </select>

    <button type="submit">Update</button>
</form>
</div>

<%
}
%>

</div>