<%-- 
    Document   : menu
    Created on : 28/10/2023, 22:20:12
    Author     : jmess
--%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="modelo.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Menú</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="stylesheet" href="style_menu.css">
    <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Montserrat&display=swap" rel="stylesheet">
</head>
<body>

<div class="header">
    <img src="img/logo.png" alt="alt" width=150px/>
</div>

<div class="topnav">
  <a href="#">BIENVENIDO, ${username.username}</a>
  <a href="contac.jsp">Contactanos</a>
  <a href="info.jsp">¿Quiénes somos?</a>
  <a href="index.jsp" style="float:right">Cerrar Sesión</a>
 
</div>

<div class="row">
  <div class="leftcolumn">
    <div class="card">
      <h2>USUARIOS ACTIVOS</h2>
      <table class="table table-striped">
                <thead>
                <th>Usuarios activos</th>
                <th>Puesto</th>
                </thead>
                <tbody id="tbl_proveedores">
                    <%
                        Users user = new Users();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = user.leer();
                        for (int t=0;t<tabla.getRowCount();t++ ){
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0)+ ">");
                            out.println("<td>" + tabla.getValueAt(t, 1)+"</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2)+ "</td>");
                            out.println("</tr>");
                        }
                        %>
                </tbody>
            </table>
    </div>
    <div class="card">
      <h2>Cursos</h2>
        <ul class="registro">
            <li><a href='curso1.jsp'>Curso 1</a></li>
            <li><a href='curso2.jsp'>Curso 2</a></li>
            <li><a href='curso3.jsp'>Curso 3</a></li>
            <li><a href='curso4.jsp'>Curso 4</a></li>
            <li><a href='curso5.jsp'>Curso 5</a></li>
            <li><a href='curso6.jsp'>Curso 6</a></li>
            <li><a href='curso7.jsp'>Curso 7</a></li>
        </ul>
    </div>
  </div>
  <div class="rightcolumn">
    <div class="card">
      <h2>Registros</h2>
        <ul class="registro">
            <li><a href='empleado.jsp'>Empleados</a></li>
            <li><a href='usuarios.jsp'>Usuarios</a></li>
            <li><a href='documentos.jsp'>Documentos</a></li>
        </ul>
    </div>
    <div class="card_calendar">
      <div class="calendar">
        <h1 id="month-year"></h1>
        <table>
            <tr>
                <th>Domingo</th>
                <th>Lunes</th>
                <th>Martes</th>
                <th>Miércoles</th>
                <th>Jueves</th>
                <th>Viernes</th>
                <th>Sábado</th>
            </tr>
        </table>
    </div>
    <script src="script.js"></script>
    </div>
  </div>
</div>

<div class="footer">
  <p>&copy; 2023 [Nombre de la Empresa]. Todos los derechos reservados.</p>
</div>

</body>
</html>