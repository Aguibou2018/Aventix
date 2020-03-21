<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Aventix - Dashboard</title>
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
            <li><a href="/listeTransactions"> <i class="icon-check"></i></i>Liste des transactions </a></li>
            <li><a href="/listeRestaurants"> <i class="fa fa-th-list"></i>Liste des restaurants</a>
            <li><a href="/maps-employe"> <i class="fa fa-map-marker"></i>Maps</a></li>
            <li><a href="/contact"> <i class="fa fa-phone"></i>Contact</a> </li>
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
     

      <!-- Statistics Section-->
      <section class="statistics" >
        <div class="container-fluid" style="margin-top: 20px;">
          <div class="row d-flex">
            <div class="col-lg-6">
              <!-- Income-->
              <div class="card income text-center">
                <strong class="text-primary">Solde journalier</strong>
                <div class="number">${sessionScope['scopedTarget.sessionBeanEmploye'].employe.getCarte().getMontantMaxJournalier()-sessionScope['scopedTarget.sessionBeanEmploye'].employe.montantDepenseJournee()}</div>
                <div class="icon"><i class="fa fa-eur"></i></div>
                <p>Utilisable ce jour </p>
              </div>
            </div>
            <div class="col-lg-6">
              <!-- Monthly Usage-->
              <div class="card income text-center">
                <strong class="text-primary">Solde total</strong>
                <div class="number">${sessionScope['scopedTarget.sessionBeanEmploye'].employe.getCarte().getSolde()}</div>
                <div class="icon"><i class="fa fa-eur"></i></div>
                <p>Votre solde carte</p>
              </div>
            </div>
          </div>
        </div>
      </section>
       <!-- Counts Section -->
        <section >
        <div class="container-fluid" style="margin-top: 20px;">
        	<div class="row">
        		<div class="col-md-2">
		        </div>
		       <div class="col-md-4">
		          <div class="card card-inverse text-white"><img src="img/foods-2.jpg" alt="Card image" class="card-img img-fluid">
		            <div class="card-img-overlay card-img-overlay-opacity">
		              <h5 class="card-title text-white">Carte restaurant</h5>
		              <p class="card-text">Aventix toujours à votre service</p>
		              <p class="card-text"><small>Mangez 5 fruits et légumes par jour</small></p>
		            </div>
		          </div>
		        </div>
		        <div class="col-md-4">
		          <div class="card card-inverse text-white"><img src="img/foods-3.jpg" alt="Card image" class="card-img img-fluid">
		            <div class="card-img-overlay card-img-overlay-opacity">
		              <h5 class="card-title text-white">Carte restaurant</h5>
		              <p class="card-text">Aventix toujours à votre service</p>
		              <p class="card-text"><small>Mangez 5 fruits et legumes par jour</small></p>
		            </div>
		          </div>
		        </div>
		     </div>
		   </div>
       </section>
      
      <footer class="main-footer">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-6">
              <p>SoftDesign &copy; 2019-2020</p>
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
    <script src="js/charts-home.js"></script>
    <!-- Notifications-->
    <script src="vendor/messenger-hubspot/build/js/messenger.min.js">   </script>
    <script src="vendor/messenger-hubspot/build/js/messenger-theme-flat.js">       </script>
    <!-- Main File-->
    <script src="js/front.js"></script>
  </body>
</html>