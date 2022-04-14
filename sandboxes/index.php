<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="canonical" href="https://startbootstrap.com/">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.12.0/css/all.css" integrity="sha384-ekOryaXPbeCpWQNxMwSWVvQ0+1VrStoPJq54shlYhR8HzQgig1v5fas6YgOqLoKz" crossorigin="anonymous">
    <style>
     a {
       color: #292961;
     }
     a:hover,
     a:focus,
     a:active {
       color: #292961;
       opacity: 0.8;
     }
     .display-1 {
       color: #292961;
       font-weight: bold !important;
     }

    </style>
    <title>VDO Sandboxes</title>
  </head>
  <body>
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col col-12 py-5">
            <h1 class="mb-4 display-1 text-center"><a href="/"> VDO</a> <i class="fas fa-box fa-1x mr-2"></i>Sandboxes</h1>
          </div>
        </div>
      </div>
    <div class="container-fluid">
      <div class="row align-items-center">
	<div class="col col-12 py-5">
         <div class="row">
<?php
           $current_directory = getcwd();
           $files = scandir($current_directory);

            foreach($files as $key => $value){
              if(is_dir($current_directory . DIRECTORY_SEPARATOR . $value) && !in_array($value,array(".","..","backups"))) {
		      $docroot = '/docroot';
		      $href = '/sandboxes/' . $value . '/docroot/';
			      if (!is_dir($current_directory . DIRECTORY_SEPARATOR . $value . '/docroot/')) {
				      if (is_dir($current_directory . DIRECTORY_SEPARATOR . $value . '/web/')) {
                                         $href = '/sandboxes/' . $value . '/web/';
				      }
			      }
		      $dir_name = $current_directory . DIRECTORY_SEPARATOR . $value;
	    echo '
                <a href="'. $href . '" class="col col-4 pr-3 py-4 text-center">
                  <div class="card border-0 shadow-lg shadow-hover">
		    <div class="card-body">
                      <i class="fab fa-drupal fa-4x mr-2"></i>
		      <h4>' . $value . '</h4>
                      <h6>' . date ("Y-m-d H:i", filemtime($dir_name)) . '</h6>
                    </div>
                  </div>
                </a>


                ';
		}
            }
?>
         </div>
       </div>
     </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>
