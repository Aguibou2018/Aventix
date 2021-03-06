<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Aventix - Map</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <!-- jQuery Circle-->
    <link rel="stylesheet" href="css/grasp_mobile_progress_circle-1.0.0.min.css">
    <!-- Custom Scrollbar-->
    <link rel="stylesheet" href="vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.premium.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <!-- Side Navbar -->
    <nav class="side-navbar">
      <div class="side-navbar-wrapper">
        <!-- Sidebar Header    -->
        <div class="sidenav-header d-flex align-items-center justify-content-center">
          <!-- User Info-->
          <div class="sidenav-header-inner text-center"><a href="/pages-profile"><img src="img/avatar-6.jpg" alt="person" class="img-fluid rounded-circle"></a>
            <h2 class="h5">${sessionScope['scopedTarget.sessionBeanEmploye'].employe.getPrenom()} ${sessionScope['scopedTarget.sessionBeanEmploye'].employe.getNom()}</h2><span>Employé</span>
          </div>
          <!-- Small Brand information, appears on minimized sidebar-->
          <div class="sidenav-header-logo"><a href="/indexEmploye" class="brand-small text-center"> <strong>${sessionScope['scopedTarget.sessionBeanEmploye'].employe.getPrenom().charAt(0)}</strong><strong class="text-primary">${sessionScope['scopedTarget.sessionBeanEmploye'].employe.getNom().charAt(0)}</strong></a></div>
        </div>
        <!-- Sidebar Navigation Menus-->
        <div class="main-menu">
          <h5 class="sidenav-heading">Menu</h5>
          <ul id="side-main-menu" class="side-menu list-unstyled">                  
            <li><a href="/indexEmploye"> <i class="icon-home"></i>Accueil</a></li>
            <li><a href="/card-employe"><i class="fa fa-credit-card"></i>Carte</a></li>
            <li><a href="/listeTransactions"> <i class="icon-check"></i></i>Liste des transactions</a>
            </li>
            <li><a href="/listeRestaurants"> <i class="fa fa-th-list"></i>Liste des restaurants</a>
            <li class="active"><a href="/maps-employe"> <i class="fa fa-map-marker"></i>Maps</a></li>
            <li><a href="/contact"> <i class="fa fa-phone"></i>Contact </a> </li>

            <li><a href="/faq"><i class="fa fa-question-circle"></i>FAQ</a></li>  
        </div>
        
      </div>
    </nav>
    <div class="page">
      <!-- navbar-->
      <header class="header">
        <nav class="navbar">
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="icon-bars"> </i></a><a href="/indexEmploye" class="navbar-brand">
                  <div class="brand-text d-none d-md-inline-block"><strong class="text-primary">Aventix</strong></div></a></div>
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Languages dropdown    -->
                <li class="nav-item dropdown"><a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle"><img src="img/flags/16/FR.png" alt="French"><span class="d-none d-sm-inline-block">Français</span></a>
                  <ul aria-labelledby="languages" class="dropdown-menu">
                    <li><a rel="nofollow" href="#" class="dropdown-item"> <img src="img/flags/16/FR.png" alt="French" class="mr-2"><span>Français</span></a></li>
                  </ul>
                </li>
                <!-- Log out-->
                <li class="nav-item"><a href="/index" class="nav-link logout"> <span class="d-none d-sm-inline-block">Déconnexion</span><i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
     
      <!-- Breadcrumb-->
      <div class="breadcrumb-holder">
        <div class="container-fluid">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="/index">Accueil</a></li>
            <li class="breadcrumb-item active">Maps</li>
          </ul>
        </div>
      </div>
      <section>
        <div class="container-fluid">
          <!-- Page Header-->
          <header> 
             <section class="dashboard-counts section-padding">
                <div class="container-fluid">
                  <!-- Count item widget-->
                    <div class="col-12">
                      <div class="wrapper count-title d-flex">
                        <div class="icon"><i class="fa fa-map-marker"></i></div>
                        <div class="name"><strong class="text-uppercase">MAPS</strong><span>Géolocalisation via Google Maps</span>
                        </div>
                      </div>
                    </div>
                </div>
           </section>          
         </header>
          <div class="card">
            <div class="card-header">
              <h4>Basic Google Map </h4>
            </div>
            <div class="card-body">
              <div id="map-3" style="height: 400px;" class="map"> </div>
            </div>
          </div>
      </section>
      <footer class="main-footer">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-6">
              <p>Soft Design &copy; 2017-2019</p>
            </div>
            <div class="col-sm-6 text-right">
              <p>Version 1.4.5</p>
            </div>
          </div>
        </div>
      </footer>
    </div>
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
    <!-- Google Maps-->
    <!-- Create your own Maps API Key for production use, this one is domain-restricted-->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu5nZKbeK-WHQ70oqOWo-_4VmwOwKP9YQ"> </script>
    <!-- Google maps infobox-->
    <script src="vendor/google-maps-infobox/infobox-lib.js">  </script>
    <!-- Google map creation-->
    <script src="js/components-map.js"> </script>
    <!-- Basic Google map init + 1 marker-->
    <script>
      $(function () {
          // coordinates for the center of the map and the marker
          var lat = 40.732346;
          var long = -74.0014247;
          // if using with other than default style, change the path to the colour variant 
          // of the marker. E.g. to img/map-marker-violet.png.
          var markerImage = 'img/map-marker-default.png';
          // id of the map DOM element
          var id = 'map-3';
      
          map = createBasicMap(id, lat, long, markerImage);
      });      
      
    </script>
    <!-- Styled Google map init + 1 marker-->
    <script>
      $(function () {
          // coordinates for the center of the map and the marker
          var lat = 40.732346;
          var long = -74.0014247;
          // if using with other than default style, change the path to the colour variant 
          // of the marker. E.g. to img/map-marker-violet.png.
          var markerImage = 'img/map-marker-default.png';
          // id of the map DOM element
          var id = 'map-1';
      
          map = createSimpleMap(id, lat, long, markerImage);
      });      
      
    </script>
    <!--  Styled Google map init + multiple markers + infobox-->
    <script>
      $(function () {
          // coordinates for the center of the map
          var lat = 40.732346;
          var long = -74.0014247;
          // json file path with the markers to display on the map
          var jsonFile = 'data/addresses.json';
          // if using with other than default style, change the path to the colour variant 
          // of the marker. E.g. to img/map-marker-violet.png.                
          var markerImage = 'img/map-marker-default.png';
          // id of the map DOM element
          var id = 'map-2';
      
          $.getJSON(jsonFile).done(function (json) {
              map = createAdvancedMap(id, lat, long, json, markerImage);
          })
          .fail(function (jqxhr, textStatus, error) {
              console.log(error);
          });
      });   
    </script>
  </body>
</html>