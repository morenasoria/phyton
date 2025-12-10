<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// 1. Conexión a la base de datos ----------------------
$conexion = new mysqli("localhost", "root", "", "Turismo");

if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

// 2. Tomar el ID por GET ------------------------------
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($id <= 0) {
    die("ID inválido");
}

// 3. Preparar consulta --------------------------------
$sql = "SELECT * FROM paquete WHERE id_paquete = ?";

$query = $conexion->prepare($sql);

if (!$query) {
    die("Error en prepare(): " . $conexion->error);
}

// 4. Ejecutar consulta --------------------------------
$query->bind_param("i", $id);

$query->execute();

$resultado = $query->get_result();

// 5. Obtener datos ------------------------------------
$paquete = $resultado->fetch_assoc();

if (!$paquete) {
    die("No se encontró el paquete con ID $id");
}

// 6. Mostrar datos -------------------------------------
?>
<style>
    body {
        background: #f8f2e9; 
        
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        color: #5c4632; 
    }

    .navbar {
        width: 100%;
        background: #d4a373; 
        padding: 15px;
        font-size: 22px;
        font-weight: bold;
        color: white;
        text-align: left;
        padding-left: 25px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    }

    .container {
        width: 90%;
        max-width: 900px;
        margin: 40px auto;
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 4px 14px rgba(0,0,0,0.15);
    }

    .titulo {
        text-align: center;
        font-size: 32px;
        font-weight: bold;
        margin-bottom: 15px;
        color: #8c6241;
    }

    .imagen-paquete {
        width: 40%;
        border-radius: 12px;
        margin-bottom: 20px;
    }

    .info {
        font-size: 18px;
        line-height: 1.6;
    }

    .precio {
        font-size: 26px;
        font-weight: bold;
        color: #c85f00;
        margin-top: 10px;
    }

    .boton-volver {
        display: inline-block;
        background: #b08968;
        color: white;
        padding: 12px 22px;
        border-radius: 8px;
        text-decoration: none;
        font-size: 18px;
        margin-top: 30px;
    }

    .boton-volver:hover {
        background: #7f5539;
    }

</style>



<div class="navbar">
    JM Agencia de Viajes
</div>

<div class="container">
    
    <h1 class="titulo"><?php echo $paquete['nombre']; ?></h1>

    <img src="imagen/<?php echo $paquete['imagen']; ?>" class="imagen-paquete">
    

    <div class="info">
        <p><strong>Descripción:</strong> <?php echo $paquete['descripcion']; ?></p>
        <p><strong>Destino:</strong> <?php echo $paquete['nombre']; ?></p>
        <p><strong>Fecha de salida:</strong> <?php echo $paquete['fecha_salida']; ?></p>
        <p><strong>Fecha de regreso:</strong> <?php echo $paquete['fecha_regreso']; ?></p>
        <p class="precio">	 <?php echo number_format($paquete['precio'], 2); ?></p>
    </div>

    <a href="inicio.php" class="boton-volver">← Volver a los paquetes</a>

</div>


