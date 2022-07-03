<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal - Control</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="assets/css/style.css">
        <link rel="icon" href="iconos/grupo.png">
    </head>
    <body class="body">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#FBC02D">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><h2 class="nav-title">Control de usuarios</h2></a>
                <a class="navbar-brand">
                    <img src="iconos/grupo_1.png" width="40">
                </a>
            </div>
        </nav>


        <h1 align="center" class="py-4">Listado de Usuarios</h1>

        <div class="container">
            <table class="table table-responsive." width="600">
                <thead style="text-align: center;">
                    <tr bgcolor="orange">
                        <th colspan="5">Control de usuarios</th>
                        <th>Agregar Nuevo Usuario<a href="nuevo.jsp"><img src="iconos/agregar.png" width="50"></a></th>
                    </tr>
                    <tr bgcolor="skyblue" style="text-align: center;">
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Edad</th>
                        <th>Sexo</th>
                        <th>Password</th>
                        <th>operaciones</th>
                    </tr>
                </thead>
                <%
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
                        rs = st.executeQuery("SELECT * FROM usuarios");
                        while (rs.next()) {
                %>
                <tbody style="text-align: center;">
                    <tr>
                        <th><%=rs.getString(1)%></th>
                        <th><%=rs.getString(2)%></th> 
                        <th><%=rs.getString(3)%></th> 
                        <th><%=rs.getString(4)%></th> 
                        <th><%=rs.getString(5)%></th> 
                        <th>
                            <a href="editar.jsp?cod=<%=rs.getString(1)%>">
                                <img src="iconos/lapiz.png" width="50">
                            </a>
                            <a href="eliminar.jsp?cod=<%=rs.getString(1)%>">
                                <img src="iconos/eliminar.png" width="50">
                            </a>
                        </th>
                    </tr>
                </tbody>
                <%
                        }
                        st.close();
                        rs.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %> 
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    </body>
</html>
