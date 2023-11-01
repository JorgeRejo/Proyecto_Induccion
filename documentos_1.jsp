<%-- 
    Document   : documentos
    Created on : 23/10/2023, 22:57:31
    Author     : kevin_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="style_usuario.css">
        <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Montserrat&display=swap" rel="stylesheet">
    <title>Documentos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
        <div class="header">
            <img src="img/logo.png" alt="alt" width=150px/>
        </div>
        <div class="topnav">
            <a href="menu_empleados.jsp"><img src="img/casa.png"/></a>
        </div>
    <h1>Listado de Documentos</h1>

    <!-- Button to Open the Modal -->
    <p>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalProveedor" onclick="limpiar()">Nuevo</button>

    <!-- The Modal -->
    <div class="modal" id="modalProveedor">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="sr_proveedor" method="post" class="form-group">
                        <label for="lbl_codigo"> <b>Código de Documento: </b> </label>
                        <input type="text" name="codigo" id="codigo" required="required" class="form-control" placeholder="Ejemplo: D0001">
                        <label for="lbl_nombre"> <b>Nombre: </b></label>
                        <input type="text" name="nombre" id="nombre" required="required" class="form-control" placeholder="Ejemplo: Nombre1">
                        <label for="lbl_descripcion"> <b>Descripción: </b></label>
                        <input type="text" name="descripcion" id="descripcion" required="required" class="form-control" placeholder="Ejemplo: Proceso de inducción">
                        <label for="lbl_puesto"> <b>Puesto: </b></label>
                        <input type="text" name="puesto" id="puesto" required="required" class="form-control" placeholder="Ejemplo: Administrador">
                        <label for="lbl_documento"> <b>Documento: </b></label>
                        <input type="file" name="documento" id="documento" class="form-control">
                        <br>
                        <button value="agregar" name="btn_agregar" id="btn_agregar" class="btn btn-primary btn-lg">Agregar</button>
                        <button value="modificar" name="btn_modificar" id="btn_modificar" class="btn btn-success btn-lg">Modificar</button>
                        <button value="eliminar" name="btn_eliminar" id="btn_eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                        <button type="button" class="btn btn-warning btn-lg" data-dismiss="modal">Cerrar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <table>
        <thead>
            <th>Código de Documento</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Puesto</th>
            <th>Documento</th>
        </thead>
        <tbody id="tbl_proveedores">
            <tr>
                <td>001</td>
                <td>Documento 1</td>
                <td>Descripción 1</td>
                <td>Puesto 1</td>
                <td><a href="documentos/PC.pdf" target="_blank">PDF 1</a></td>
            </tr>
            <tr>
                <td>002</td>
                <td>Documento 2</td>
                <td>Descripción 2</td>
                <td>Puesto 2</td>
                <td><a href="documentos/examen.pdf" target="_blank">PDF 2</a></td>
            </tr>
            <!-- Agrega más filas con información y enlaces a PDF según sea necesario -->
        </tbody>
    </table>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script type="text/javascript">
    </script>
</body>
</html>
