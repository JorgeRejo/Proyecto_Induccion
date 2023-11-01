<%-- 
    Document   : usuarios
    Created on : 17/10/2021, 15:12:00
    Author     : E7440
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="modelo.Users"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style_usuario.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Montserrat&display=swap" rel="stylesheet">
        <title>Usuarios_web</title>
    </head>
    <body>
        <div class="header">
            <img src="img/logo.png" alt="alt" width=150px/>
        </div>
        <div class="topnav">
            <a href="menu.jsp"><img src="img/casa.png"/></a>
        </div>
        <p>
        <h1>Fomulario de Usuarios</h1>
        <p>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalUsers" onclick="limpiar()">Nuevo</button>

<!-- The Modal -->
<div class="modal" id="modalUsers">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal bodygem  -->
      <div class="modal-body">        
        <form action="" metohod="post" class="form-group">
            <label for="lbl_id"><b>ID </b></label>
            <input type="text" name="id" id="id"class="form-control"  value="0" readonly>
            <label for="lbl_username"> <b>Username: </b> </label>
            <input type="text" name="user" id="user" required="required" class="form-control" placeholder="username">
            <label for="lbl_password"> <b>Password: </b></label>
            <input type="text" name="password" id="password" required="required" class="form-control" placeholder="password">
            <label for="lbl_cargo"> <b>Cargo: </b></label>
            <select id="drop_cargo" name="drop_cargo">
                <option value="1">Administrador</option>
                <option value="2">Empleado</option>
            </select>
            <br>
            
            <br>
                            <button value="agregar" name="btn_agregar" id="btn_agregar" class="btn btn-primary btn-lg"> Agregar </button>
                            <button value="modificar" name="btn_modificar" id="btn_modificar" class="btn btn-success btn-lg"> Modificar </button>
                            <button value="eliminar" name="btn_eliminar" id="btn_eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false"> Eliminar </button>
                            <button type="button" class="btn btn-warning btn-lg" data-dismiss="modal">Cerrar</button>
          
                            
          </form>
          <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
          <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
      </div>
    </div>
  </div>
</div>
            <table>
                <thead>
                <th>Username </th>
                <th>Puesto </th>
                </thead>
                <tbody id="tbl_usuarios">
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
          <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
          <script type="text/javascript">
    function limpiar(){
        $("#id").val(0);
        $("#nombre").val('');
        $("#drop_cargo").val('');
        $("#drop_cargo").val(drop_cargo);
        
    }
   
    $('#tbl_usuarios').on('click','tr td',function(evt){
       var target, id,  username, password, estado, drop_cargo, drop_estado; 
       target = $(event.target);
       id = target.parent().data('id');
       username = target.parent("tr").find("td").eq(1).html();
       password = target.parent("tr").find("td").eq(2).html();
       drop_cargo = target.parent("tr").find("td").eq(4).html();
 
       $("#id").val(id);
       $("#username").val(username);
       $("#password").val(password);
       $("#drop_cargo").val(drop_cargo);
       $("#modalUsers").modal('show');
    });
        </script>
    </body>
</html>
