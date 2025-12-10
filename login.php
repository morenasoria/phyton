<?php
require_once 'componentes/conexion.php';
if ($_SERVER['REQUEST_METHOD'] && isset($_POST['ingresar'])){
    $errores = '';
    $email = $conexion->real_escape_string($_POST['email-usuario']);
    $contraseña = $conexion->real_escape_string($_POST['contraseña-usuario']);
    


    if (empty($email) || empty($contraseña)){
        $errores .= "<div class='alert alert_danger'>PORFAVOR,COMPLETAR LOS CAMPOS</div>";
    } else {
        $frase = $conexion->prepare("SELECT * FROM usuarios WHERE usuarios.email= ?");
        $frase->bind_param('s',$email);
        $frase->execute();

        $usuario = $frase->get_result()->fetch_assoc();

        if ($usuario) {
            if (password_verify($contraseña, $usuario['contraseña'])) {
                session_start();
                $_session["userid"] = $usuario['id_usuario'];
                $_session["rol"] = $usuario['rol'];
                $_SESSION['nombre'] = $usuario['nombre'];

                $conexion->close();
                header('location;index.php');
                exit();

            } else{
                $errores .= "<div class='alert alert-danger'>email o contraseña incorrecta</div>";
            }
        }else {
            $errores .="div class='alert alert-danger'>el usuario no existe </div>";
        }
    }   
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Document</title>
</head>
<body>
    <form method="POST" action="login.php" >
        <?php require_once 'componentes/comp-form-login.php'; ?>
        <input type="submit" value="ingresar" name="ingresar" id="ingrsar">

    </form>

    <div>
        <p>¿ NO TIENES USUARIO?registrate aqui: <a href="registro.php">aqui</a></p>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
















