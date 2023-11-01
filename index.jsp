<%-- 
    Document   : index
    Author     : jmess
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sistema | Iniciar Sesión</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Montserrat&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center align-items-center vh-100">
            <div class="col-md-6">
                <div class="text-center mb-4">
                    <img src="img/logo.png" alt="logo" class="img-fluid">
                    <h1 class="mt-3">BIENVENIDO</h1>
                </div>
                <form action="login_servlet?action=login" class="login-form" method="post">
                    <div class="mb-3">
                        <input type="text" name="username" id="username" class="form-control" placeholder="Usuario" required>
                    </div>
                    <div class="mb-3">
                        <input type="password" name="password" id="password" class="form-control" placeholder="Contraseña" required>
                    </div>
                    <button type="submit" name="login" value="login" class="btn btn-primary btn-block">Iniciar sesión</button>
                    <div class="message mt-3">
                        <p>${msje}</p>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>

