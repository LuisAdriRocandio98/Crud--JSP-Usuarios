<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="assets/css/style.css">
        <link rel="icon" href="iconos/agregar.png">
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

        <h1 align="center" class="py-4">Registro de Usuarios</h1>
        <div class="container">
            <form class="row g-3 needs-validation" novalidate method="POST">
                <div class="col-md-4">
                    <label for="validationCustom01" class="form-label">CÓDIGO</label>
                    <input type="text" class="form-control" id="validationCustom01" name="txtCodigo" maxlength="4" minlength="4" required>
                    <div class="valid-feedback">
                        Correcto!
                    </div>
                    <div class="invalid-feedback">
                        Campo obligatorio.
                    </div>
                </div>
                <div class="col-md-4">
                    <label for="validationCustom02" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="validationCustom02" name="txtNombre" required>
                    <div class="valid-feedback">
                        Correcto!
                    </div>
                    <div class="invalid-feedback">
                        Campo obligatorio.
                    </div>
                </div>
                <div class="col-md-4">
                    <label for="validationCustom02" class="form-label">Edad</label>
                    <input type="text" class="form-control" id="validationCustom02" name="txtEdad" required>
                    <div class="valid-feedback">
                        Correcto!
                    </div>
                    <div class="invalid-feedback">
                        Campo obligatorio.
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="validationCustom04" class="form-label">Sexo</label>
                    <select class="form-select" id="validationCustom04" name="txtSexo" required>
                        <option selected disabled value="">Selecciona...</option>
                        <option value="M">Mujer</option>
                        <option value="H">Hombre</option>
                    </select>
                    <div class="valid-feedback">
                        Correcto!
                    </div>
                    <div class="invalid-feedback">
                        Por favor Selecciona tu sexo
                    </div>
                </div>
                <div class="col-md-4">
                    <label for="validationCustom05" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="validationCustom05" name="txtPassword" required minlength="10" maxlength="10">
                    <div class="invalid-feedback">
                        Por favor ingresa una contraseña mínimo 10 carácteres
                    </div>
                    <div class="valid-feedback">
                        Correcto!
                    </div>
                </div>
                <div class="col-12">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                        <label class="form-check-label" for="invalidCheck">
                            Aceptas los terminos y Condiciones
                        </label>
                        <div class="valid-feedback">
                            Correcto!
                        </div>
                        <div class="invalid-feedback">
                            Debe Aceptar antes de continuar
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <input class="btn btn-primary" type="submit" name="btnGuardar"
                           value="Guardar Usuario">
                </div>
            </form>

            <div class="col-12 py-4">
                <a href="index.jsp"><input class="btn btn-primary" value="Volver al Inicio"></a>
            </div>

        </div>

        <%
            if (request.getParameter("btnGuardar") != null) {
                String cod = request.getParameter("txtCodigo");
                String nom = request.getParameter("txtNombre");
                int edad = Integer.parseInt(request.getParameter("txtEdad"));
                String sexo = request.getParameter("txtSexo");
                String pass = request.getParameter("txtPassword");

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
                    st.executeUpdate("INSERT INTO usuarios VALUES('" + cod + "','" + nom + "'," + edad + ",'" + sexo + "','" + pass + "')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    st.close();
                    rs.close();
                    con.close();
                } catch (Exception e) {
                    out.print(e + "");
                }
            }
        %>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="assets/js/style.js"></script>
    </body>
</html>
