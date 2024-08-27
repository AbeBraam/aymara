<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "aymara";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Establecer conjunto de caracteres utf8mb4
$conn->set_charset("utf8mb4");

// Ahora puedes realizar operaciones con la base de datos utilizando $conn
?>
