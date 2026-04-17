package p1;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.rmi.Naming;

@WebServlet("/submitIssue")
@MultipartConfig
public class IssueServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        String type = req.getParameter("type");
        String desc = req.getParameter("desc");
        String contact = req.getParameter("contact");

        // Safe fallback
        if(type == null) type = "unknown";
        if(desc == null) desc = "no description";
        if(contact == null || contact.equals("")) contact = "not provided";

        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("user");

        try {
            // 🔥 RMI CALL
            PriorityService service = (PriorityService) Naming.lookup("rmi://localhost:1099/PriorityService");
            String priority = service.getPriority(type);

            // 📁 FILE UPLOAD (SAFE)
            Part filePart = req.getPart("image");
            String fileName = null;

            if(filePart != null && filePart.getSize() > 0) {
                fileName = filePart.getSubmittedFileName();

                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                filePart.write(uploadPath + File.separator + fileName);
            }

            // DB
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/campus_db",
                "root",
                "12345"
            );

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO issues(username, issue_type, description, priority, contact, image, status) VALUES(?,?,?,?,?,?,?)"
            );

            ps.setString(1, user);
            ps.setString(2, type);
            ps.setString(3, desc);
            ps.setString(4, priority);
            ps.setString(5, contact);
            ps.setString(6, fileName); // can be NULL
            ps.setString(7, "Pending");

            ps.executeUpdate();

            res.sendRedirect("dashboard.jsp");

        } catch(Exception e) {
            e.printStackTrace();

            PrintWriter out = res.getWriter();
            out.println("ERROR OCCURRED:<br>");
            out.println(e.toString());
        }
    }
}