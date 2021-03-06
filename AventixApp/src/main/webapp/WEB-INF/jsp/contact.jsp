<!DOCTYPE html>
<html>
  <head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Aventix - Contact</title>
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
            <h2 class="h5">${sessionScope['scopedTarget.sessionBeanEmploye'].employe.getPrenom()} ${sessionScope['scopedTarget.sessionBeanEmploye'].employe.getNom()}</h2><span>Employ�</span>
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
            <li><a href="/maps-employe"> <i class="fa fa-map-marker"></i>Maps</a></li>
            <li  class="active"><a href="/contact"> <i class="fa fa-phone"></i>Contact</a> </li>

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
     
      <!-- Breadcrumb-->
      <div class="breadcrumb-holder">
        <div class="container-fluid">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="/index">Accueil</a></li>
            <li class="breadcrumb-item active">Maps</li>
          </ul>
        </div>
      </div>
      <section class="forms">
        <div class="container-fluid">
          <!-- Page Header-->
          <header> 
             <section class="dashboard-counts section-padding">
                <div class="container-fluid">
                  <!-- Count item widget-->
                    <div class="col-12">
                      <div class="wrapper count-title d-flex">
                        <div class="icon"><i class="fa fa-phone"></i></div>
                        <div class="name"><strong class="text-uppercase">Contact</strong><span>Aventix Contact</span>
                        </div>
                      </div>
                    </div>
                </div>
           </section>          
         </header>
 <!-- Contact Section -->
          <div class="card">
          <section class="page-section">
            <div class="container">
              <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                  <h2 class="text-primary" >Contactez nous !</h2>
                  <hr class="divider my-4">
                  <p class="text-muted mb-5">Par t�l�phone ou par mail :</p>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
                  <i class="fa fa-phone fa-3x text-muted"></i>
                  <div>+33 4 84 59 72 01</div>
                </div>
                <div class="col-lg-4 mr-auto text-center">
                  <i class="fa fa-envelope fa-3x text-muted"></i>
                  <!-- Make sure to change the email address in anchor text AND the link below! -->
                  <a class="d-block" href="mailto:contact@yourwebsite.com">softdesign@aventix.com</a>
                </div>
              </div>
            </div>
          </section>  
        </div>
        
      </section>
      <footer class="main-footer">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-6">
              <p>SoftDesign &copy; 2017-2019</p>
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
  </body>
</html>