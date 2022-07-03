package Utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/bd_ventas";
    String user = "root";
    String password = "lalr";
    
    public Connection getconexion(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user,password);
        }catch (Exception e){
            e.printStackTrace();
        }
        return con;
    }

}
