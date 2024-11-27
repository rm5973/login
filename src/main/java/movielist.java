import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/movieslist"})
public class movielist extends HttpServlet{
    @Override 
    protected void service(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException{
        
        HttpSession hs=req.getSession();
        try {
            hs.setAttribute("resultset", result());
        } catch (SQLException e) {
            
            e.printStackTrace();
        }
        req.getRequestDispatcher("/movieslist.jsp").forward(req, res);



    }

    protected ResultSet result() throws SQLException{
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "root");
    PreparedStatement pd=con.prepareStatement("Select * from movie ");
    return pd.executeQuery();


}

}
