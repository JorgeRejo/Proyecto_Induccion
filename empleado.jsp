<%-- 
    Document   : empleados
    Author     : jmess
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo_empleado.Empleado"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="style_usuario.css">
        <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Montserrat&display=swap" rel="stylesheet">
        <title>Empleados_web</title>
    </head>
    <body>
        <div class="header">
            <img src="img/logo.png" alt="alt" width=150px/>
        </div>
        <div class="topnav">
            <a href="menu.jsp"><img src="img/casa.png"/></a>
        </div>
        <h1>Listado de Empleados</h1>
        <p></p>
        <!-- Button to Open the Modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalEmpleado" onclick="limpiar()">Nuevo</button>

<!-- The Modal -->
<div class="modal" id="modalEmpleado">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal bodygem  -->
      <div class="modal-body">
          <form action="sr_empleado" metohod="post" class="form-group">
                            <label for="lbl_id"><b>ID </b></label>
                            <input type="text" name="id" id="id"class="form-control"  value="0" readonly>
                            <label for="lbl_codigo"> <b>Código Empleado: </b> </label>
                            <input type="text" name="codigoEmpleado" id="codigoEmpleado" required="required" class="form-control" placeholder="Ejemplo: C0001">
                            <label for="lbl_nombre"> <b>Nombre: </b></label>
                            <input type="text" name="nombre" id="nombre" required="required" class="form-control" placeholder="Ejemplo: Nombre1 Nombre2">
                            <label for="lbl_nombre"> <b>Apellido: </b></label>
                            <input type="text" name="nombre" id="nombre" required="required" class="form-control" placeholder="Ejemplo: Nombre1 Nombre2">
                            <label for="lbl_nombre"> <b>DPI: </b></label>
                            <input type="text" name="DPI" id="DPI" required="required" class="form-control" placeholder="Ejemplo: 0000000000302">
                            <label for="lbl_direccion"> <b>Dirección: </b></label>
                            <input type="text" name="direccion" id="direccion" required="required" class="form-control" placeholder="Ejemplo:  # Casa, Calle, Zona, Ciudad">
                            <label for="lbl_telefono"> <b> Teléfono: </b></label>
                            <input type="tel" name="telefono" id="telefono" required="required" class="form-control" placeholder="Ejemplo: 7888-7888">
                            <label for="lbl_puesto"> <b>Puesto:</b> </label>
                            <input type="text" name="puesto" id="puesto" required="required" class="form-control" placeholder="Ejemplo: Gerente">
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
<p></p>
            <table>
                <thead>
                <th>ID </th>
                <th>Código </th>
                <th>Nombre </th>
                <th>Apellido </th> 
                <th>DPI </th>
                <th>Direccion</th>
                <th>Telefono</th> 
                <th>Puesto</th> 
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>C0001</td>
                        <td>Jennifer Messalina</td>
                        <td>De León Velásquez</td>
                        <td>3060130530302</td>
                        <td>Jocotenango</td>
                        <td>12345678</td>
                        <td>Administrador</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>C0002</td>
                        <td>Kevin</td>
                        <td>Almengor</td>
                        <td>3130530302</td>
                        <td>Jocotenango</td>
                        <td>315912345678</td>
                        <td>Empleado</td>
                    </tr>
                </tbody>
                <tbody id="tbl_empleado">
                    <%
                        Empleado empleado = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = empleado.leer();
                        for (int t=0;t<tabla.getRowCount();t++ ){
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0)+ ">");
                            out.println("<td>" + tabla.getValueAt(t, 1)+"</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2)+ "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3)+ "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4)+ "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5)+"</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6)+ "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7)+ "</td>");
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
        $("#codigoEmpleado").val('');
        $("#nombre").val('');
        $("#apellido").val('');
        $("#DPI").val('');
        $("#direccion").val('');
        $("#telefono").val('');
        $("#puesto").val('');
 
    }
   
    $('#tbl_empleado').on('click','tr td',function(evt){
       var target, id, codigoEmpleado, nombre, apellido, DPI, telefono, direccion, puesto; 
       target = $(event.target);
       id = target.parent().data('id');
       codigoEmpleado = target.parent("tr").find("td").eq(0).html();
       nombre = target.parent("tr").find("td").eq(1).html();
       apellido = target.parent("tr").find("td").eq(2).html();
       DPI = target.parent("tr").find("td").eq(3).html();
       direccion = target.parent("tr").find("td").eq(4).html();
       telefono = target.parent("tr").find("td").eq(5).html();
       puesto = target.parent("tr").find("td").eq(6).html();
 
       $("#id").val(id);
       $("#codigoEmpleado").val(codigoEmpleado);
       $("#nombre").val(nombre);
       $("#apellido").val(apellido);
       $("#direccion").val(direccion);
       $("#telefono").val(telefono);
       $("#puesto").val(puesto);
       $("#modalEmpleado").modal('show');
    });
        </script>
    </body>
</html>
