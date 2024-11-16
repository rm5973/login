import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/login" })
public class login extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String user = req.getParameter("search"); 
        
        String pass = req.getParameter("password");
        try {
            if (search(user,pass)) {
               
               
                RequestDispatcher rd = req.getRequestDispatcher("/seatbooking.jsp");
                rd.forward(req, res);
            }

            else {
                res.setContentType("text/html");
                PrintWriter out = res.getWriter();
                out.print("<h3 style=' color:red' >password and username not found</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
                rd.include(req, res);
            }
        } catch (ServletException e) {
            
            e.printStackTrace();
        } catch (IOException e) {
            
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    
    
    
    }
    protected boolean search(String name,String pass) throws Exception{


        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "root");
        PreparedStatement pd=con.prepareStatement("Select * from registration ");
        ResultSet rs=pd.executeQuery("select * from registration");

        while(rs.next()){

            System.out.println(rs.getString("username"));
           
            if(name.equals (rs.getString("username")) && pass.equals(rs.getString("password")))return true;
           else continue;
           
        }
        return false;
    }

}
