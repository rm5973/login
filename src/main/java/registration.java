import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = "/register")
public class registration extends HttpServlet{
    

protected void service(HttpServletResponse res,HttpServletRequest req)throws IOException,ServletException, ClassNotFoundException, SQLException{

String fname=req.getParameter("firstname");
String lname=req.getParameter("lastname");
String phone=req.getParameter("phone");
String usernameEmail=req.getParameter("usernameEmail");
String password=req.getParameter("password");



 boolean b=register(fname,lname,phone,usernameEmail,password);
 boolean l=login(usernameEmail, password);
 


}

protected boolean register(String fname,String lname,String phone,String usernameEmail,String password) throws ClassNotFoundException, SQLException{

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "root");
    PreparedStatement p=con.prepareStatement("insert into registration ("+fname+","+lname+","+phone+","+usernameEmail+","+password+")");
    return p.execute();
    

}

  protected boolean login(String usernameEmail,String password) throws ClassNotFoundException, SQLException{
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "root");
    PreparedStatement p=con.prepareStatement("insert into registration ("+usernameEmail+","+password+")");
    return p.execute();
    

  }



}
