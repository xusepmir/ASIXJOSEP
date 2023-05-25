<!doctype html>

<html lang="en">
  <head >
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.rtl.min.css" integrity="sha384-WJUUqfoMmnfkBLne5uxXj+na/c7sesSJ32gI7GfCk4zO4GthUKhSEGyvQ839BC51" crossorigin="anonymous">

    <title>Projecte Final Josep Espinós Barber(open ldap)</title>
    
  </head>

    <body class="p-3 mb-3 bg-info container">

    <div class="p-3 mb-3 bg-secondary">

      <div class="alert alert-secondary" role="alert">

      <p>Torna cap endarrere  <a href="./gestusu.php"> Arrere </a>!</p>

     </div>

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>


     <div class="p-3 mb-3 bg-white text-black container">

      <h1>Log del sistema.</h1>
      <br>
      <br>


     <?php

		// Ejecutar el comando ls -l en la terminal
		$output = shell_exec("tac log.txt");

		// Mostrar la salida en una página HTML
		echo "<pre>$output</pre>";
  
	?>

</div>



    <br>
    <br>
    <br>
    <br>
    
    
     

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </body>
  
    <footer>

  <br>
  <br>

  
  <div class="alert alert-secondary p-3 mb-3" role="alert">
        Contingut creat per Josep Espinós Barber.<p> </p>
        
        <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Licencia de Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />Este obra está bajo una <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">licencia de Creative Commons Reconocimiento-CompartirIgual 4.0 Internacional</a>.




      </div>

       <!-- Final de bg-secondary -->
       </div>


    <br>


    </div>
  
    </footer>
  
  </html>