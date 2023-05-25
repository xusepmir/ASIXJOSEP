<?php

// Ejecutar el script actualitzar.sh utilizando shell_exec()
$output = shell_exec('sudo bash clearlog.sh');

header("Location: gestusu.php");
exit;

?>

  
