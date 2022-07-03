<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                String cod = request.getParameter("cod");
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://localhost:3306/cursojsp";
                String user = "root";
                String password = "lalr";

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    st.executeUpdate("DELETE FROM usuarios WHERE codUsuario= '"+cod+"'");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    st.close();
                    rs.close();
                    con.close();
                } catch (Exception e) {
                    out.print(e + "");
                }
        %>
    </body>
</html>
