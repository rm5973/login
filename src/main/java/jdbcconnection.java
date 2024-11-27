import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class jdbcconnection {
    




static Connection con(String database) throws ClassNotFoundException, SQLException{
Class.forName("com.mysql.cj.jdbc.Driver");
return DriverManager.getConnection("jdbc:mysql://localhost:3306/"+database, "root", "root");
    

}

}
