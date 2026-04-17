<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<style>
body {
    font-family: Arial;
    background: #f5f7fa;
    margin: 0;
}

/* Header */
.header {
    background: #4CAF50;
    color: white;
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header button {
    margin-left: 10px;
    background: white;
    color: #4CAF50;
    border: none;
    padding: 8px 12px;
    border-radius: 5px;
    cursor: pointer;
}

.container {
    max-width: 900px;
    margin: 20px auto;
}

.card {
    background: white;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

input, select, textarea {
    width: 100%;
    padding: 8px;
    margin-top: 5px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

button {
    background: #4CAF50;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.issue {
    border-left: 5px solid #4CAF50;
    padding-left: 10px;
    margin-bottom: 15px;
}

.pending { color: red; font-weight: bold; }
.resolved { color: green; font-weight: bold; }

img {
    margin-top: 10px;
    border-radius: 5px;
}
</style>

<%
String user = (String) session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.html");
}
%>

<!-- HEADER -->
<div class="header">
    <h2>Welcome <%= user %></h2>
    <div>
        <a href="admin.html"><button>Admin</button></a>
        <a href="logout"><button>Logout</button></a>
    </div>
</div>

<div class="container">

<div class="card">
<h3>Submit Issue</h3>

<form action="submitIssue" method="post" enctype="multipart/form-data">

<label>Contact</label>
<input type="text" name="contact">

<label>Issue Type</label>
<select name="type">
    <option>water</option>
    <option>wifi</option>
    <option>electricity</option>
    <option>other</option>
</select>

<label>Description</label>
<textarea name="desc"></textarea>

<label>Upload Image</label>
<input type="file" name="image">

<button type="submit">Submit Issue</button>
</form>
</div>

<div class="card">
<h3>All Issues</h3>

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
String status = rs.getString("status");
%>

<div class="issue">
<b>User:</b> <%= rs.getString("username") %><br>
<b>Issue:</b> <%= rs.getString("issue_type") %><br>
<b>Description:</b> <%= rs.getString("description") %><br>
<b>Contact:</b> <%= rs.getString("contact") %><br>
<b>Priority:</b> <%= rs.getString("priority") %><br>

<b>Status:</b>
<span class="<%= status.equals("Resolved") ? "resolved" : "pending" %>">
    <%= status %>
</span>

<%
String img = rs.getString("image");
if(img != null && !img.equals("")) {
%>
<br>
<img src="<%= request.getContextPath() %>/uploads/<%= img %>" width="150">
<%
}
%>

</div>

<%
}
%>

</div>
</div>