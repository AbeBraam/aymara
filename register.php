<?php
include 'config/db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirm_password'];
    $role = 'estudiante';

    // Validación del nombre de usuario
    if (!preg_match("/^[a-zA-Z\s]+$/", $username)) {
        $usernameError = "El nombre de usuario solo puede contener letras y espacios.";
    } else {
        $usernameError = "";
    }

    // Validación de la contraseña
    $passwordError = "";
    if ($password !== $confirmPassword) {
        $passwordError = "Las contraseñas no coinciden.";
    } elseif (strlen($password) < 8) {
        $passwordError = "La contraseña debe tener al menos 8 caracteres.";
    } elseif (!preg_match("/[A-Z]/", $password)) {
        $passwordError = "La contraseña debe incluir al menos una letra mayúscula.";
    } elseif (!preg_match("/[a-z]/", $password)) {
        $passwordError = "La contraseña debe incluir al menos una letra minúscula.";
    } elseif (!preg_match("/[0-9]/", $password)) {
        $passwordError = "La contraseña debe incluir al menos un número.";
    } elseif (!preg_match("/[\W]/", $password)) {
        $passwordError = "La contraseña debe incluir al menos un carácter especial.";
    }

    if ($passwordError === "" && $usernameError === "") {
        $password = password_hash($password, PASSWORD_DEFAULT); // Encriptación de la contraseña
        $sql = "INSERT INTO Usuarios (username, password, role) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sss", $username, $password, $role);

        if ($stmt->execute()) {
            echo "Registro exitoso.";
        } else {
            echo "Error: " . $stmt->error;
        }
        $stmt->close();
    } else {
        echo $usernameError . " " . $passwordError;
    }
}
$conn->close();
?>

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro</title>
    <link rel="stylesheet" href="css/style.css">
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm_password").value;
            var error = "";
            var usernameError = "";

            if (!/^[a-zA-Z\s]+$/.test(username)) {
                usernameError = "El nombre de usuario solo puede contener letras y espacios.";
            }

            if (password !== confirmPassword) {
                error = "Las contraseñas no coinciden.";
            } else if (password.length < 8) {
                error = "La contraseña debe tener al menos 8 caracteres.";
            } else if (!/[A-Z]/.test(password)) {
                error = "La contraseña debe incluir al menos una letra mayúscula.";
            } else if (!/[a-z]/.test(password)) {
                error = "La contraseña debe incluir al menos una letra minúscula.";
            } else if (!/[0-9]/.test(password)) {
                error = "La contraseña debe incluir al menos un número.";
            } else if (!/[\W]/.test(password)) {
                error = "La contraseña debe incluir al menos un carácter especial.";
            }

            if (usernameError) {
                document.getElementById("usernameError").innerText = usernameError;
                return false;
            }

            if (error) {
                document.getElementById("passwordError").innerText = error;
                return false;
            }
            return true;
        }

        function showPasswordRequirements() {
            document.getElementById("passwordRequirements").innerText = "La contraseña debe tener al menos 8 caracteres, incluir una letra mayúscula, una letra minúscula, un número y un carácter especial.";
        }

        function hidePasswordRequirements() {
            document.getElementById("passwordRequirements").innerText = "";
        }

        function togglePassword(inputId, iconId) {
            var input = document.getElementById(inputId);
            var icon = document.getElementById(iconId);
            if (input.type === "password") {
                input.type = "text";
                icon.innerHTML = "Ocultar Contraseña";
            } else {
                input.type = "password";
                icon.innerHTML = "Mostrar Contraseña";
            }
        }
    </script>
    <style>
        .password-container {
            position: relative;
            display: inline-block;
            width: 100%;
        }

        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>Registro</h2>
    <form action="register.php" method="POST" onsubmit="return validateForm()">
        <label for="username">Nombre de usuario:</label>
        <input type="text" id="username" name="username" required>
        <div id="usernameError" style="color: red;"></div>

        <label for="password">Contraseña:</label>
        <div class="password-container">
            <input type="password" id="password" name="password" required onfocus="showPasswordRequirements()" onblur="hidePasswordRequirements()">
            <span class="toggle-password" id="togglePassword" onclick="togglePassword('password', 'togglePassword')">Mostrar Contraseña</span>
        </div>
        <div id="passwordRequirements" style="color: blue;"></div>

        <label for="confirm_password">Confirmar Contraseña:</label>
        <div class="password-container">
            <input type="password" id="confirm_password" name="confirm_password" required>
            <span class="toggle-password" id="toggleConfirmPassword" onclick="togglePassword('confirm_password', 'toggleConfirmPassword')">Mostrar Contraseña</span>
        </div>
        <div id="passwordError" style="color: red;"></div>

        <button type="submit">Registrar</button>
    </form>
    <div>Si ya te registraste, inicia sesión:</div>
    <a href="login.html"><button>Ir al Login</button></a>
    <br>
</body>
</html>
