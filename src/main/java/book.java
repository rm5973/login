import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/book"})
public class book extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
       String mname= req.getParameter("movieName").replaceAll(" ","").toLowerCase();
       //System.out.println(mname);
        RequestDispatcher rs= req.getRequestDispatcher("seatbooking.jsp");
        req.setAttribute("moviename", mname);
        try {
            req.setAttribute("resultset", data(mname));

        } catch (ClassNotFoundException e) {
            
            e.printStackTrace();
        } catch (SQLException e) {
            
            e.printStackTrace();
        }
        rs.forward(req, resp);
    
    }

    protected ResultSet data(String mname) throws SQLException, ClassNotFoundException{
Connection con=  jdbcconnection.con("movie");
String sqlString="select * from "+mname;
PreparedStatement p= con.prepareStatement(sqlString);

return p.executeQuery();

        

    }

}
