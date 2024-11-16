import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/logout"} ,name="logout")
public class logout extends HttpServlet{
    
    @Override 
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
      HttpSession s=req.getSession();
      s.invalidate();
      
     RequestDispatcher rd= req.getRequestDispatcher("index.html");
        rd.forward(req, res);
    }
    
}
