import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/book/booknow"})
public class booknow extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        // Get the selected seats from the request
        String moviename=req.getParameter("moviename");
       
        String[] selectedSeats = req.getParameterValues("seat");

        if (selectedSeats != null && selectedSeats.length > 0) {
            // Update seat availability for each selected seat
            Arrays.stream(selectedSeats).forEach(seat -> {
                try {
                    updateSeat(seat,moviename);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });

            // Redirect to the movies list with a success message
            res.sendRedirect(req.getContextPath() + "/movieslist?successMessage=Booking successfully completed!");
        } else {
            // Redirect to the same page with an error message if no seats are selected
            res.sendRedirect(req.getContextPath() + "/book/select?errorMessage=No seats selected. Please try again!");
        }
    }

    // Method to update the seat availability in the database
    protected void updateSeat(String seat,String mname) throws ClassNotFoundException, SQLException {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection to the database
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie", "root", "root")) {
            String sqlQuery = "UPDATE "+mname+" SET availablity = ? WHERE seatnumber = ?";
            try (PreparedStatement ps = con.prepareStatement(sqlQuery)) {
                ps.setBoolean(1, false); // Mark the seat as unavailable (false)
                ps.setString(2, seat); // Set the seat number dynamically
                ps.executeUpdate();
                System.out.println("Seat updated: " + seat);
            }
        }
    }
}
