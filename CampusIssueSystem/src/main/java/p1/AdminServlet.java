package p1;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/adminLogin")
public class AdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        String u = req.getParameter("u");
        String p = req.getParameter("p");

        if(u.equals("admin") && p.equals("admin123")) {
            res.sendRedirect("adminDashboard.jsp");
        } else {
            res.getWriter().println("Invalid Admin Credentials");
        }
    }
}