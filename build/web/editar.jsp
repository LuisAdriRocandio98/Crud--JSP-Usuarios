<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="assets/css/style.css">
        <link rel="icon" href="iconos/lapiz.png">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#FBC02D">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><h2 class="nav-title">Control de usuarios</h2></a>
                <a class="navbar-brand">
                    <img src="iconos/grupo_1.png" width="40">
                </a>
            </div>
        </nav>
        <h1 align="center" class="py-4">Actualizar Usuario</h1>
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
                rs = st.executeQuery("SELECT * FROM usuarios WHERE codUsuario='" + cod + "'");
                while (rs.next()) {


        %>
        <div class="container">
            <form class="row g-3 needs-validation" novalidate>
                <div class="col-md-4">
                    <label for="validationCustom01" class="form-label">CÓDIGO</label>
                    <input type="text" class="form-control" id="validationCustom01" value="<%=rs.getString(1)%>" readonly="readonly" name="txtCodigo" maxlength="4" minlength="4" required>
                    <div class="valid-feedback">
                        Correcto!
                    </div>
                    <div class="invalid-feedback">
                        Campo obligatorio.
                    </div>
                </div>
                <div class="col-md-4">
                    <label for="validationCustom02" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="validationCustom02" value="<%=rs.getString(2)%>" name="txtNombre" required>
                    <div class="valid-feedback">
                        Correcto!
                    </div>
                    <div class="invalid-feedback">
                        Campo obligatorio.
                    </div>
                </div>
                <div class="col-md-4">
                    <label for="validationCustom02" class="form-label">Edad</label>
                    <input type="text" class="form-control" id="validationCustom02" value="<%=rs.getString(3)%>" name="txtEdad" required>
                    <div class="valid-feedback">
                        Correcto!
                    </div>
                    <div class="invalid-feedback">
                        Campo obligatorio.
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="validationCustom04" class="form-label">Sexo</label>
                    <input name="txtSexo" value="<%=rs.getString(4)%>" readonly>
                    <div class="valid-feedback">
                        Correcto!
                    </div>
                    <div class="invalid-feedback">
                        Por favor Selecciona tu sexo
                    </div>
                </div>
                <div class="col-md-4">
                    <label for="validationCustom05" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="validationCustom05" value="<%=rs.getString(5)%>" readonly="readonly" name="txtPassword" required minlength="10" maxlength="10">
                    <div class="invalid-feedback">
                        Por favor ingresa una contraseña mínimo 10 carácteres
                    </div>
                    <div class="valid-feedback">
                        Correcto!
                    </div>
                </div>
                <div class="col-12">
                    <input class="btn btn-primary" type="submit" name="btnEditar"
                           value="Editar Usuario">
                </div>
            </form>
                    
            <div class="col-12 py-4">
                <a href="index.jsp"><input class="btn btn-primary" value="Volver al Inicio"></a>
            </div>
        </div>

        <%
                }

            } catch (Exception e) {
            }
            if (request.getParameter("btnEditar") != null) {
                String codigo = request.getParameter("txtCodigo");
                String nom = request.getParameter("txtNombre");
                int edad = Integer.parseInt(request.getParameter("txtEdad"));
                String sexo = request.getParameter("txtSexo");
                String pass = request.getParameter("txtPassword");
                st.executeUpdate("UPDATE usuarios SET nomUsuario ='" + nom + "', edadUsuario=" + edad + ", sexoUsuario='" + sexo + "', passUsuario='" + pass + "' WHERE codUsuario='" + codigo + "'");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        %> 
    </body>
</html>
