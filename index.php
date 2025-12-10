<?php
session_start();
require_once 'componentes/conexion.php';

?>



<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <title>JM Agencia de Viajes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #ffffff, #f2f2f2);
            margin: 0;
            padding: 0;
            text-align: center;
        }

        header {
            display: flex;
            align-items: center;
            background-color: #fff;
            padding: 15px 40px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        header img {
            height: 70px;
            margin-right: 20px;
        }

        header h1 {
            font-size: 22px;
            color: #b46c3f;
            margin: 0;
        }

        main {
            margin-top: 100px;
        }

        main h2 {
            color: #333;
            font-size: 26px;
        }

        main p {
            font-size: 18px;
            color: #555;
            width: 60%;
            margin: 20px auto;
        }

        .boton {
            display: inline-block;
            background-color: #b46c3f;
            color: white;
            padding: 15px 40px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-size: 18px;
            transition: 0.3s;
        }

        .boton:hover {
            background-color: #8b512e;
        }

        footer {
            margin-top: 100px;
            padding: 20px;
            background-color: #f2f2f2;
            color: #777;
        }
    </style>
</head>
<body>
    <?php
        if ($_SESSION['userid']){
            echo 'hola' . $_SESSION['nombre'];
            echo '<a href="Logout.php">CIERRE DE SESION</a>';
        } else {
            echo '<a href="Logout.php">INICIO DE SESION</a>';
        }
    ?>
    <header>
        <img src="./logo.jpg" alt="Logo JM Viajes">
        <h1>JM Agencia de Viajes</h1>
    </header>

    <main>
        <h2>Somos JM Viajes</h2>
        <p>Una empresa encargada de conseguir los mejores viajes para vos. 
        Ofrecemos experiencias únicas, destinos soñados y los precios más convenientes.</p>

        <div>
            
        
        </div>
        <a href="inicio.php" class="boton">INICIAR</a>
       
        

    </main>

    <footer>
        <?php echo date("Y"); ?> JM Agencia de Viajes - Todos los derechos reservados.
    </footer>

</body>
</html>
