<?php
session_start();
include 'config/db.php';

if (!isset($_SESSION['id'])) {
    header("Location: index.html");
    exit();
}

$username = $_SESSION['username'];
$role = $_SESSION['role'];

// Configuración de paginación
$resultadosPorPagina = 10;
$paginaActual = isset($_GET['pagina']) ? (int) $_GET['pagina'] : 1;
$inicio = ($paginaActual - 1) * $resultadosPorPagina;

if (($role == 'maestro' || $role == 'admin') && $_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['subir_archivo'])) {
        $archivo = $_FILES['archivo'];
        $nombreArchivo = basename($archivo['name']);
        $rutaArchivo = "uploads/" . $nombreArchivo;

        if (move_uploaded_file($archivo['tmp_name'], $rutaArchivo)) {
            $sql = "INSERT INTO Archivos (nombre, ruta, activo) VALUES (?, ?, 1)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ss", $nombreArchivo, $rutaArchivo);

            if ($stmt->execute()) {
                $archivoMensaje = "Archivo subido exitosamente.";
            } else {
                $archivoMensaje = "Error al guardar la información del archivo en la base de datos.";
            }
            $stmt->close();
        } else {
            $archivoMensaje = "Error al subir el archivo.";
        }
    } elseif (isset($_POST['cambiar_estado_archivo'])) {
        $archivoId = $_POST['archivo_id'];
        $nuevoEstado = $_POST['nuevo_estado'];
        $sql = "UPDATE Archivos SET activo = ? WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ii", $nuevoEstado, $archivoId);
        if ($stmt->execute()) {
            $archivoMensaje = "Estado del archivo actualizado exitosamente.";
        } else {
            $archivoMensaje = "Error al actualizar el estado del archivo.";
        }
        $stmt->close();
    } elseif (isset($_POST['cambiar_nombre_archivo'])) {
        $archivoId = $_POST['archivo_id'];
        $nuevoNombre = $_POST['nuevo_nombre'];
        $sql = "UPDATE Archivos SET nombre = ? WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("si", $nuevoNombre, $archivoId);
        if ($stmt->execute()) {
            $archivoMensaje = "Nombre del archivo actualizado exitosamente.";
        } else {
            $archivoMensaje = "Error al actualizar el nombre del archivo.";
        }
        $stmt->close();
    } elseif (isset($_POST['agregar_palabra'])) {
        $aymara = $_POST['aymara'];
        $espanol = $_POST['espanol'];

        $sql = "INSERT INTO Diccionario (aymara, espanol, activo) VALUES (?, ?, 1)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $aymara, $espanol);

        if ($stmt->execute()) {
            $diccionarioMensaje = "Palabra agregada exitosamente.";
        } else {
            $diccionarioMensaje = "Error al agregar la palabra.";
        }
        $stmt->close();
    } elseif (isset($_POST['cambiar_estado_palabra'])) {
        $palabraId = $_POST['palabra_id'];
        $nuevoEstado = $_POST['nuevo_estado'];
        $sql = "UPDATE Diccionario SET activo = ? WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ii", $nuevoEstado, $palabraId);
        if ($stmt->execute()) {
            $diccionarioMensaje = "Estado de la palabra actualizado exitosamente.";
        } else {
            $diccionarioMensaje = "Error al actualizar el estado de la palabra.";
        }
        $stmt->close();
    } elseif (isset($_POST['editar_palabra'])) {
        $palabraId = $_POST['palabra_id'];
        $aymara = $_POST['aymara'];
        $espanol = $_POST['espanol'];
        $sql = "UPDATE Diccionario SET aymara = ?, espanol = ? WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssi", $aymara, $espanol, $palabraId);
        if ($stmt->execute()) {
            $diccionarioMensaje = "Palabra actualizada exitosamente.";
        } else {
            $diccionarioMensaje = "Error al actualizar la palabra.";
        }
        $stmt->close();
    } elseif ($role == 'admin' && isset($_POST['agregar_usuario'])) {
        $username = $_POST['username'];
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $role = $_POST['role'];

        $sql = "INSERT INTO Usuarios (username, password, role, activo) VALUES (?, ?, ?, 1)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sss", $username, $password, $role);

        if ($stmt->execute()) {
            $usuarioMensaje = "Usuario agregado exitosamente.";
        } else {
            $usuarioMensaje = "Error al agregar el usuario.";
        }
        $stmt->close();
    } elseif ($role == 'admin' && isset($_POST['cambiar_estado_usuario'])) {
        $usuarioId = $_POST['usuario_id'];
        $nuevoEstado = $_POST['nuevo_estado'];
        $sql = "UPDATE Usuarios SET activo = ? WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ii", $nuevoEstado, $usuarioId);
        if ($stmt->execute()) {
            $usuarioMensaje = "Estado del usuario actualizado exitosamente.";
        } else {
            $usuarioMensaje = "Error al actualizar el estado del usuario.";
        }
        $stmt->close();
    } elseif ($role == 'admin' && isset($_POST['editar_usuario'])) {
    $usuarioId = $_POST['usuario_id'];
    $username = $_POST['username'];
    $role = $_POST['role'];

    // Validación del nombre de usuario
        $sql = "UPDATE Usuarios SET username = ?, role = ? WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssi", $username, $role, $usuarioId);
        if ($stmt->execute()) {
            $usuarioMensaje = "Usuario actualizado exitosamente.";
            header("Location: " . $_SERVER['PHP_SELF']);
            exit();
        } else {
            $usuarioMensaje = "Error al actualizar el usuario.";
        }
        $stmt->close();
    }
}



// Búsqueda de palabras
$busqueda = isset($_GET['busqueda']) ? $_GET['busqueda'] : '';
$condicionBusqueda = $busqueda ? "AND (aymara LIKE '%$busqueda%' OR espanol LIKE '%$busqueda%')" : '';

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/styledash.css">
</head>

<body>
    <h2>Bienvenido, <?php echo htmlspecialchars($username); ?> (<?php echo htmlspecialchars($role); ?>)</h2>
    <nav>
        <ul>
            <li><a href="dashboard.php">Inicio</a></li>
            <li><a href="traductor.php">Traductor</a></li>
            <li><a href="logout.php">Cerrar Sesión</a></li>
        </ul>
    </nav>

    <section id="archivos">
        <h3>Archivos Disponibles</h3>
        <table>
            <tr>
                <th>Nombre</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
            <?php
            $sql = "SELECT * FROM Archivos" . ($role != 'maestro' ? " WHERE activo = 1" : "");
            $result = $conn->query($sql);
            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                    <td>" . htmlspecialchars($row['nombre']) . "</td>
                    <td>" . ($row['activo'] ? 'Activo' : 'Inactivo') . "</td>
                    <td>
                        <a href='" . $row['ruta'] . "' target='_blank'>Ver</a>";
                if ($role == 'maestro' || $role == 'admin') {
                    echo "<form action='dashboard.php' method='POST' style='display:inline-block;'>
                            <input type='hidden' name='archivo_id' value='" . $row['id'] . "'>
                            <input type='hidden' name='nuevo_estado' value='" . ($row['activo'] ? '0' : '1') . "'>
                            <button type='submit' name='cambiar_estado_archivo'>" . ($row['activo'] ? 'Desactivar' : 'Activar') . "</button>
                          </form>
                          <form action='dashboard.php' method='POST' style='display:inline-block;'>
                            <input type='hidden' name='archivo_id' value='" . $row['id'] . "'>
                            <input type='text' name='nuevo_nombre' value='" . htmlspecialchars($row['nombre']) . "' required>
                            <button type='submit' name='cambiar_nombre_archivo'>Cambiar Nombre</button>
                          </form>";
                }
                echo "</td>
                </tr>";
            }
            ?>
        </table>
    </section>

    <?php if ($role == 'maestro' || $role == 'admin'): ?>
        <section id="subir_archivo">
            <h3>Subir Nuevo Archivo</h3>
            <form action="dashboard.php" method="POST" enctype="multipart/form-data">
                <label for="archivo">Archivo (PDF):</label>
                <input type="file" id="archivo" name="archivo" accept="application/" required>
                <button type="submit" name="subir_archivo">Subir</button>
            </form>
            <?php if (isset($archivoMensaje))
                echo "<p>$archivoMensaje</p>"; ?>
        </section>
        <?php if ($role == 'admin'): ?>
            <section id="usuarios">
                <h3>Gestionar Usuarios</h3>
                <form action="dashboard.php" method="POST">
                    <label for="username">Nombre de usuario:</label>
                    <input type="text" id="username" name="username" required>
                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required>
                    <label for="role">Rol:</label>
                    <select id="role" name="role" required>
                        <!-- <option value="admin">Admin</option> -->
                        <option value="maestro">Maestro</option>
                        <option value="estudiante">Estudiante</option>
                    </select>
                    <button type="submit" name="agregar_usuario">Agregar Usuario</button>
                </form>
                <?php if (isset($usuarioMensaje))
                    echo "<p>$usuarioMensaje</p>"; ?>

                <h4>Lista de Usuarios</h4>
                <table>
                    <tr>
                        <th>Usuario</th>
                        <th>Rol</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                    <?php
                    $sql = "SELECT * FROM Usuarios as us where us.role ='maestro' or us.role='estudiante' LIMIT $inicio, $resultadosPorPagina";
                    $result = $conn->query($sql);
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>
                            <td>" . htmlspecialchars($row['username']) . "</td>
                            <td>" . htmlspecialchars($row['role']) . "</td>
                            <td>" . ($row['activo'] ? 'Activo' : 'Inactivo') . "</td>
                            <td>
                                <form action='dashboard.php' method='POST' style='display:inline-block;'>
                                    <input type='hidden' name='usuario_id' value='" . $row['id'] . "'>
                                    <input type='text' name='username' value='" . htmlspecialchars($row['username']) . "' required>
                                    <select name='role' required>
                                        <option value='maestro' " . ($row['role'] == 'maestro' ? 'selected' : '') . ">Maestro</option>
                                        <option value='estudiante' " . ($row['role'] == 'estudiante' ? 'selected' : '') . ">Estudiante</option>
                                    </select>
                                    <button type='submit' name='editar_usuario'>Editar</button>
                                    <input type='hidden' name='nuevo_estado' value='" . ($row['activo'] ? '0' : '1') . "'>
                                    <button type='submit' name='cambiar_estado_usuario'>" . ($row['activo'] ? 'Desactivar' : 'Activar') . "</button>
                                </form>
                            </td>
                        </tr>";
                    }
                    ?>
                </table>
                <?php
                // Paginación
                $sqlTotal = "SELECT COUNT(*) as total FROM Usuarios";
                $resultTotal = $conn->query($sqlTotal);
                $rowTotal = $resultTotal->fetch_assoc();
                $totalPaginas = ceil($rowTotal['total'] / $resultadosPorPagina);

                echo "<div class='paginacion'>";
                for ($i = 1; $i <= $totalPaginas; $i++) {
                    echo "<a href='dashboard.php?pagina=$i'>$i</a> ";
                }
                echo "</div>";
                ?>
            </section>
        <?php endif; ?>

        <section id="diccionario">
            <h3>Gestionar Diccionario</h3>
            <form action="dashboard.php" method="POST">
                <label for="aymara">Aymara:</label>
                <input type="text" id="aymara" name="aymara" required>
                <label for="espanol">Español:</label>
                <input type="text" id="espanol" name="espanol" required>
                <button type="submit" name="agregar_palabra">Agregar</button>
            </form>
            <?php if (isset($diccionarioMensaje))
                echo "<p>$diccionarioMensaje</p>"; ?>

            <h4>Buscar Palabras</h4>
            <form action="dashboard.php" method="GET">
                <input type="text" name="busqueda" value="<?php echo htmlspecialchars($busqueda); ?>"
                    placeholder="Buscar palabra...">
                <button type="submit">Buscar</button>
            </form>

            <h4>Lista de Palabras</h4>
            <table>
                <tr>
                    <th>Aymara</th>
                    <th>Español</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
                <?php
                $sql = "SELECT * FROM Diccionario WHERE 1=1 $condicionBusqueda LIMIT $inicio, $resultadosPorPagina";
                $result = $conn->query($sql);
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>
                        <td>" . htmlspecialchars($row['aymara']) . "</td>
                        <td>" . htmlspecialchars($row['espanol']) . "</td>
                        <td>" . ($row['activo'] ? 'Activo' : 'Inactivo') . "</td>
                        <td>
                            <form action='dashboard.php' method='POST' style='display:inline-block;'>
                                <input type='hidden' name='palabra_id' value='" . $row['id'] . "'>
                                <input type='text' name='aymara' value='" . htmlspecialchars($row['aymara']) . "' required>
                                <input type='text' name='espanol' value='" . htmlspecialchars($row['espanol']) . "' required>
                                <button type='submit' name='editar_palabra'>Editar</button>
                                <input type='hidden' name='nuevo_estado' value='" . ($row['activo'] ? '0' : '1') . "'>
                                <button type='submit' name='cambiar_estado_palabra'>" . ($row['activo'] ? 'Desactivar' : 'Activar') . "</button>
                            </form>
                        </td>
                    </tr>";
                }
                ?>
            </table>
            <?php
            // Paginación
            $sqlTotal = "SELECT COUNT(*) as total FROM Diccionario WHERE 1=1 $condicionBusqueda";
            $resultTotal = $conn->query($sqlTotal);
            $rowTotal = $resultTotal->fetch_assoc();
            $totalPaginas = ceil($rowTotal['total'] / $resultadosPorPagina);

            echo "<div class='paginacion'>";
            for ($i = 1; $i <= $totalPaginas; $i++) {
                echo "<a href='dashboard.php?pagina=$i&busqueda=" . urlencode($busqueda) . "'>$i</a> ";
            }
            echo "</div>";
            ?>
        </section>


    <?php endif; ?>

</body>

</html>

<?php
$conn->close();
?>