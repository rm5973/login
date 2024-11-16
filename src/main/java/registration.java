import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register") // Correct URL mapping
public class registration extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String fname = req.getParameter("firstname");
        String lname = req.getParameter("lastname");
        String phone = req.getParameter("phone");
        String usernameEmail = req.getParameter("usernameEmail");
        String password = req.getParameter("password");

        try {
            if (register(fname, lname, phone, usernameEmail, password)) {
                // Redirect to login page if registration is successful
                res.sendRedirect("login.jsp");
            } else {
                PrintWriter out = res.getWriter();
                out.println("User not created");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred during registration");
        }
    }

    private boolean register(String fname, String lname, String phone, String usernameEmail, String password) throws ClassNotFoundException, SQLException {
        // Load the MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Establish a connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "root");

        // Use a prepared statement to safely insert data
        String query = "INSERT INTO registration (firstname, lastname, phno, username, password) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, fname);
        pstmt.setString(2, lname);
        pstmt.setString(3, phone);
        pstmt.setString(4, usernameEmail);
        pstmt.setString(5, password);

        // Execute the update and check if one row was inserted
        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0;
    }
}
