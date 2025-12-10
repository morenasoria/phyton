<?php
require_once 'componentes/conexion.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['ingresar'])) {
    $errores = '';
    $email = $conexion->real_escape_string($_POST['nombre-usuario']);
    $contraseña = $conexion->real_escape_string($_POST['contraseña']);

    if (empty($email) || empty($contraseña)) {
        $errores .= "<div class='alert alert_danger'>PORFAVOR,COMPLETAR LOS CAMPOS</div>";
    } else {
        $frase = $conexion->prepare('SELECT * FROM usuario WHERE usuario.email = ?');
        $frase->bind_param('s', $email);
        $usuario = $frase->execute();

        if ($query->get_result()->num_rows > 1) {
            $errores .= "<div class='alert alert-danger'>el usuario ya existe</div>";
        }
        echo $errores;

        print_r($usuario);

        if (empty($errores)) {
            $contra_hash = password_hash($contraseña, PASSWORD_BCRYPT);
            echo $contra_hash;
            $query = $conexion->prepare('INSERT INTO usuario (email, contraseña) VALUES (?,?)');
            $query->bind_param('ss', $email, $contra_hash);
            $sentencias = $query->execute();

            $query->close();
            $conexion->close();

            if ($sentencias) {
                $sucess = "<div class= 'alert alert-sucess'>usuario registrado correctamente</div>";
                header("Location:index.php");
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form method="POST" action="registro.php">
        <?php require_once 'componentes/comp-form-login.php'; ?>

        <label for="telefono">TELEFONO</label>
        <input type="text" name="telefono" id="telefono">

        <label for="nombre">nombre</label>
        <input type="text" name="nombre" id="nombre">

        <input type="submit" value="registrar" name="ingresar" id="ingresar">

    </form>
    <div>

    </div>
</body>

</html>