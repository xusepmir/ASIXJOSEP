<form method="POST" action="config2.php">
    <label for="cn">CN: </label>
    <input type="text" name="cn" id="cn" required>
    <br><br>
    
    <label for="dc">DC: </label>
    <input type="text" name="dc" id="dc" required>
    <br><br>
    
    <label for="dc2">DC2:</label>
    <input type="text" name="dc2" id="dc2" required>
    <br><br>

    <label for="dc3">Constrasenya:</label>
    <input type="text" name="dc3" id="dc3" required>
    <br><br>


    <br>

    
    <div class="justify-content: center;">

    <input type="submit" value="Introdueix">
    <br>

</div>
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cn = $_POST["cn"];
    $dc = $_POST["dc"];
    $dc2 = $_POST["dc2"];
    $dc3 = $_POST["dc3"];

    // Ejecutar el script externo pasando los valores como argumentos
    $output = shell_exec("sudo bash config.sh " . escapeshellarg($cn) . " " . escapeshellarg($dc) . " " . escapeshellarg($dc2) . " " .escapeshellarg($dc3));
    
    // Verificar si se produjo algún error en la ejecución del comando
    if ($output === null) {

        echo "Ocurrió un error al ejecutar el comando.";

    } else {

        echo "El comando se ejecutó correctamente.";
    }
}
?>