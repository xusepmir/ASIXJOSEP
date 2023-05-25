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

        <p> Tornar a Gestusu convencional'<a href="./gestusu.php">Index</a>!</p>
        <p> Baixa a la ferramenta <a href="#tool">Baixa</a>!</p>

     </div>

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>


     <div class="p-3 mb-3 bg-white text-black container">

      <h1>Dades sobre el nostre controlador de domini.</h1>
      <br>
      <br>


     <?php

		// Ejecutar el comando ls -l en la terminal
		$output = shell_exec("sudo slapcat");

		// Mostrar la salida en una página HTML
		echo "<pre>$output</pre>";
  
	?>

</div>



    <br>
    <br>
    <br>
    <br>
    <br>
    
    <div class="container" id="tool">

  <div class="row">
  
    <!-- Card1 -->
     <!-- Crear unidad organizativa -->
    <div class="col-md-3">
      <div class="card">
        <img src="./ou_plant_1.png" class="card-img-top" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">crea una unitat organitzativa</h5>
          <p class="card-text">Crea unitats organitzatives en aquest domini.</p>
          <a href="./masou.php" class="btn btn-primary">Ves</a>
        </div>
      </div>
    </div>
    




    <!-- Card2 -->
    <!-- Eliminar unidad organizativa -->
    <div class="col-md-3">
      <div class="card">
        <img src="./ou_plant_2.png" class="card-img-top" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Esborra una unitat organitzativa</h5>
          <p class="card-text">Esborra unitats organitzatives en aquest domini.</p>
          <a href="menossou.php" class="btn btn-primary">Ves</a>
        </div>
      </div>
    </div>
    





    <!-- Card3 -->
      <!-- crear grup -->

    <div class="col-md-3">
      <div class="card">
        <img src="./masgroup.png" class="card-img-top" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Crea un grup</h5>
          <p class="card-text"><br><br>Crea un grup dintre de ldap.</p>
          <a href="./masgroup.php" class="btn btn-primary">Ves</a>
        </div>
      </div>
    </div>
    









    <!-- Card4 -->
      <!-- Borrar grup -->
    <div class="col-md-3">
      <div class="card">
        <img src="./menosgroup.png" class="card-img-top" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Eliminar Grup</h5>
          <p class="card-text"><br><br>Elimina un grup dintre de ldap.</p>
          <a href="./menosgroup.php" class="btn btn-primary">Ves</a>
        </div>
      </div>
    </div>
    
  </div>
  
  <br>
  <br>
  <br>
  
  <div class="row">





    <!-- Card5 -->
    <!-- renombrar grup-->


    <div class="col-md-3">
      <div class="card">
        <img src="./renombrargroup.png" class="card-img-top" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Renombrar Grup</h5>
          <p class="card-text">Renombra un grup existent dins de ldap.</p>
          <a href="./renombrargroup.php" class="btn btn-primary">Ves</a>
        </div>
      </div>
    </div>



    
    <!-- Card6 -->
      <!-- Crear usuari -->
    <div class="col-md-3">
      <div class="card">
        <img src="./masusuari.png" class="card-img-top" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Crea un usuari a LDAP</h5>
          <p class="card-text"><br>Crea un usuari dins de ldap.</p>
          <a href="./addusuari.php" class="btn btn-primary">Ves</a>
        </div>
      </div>
    </div>




    <!-- Card7 -->
    <!-- Borrar usuari -->
    <div class="col-md-3">
      <div class="card">
        <img src="./menosusuari.png" class="card-img-top" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Esborra un usuari</h5>
          <p class="card-text"><br>Esborra un usuari dintre de ldap.</p>
          <a href="./removesuari.php" class="btn btn-primary">Ves</a>
        </div>
      </div>
    </div>



    <!-- Card8 -->
     <!-- Cambia nom d'usuari -->
    <div class="col-md-3">
      <div class="card">
        <img src="./changeusuari.png" class="card-img-top" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Canvia el nom d'usuari</h5>
          <p class="card-text">Canvia el nom d'usuari dintre de ldap.</p>
          <a href="./renameusuari.php" class="btn btn-primary">Ves</a>
        </div>
      </div>
    </div>
    
    </div>
  
    <br>
    <br>
    <br>
    

    <div class="row">


    <!-- Card9 -->
    <!-- anyadir usuari a grup-->
    




    <div class="col-md-3">
      <div class="card">
        <img src="./masgroup.png" class="card-img-top" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Anyadir usuari a grup</h5>
          <p class="card-text">Anyadir usuari a grup dintre de LDAP.</p>
          <a href="./adduserto.php " class="btn btn-primary">Ves</a>
        </div>
      </div>
    </div>
    



    <!-- Card10 -->
    <!-- extraure usuari de ldap-->
    <div class="col-md-3">
      <div class="card">
        <img src="./menosgroup.png" class="card-img-top" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Desafegir usuari</h5>
          <p class="card-text"><br>Extrau usuari de un grup en LDAP.</p>
          <a href="./quituser.php" class="btn btn-primary">Ves</a>
        </div>
      </div>
    </div>

    <!-- Card11 -->
    <!-- extraure usuari de ldap-->
    <div class="col-md-3">
      <div class="card">
        <img src="./log.png" class="card-img-top" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">LOG</h5>
          <p class="card-text"><br>Consulta el log de la web app.</p>
          <a href="./log.php" class="btn btn-primary">Ves</a>
        </div>
      </div>
    </div>

    <!-- Card11 -->
    <!-- extraure usuari de ldap-->
    <div class="col-md-3">
      <div class="card">
        <img src="./limpiarlog.png" class="card-img-top" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Netejar log</h5>
          <p class="card-text"><br>Neteja el log de l'aplicació web.</p>
          <a href="./cleanlog.php" class="btn btn-primary">Neteja</a>
        </div>
      </div>
    </div>

    </div>
  
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