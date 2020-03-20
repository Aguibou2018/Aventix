<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Aventix Dashboard by SoftDesign</title>
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
          <div class="sidenav-header-logo"><a href="/indexEntreprise" class="brand-small text-center"> <strong>A</strong><strong class="text-primary">D</strong></a></div>
        </div>
        <!-- Sidebar Navigation Menus-->
        <div class="main-menu">
          <h5 class="sidenav-heading">Menu</h5>
          <ul id="side-main-menu" class="side-menu list-unstyled">                  
            <li><a href="/indexEntreprise"> <i class="icon-home"></i>Acceuil </a></li>
              <li ><a href="#commande" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-shopping-cart"></i> Commande </a>
              <ul id="commande" class="collapse list-unstyled ">
                <li><a href="/newCommande">Nouvelle Commande</a></li>
                <li><a href="/listeCommandes">Liste des Commandes</a></li>
              </ul>
            </li>
          <li><a href="#employe" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-user-circle-o"></i>Employe </a>
              <ul id="employe" class="collapse list-unstyled">
                <li><a href="/newEmploye">Nouvel employé </a></li>
                <li><a href="/listeEntreprise">Liste des employés </a></li>
              </ul>
            </li>
            <li><a href="/listeCartes"> <i class="fa fa-address-card-o"></i>Liste des cartes</a></li>
            <li  class="active"><a href="/contactEntreprise"> <i class="fa fa-phone"></i>Contact </a> </li>
            <li><a href="/faqEntreprise"><i class="fa fa-question-circle"></i>Faq </a></li>
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
                  <div class="brand-text d-none d-md-inline-block"><span>Aventix </span><strong class="text-primary">Dashboard</strong></div></a></div>
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Languages dropdown    -->
                <li class="nav-item dropdown"><a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle"><img src="img/flags/16/FR.png" alt="French"><span class="d-none d-sm-inline-block">Francais</span></a>
                  <ul aria-labelledby="languages" class="dropdown-menu">
                    <li><a rel="nofollow" href="#" class="dropdown-item"> <img src="img/flags/16/GB.png" alt="French" class="mr-2"><span>Anglais                                                         </span></a></li>
                  </ul>
                </li>
                <!-- Log out-->
                <li class="nav-item"><a href="/index" class="nav-link logout"> <span class="d-none d-sm-inline-block">Deconnexion</span><i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
      <!-- Breadcrumb-->
      <div class="breadcrumb-holder">
        <div class="container-fluid">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="/indexEntreprise">Acceuil</a></li>
            <li class="breadcrumb-item active"> Contact </li>
          </ul>
        </div>
      </div>

      <section class="dashboard-counts section-padding">
            <div class="container-fluid">
              <!-- Count item widget-->
                <div class="col-12">
                  <div class="wrapper count-title d-flex">
                    <div class="icon"><i class="fa fa-phone"></i></div>
                    <div class="name"><strong class="text-uppercase">Contact</strong><span>Aventix Contact </span>
                    </div>
                  </div>
                </div>
            </div>
       </section>          

      <section class="forms">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-6 col-xl-4">                       
              <div class="card">
                <div class="card-body">
                  <div class="media align-items-center"><span style="background-image: url(img/avatar-1.jpg)" class="avatar avatar-xl mr-3"></span>
                    <div class="media-body overflow-hidden">
                      <h5 class="card-text mb-0">Margret Cote</h5>
                      <p class="card-text text-uppercase">Zilidium</p>
                      <p class="card-text">
                         
                        margretcote@zilidium.com<br><abbr title="Phone">P:  </abbr>+1 (893) 532-2218
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-xl-4">                       
              <div class="card">
                <div class="card-body">
                  <div class="media align-items-center"><span style="background-image: url(img/avatar-2.jpg)" class="avatar avatar-xl mr-3"></span>
                    <div class="media-body overflow-hidden">
                      <h5 class="card-text mb-0">Rachel Vinson</h5>
                      <p class="card-text text-uppercase">Chorizon</p>
                      <p class="card-text">
                         
                        rachelvinson@chorizon.com<br><abbr title="Phone">P:  </abbr>+1 (891) 494-2060
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-xl-4">                       
              <div class="card">
                <div class="card-body">
                  <div class="media align-items-center"><span style="background-image: url(img/avatar-3.jpg)" class="avatar avatar-xl mr-3"></span>
                    <div class="media-body overflow-hidden">
                      <h5 class="card-text mb-0">Gabrielle Aguirre</h5>
                      <p class="card-text text-uppercase">Comverges</p>
                      <p class="card-text">
                         
                        gabrielleaguirre@comverges.com<br><abbr title="Phone">P:  </abbr>+1 (805) 459-3869
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>      </section>
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