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
          <div class="sidenav-header-inner text-center"><a href="/pages-profile"><img src="img/logo-sncf.jpg" alt="Entreprise" class="img-fluid rounded-circle"></a>
            <h2 class="h5">${sessionScope['scopedTarget.sessionBeanEntreprise'].entreprise.getNomEntreprise()}</h2><span>Entreprise</span>
          </div>
          <!-- Small Brand information, appears on minimized sidebar-->
          <div class="sidenav-header-logo"><a href="/indexEmployeur" class="brand-small text-center"> <strong>${sessionScope['scopedTarget.sessionBeanEntreprise'].entreprise.getNomEntreprise().charAt(0)}${sessionScope['scopedTarget.sessionBeanEntreprise'].entreprise.getNomEntreprise().charAt(1)}${sessionScope['scopedTarget.sessionBeanEntreprise'].entreprise.getNomEntreprise().charAt(2)}</strong></a></div>
        </div>
        <!-- Sidebar Navigation Menus-->
        <div class="main-menu">
          <h5 class="sidenav-heading">Menu</h5>
          <ul id="side-main-menu" class="side-menu list-unstyled">                  
            <li><a href="/indexEntreprise"> <i class="icon-home"></i>Accueil</a></li>
            <li><a href="#commande" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-shopping-cart"></i> Commande</a>
              <ul id="commande" class="collapse list-unstyled ">
                <li><a href="/newCommande">Nouvelle commande</a></li>
                <li><a href="/listeCommandes">Liste des commandes</a></li>
              </ul>
            </li>
            <li><a href="#employe" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-user-circle-o"></i>Employ�</a>
              <ul id="employe" class="collapse list-unstyled ">
                <li><a href="/newEmploye">Nouvel employ�</a></li>
                <li><a href="/listeEmployes">Liste des employ�s</a></li>
              </ul>
            </li>
            
			<li><a href="/listeCartes"> <i class="fa fa-address-card-o"></i>Liste des cartes</a></li>
            <li><a href="/contactEntreprise"> <i class="fa fa-phone"></i>Contact</a> </li>
            <li><a href="/faqEntreprise"><i class="fa fa-question-circle"></i>FAQ</a></li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="page">
      <!-- navbar-->
      <header class="header">
        <nav class="navbar">
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="icon-bars"> </i></a><a href="/indexEntreprise" class="navbar-brand">
                  <div class="brand-text d-none d-md-inline-block"><strong class="text-primary">Aventix</strong></div></a></div>
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Languages dropdown    -->
                <li class="nav-item dropdown"><a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle"><img src="img/flags/16/FR.png" alt="French"><span class="d-none d-sm-inline-block">Fran�ais</span></a>
                  <ul aria-labelledby="languages" class="dropdown-menu">
                    <li><a rel="nofollow" href="#" class="dropdown-item"> <img src="img/flags/16/FR.png" alt="French" class="mr-2"><span>Fran�ais</span></a></li>
                  </ul>
                </li>
                <!-- Log out-->
                <li class="nav-item"><a href="/index" class="nav-link logout"> <span class="d-none d-sm-inline-block">D�connexion</span><i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
      <!-- Counts Section -->
      <section class="statistics" >
        <div class="container-fluid" style="margin-top: 20px;">
          <div class="row d-flex">
            <div class="col-lg-4">
              <!-- Income-->
              <div class="card income text-center">
              	<h2 class="display h4">Employ�s inscrits</h2>
                <div class="icon"><i class="icon-user"></i></div>
                <div class="number">${sessionScope['scopedTarget.sessionBeanEntreprise'].entreprise.nombreEmploye()}</div>
              </div>
            </div>
            <div class="col-lg-4">
              <!-- Monthly Usage-->
              <div class="card income text-center">
              	<h2 class="display h4">Nombre de Carte</h2>
                <div class="icon"><i class="fa fa-id-card-o"></i></div>
                <div class="number">${sessionScope['scopedTarget.sessionBeanEntreprise'].entreprise.nombreCarte()}</div>
              </div>
            </div>
            <div class="col-lg-4">
              <!-- User Activity-->
            <div class="card income text-center">
              	<h2 class="display h4"> Nombre de Commandes</h2>
                <div class="icon"><i class="icon-bill"></i></div>
                <div class="number">${sessionScope['scopedTarget.sessionBeanEntreprise'].entreprise.nombreCommande()}</div>
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
		              <p class="card-text">Aventix toujours � votre service</p>
		              <p class="card-text"><small>Mangez 5 fruits et legumes par jour</small></p>
		            </div>
		          </div>
		        </div>
		        <div class="col-md-4">
		          <div class="card card-inverse text-white"><img src="img/foods-3.jpg" alt="Card image" class="card-img img-fluid">
		            <div class="card-img-overlay card-img-overlay-opacity">
		              <h5 class="card-title text-white">Carte restaurant</h5>
		              <p class="card-text">Aventix toujours � votre service</p>
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