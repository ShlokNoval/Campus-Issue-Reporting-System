package p1;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

	    String u = req.getParameter("username");
	    String p = req.getParameter("password");

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");

	        Connection con = DriverManager.getConnection(
	            "jdbc:mysql://localhost:3306/campus_db",
	            "root",
	            "12345"
	        );

	        PreparedStatement ps = con.prepareStatement(
	            "INSERT INTO users(username,password) VALUES(?,?)"
	        );

	        ps.setString(1, u);
	        ps.setString(2, p);

	        ps.executeUpdate();

	        res.sendRedirect("login.html");

	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	}
}