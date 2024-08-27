<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Traductor Español - Aymara</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #translator {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        textarea {
            width: 100%;
            height: 100px;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none;
        }

        select, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
        }

        button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        #outputText {
            margin-top: 20px;
            font-weight: bold;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 5px;
            min-height: 50px;
        }
    </style>
</head>
<body>
    <div id="translator">
        <h1>Traductor Español - Aymara</h1>
        <textarea id="inputText" placeholder="Introduce el texto"></textarea>
        <select id="direction">
            <option value="es-ay">Español a Aymara</option>
            <option value="ay-es">Aymara a Español</option>
        </select>
        <button id="translateButton">Traducir</button>
        <div id="outputText"></div>
        <button onclick="window.location.href='dashboard.php'" style="margin-top: 10px;">Ir al Dashboard</button>
    </div>

    <script>
        document.getElementById('translateButton').onclick = function() {
            translate();
        };

        function translate() {
            const inputText = document.getElementById('inputText').value;
            const direction = document.getElementById('direction').value;

            if (inputText.trim() === '') {
                alert('Por favor, introduce un texto para traducir.');
                return;
            }

            fetch('translate.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ text: inputText, direction: direction })
            })
            .then(response => response.json())
            .then(data => {
                document.getElementById('outputText').innerText = data.translation;
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
    </script>
</body>
</html>
