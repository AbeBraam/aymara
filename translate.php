<?php
// translate.php

header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);
$text = strtolower($data['text']); // Convertir todo el texto a minúsculas
$direction = $data['direction'];

// Función para cargar el diccionario desde la base de datos
function loadDictionaryFromDB($conn) {
    $dictionary = [
        'es-ay' => [],
        'ay-es' => []
    ];

    // Consulta SQL para obtener todas las palabras del diccionario
    $sql = "SELECT aymara, espanol FROM Diccionario";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $aymaraWord = trim($row['aymara']);
            $spanishWord = trim($row['espanol']);
            $dictionary['es-ay'][strtolower($spanishWord)] = $aymaraWord; // Convertir la palabra clave a minúsculas
            $dictionary['ay-es'][strtolower($aymaraWord)] = $spanishWord; // Convertir la palabra clave a minúsculas
        }
    }

    return $dictionary;
}

function translate($text, $direction, $dictionary) {
    $words = explode(' ', $text);
    $translatedWords = [];

    foreach ($words as $word) {
        $lowercaseWord = strtolower($word); // Convertir la palabra a minúsculas
        if (isset($dictionary[$direction][$lowercaseWord])) {
            $translatedWords[] = $dictionary[$direction][$lowercaseWord];
        } else {
            $translatedWords[] = $word; // Si no se encuentra la traducción, se deja la palabra original
        }
    }

    return implode(' ', $translatedWords);
}

// Conexión a la base de datos (debes incluir este código en tu script de conexión a la base de datos)
include 'config/db.php';

// Cargar el diccionario desde la base de datos
$dictionary = loadDictionaryFromDB($conn);

// Realizar la traducción
$translation = translate($text, $direction, $dictionary);

echo json_encode(['translation' => $translation]);

// Cerrar la conexión a la base de datos
$conn->close();
?>
