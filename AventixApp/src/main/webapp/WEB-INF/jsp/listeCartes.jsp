<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <li><a href="/listeEmployes">Liste des employés </a></li>
              </ul>
            </li>
            <li class="active"><a href="/listeCartes"> <i class="fa fa-address-card-o"></i>Liste des cartes</a></li>
            <li><a href="/contactEntreprise"> <i class="fa fa-phone"></i>Contact </a> </li>
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
            <li class="breadcrumb-item"><a href="/listeEntreprise">Employes</a></li>
            <li class="breadcrumb-item active"> Modifier EmployÃ©</li>
          </ul>
        </div>
      </div>

      <section>
        <div class="container-fluid">
          <!-- Page Header-->
              <section class="dashboard-counts section-padding">
                <div class="container-fluid">
                  <!-- Count item widget-->
                    <div class="col-12">
                      <div class="wrapper count-title d-flex">
                        <div class="icon"><i class="fa fa-th-list"></i></div>
                        <div class="name"><strong class="text-uppercase">Cartes</strong><span>Liste des Cartes </span>
                        </div>
                      </div>
                    </div>
                </div>
           </section>
          <div class="card" style="width: 70%;">
            <div class="card-body">
              <div class="table-responsive">
                <h1> <i class="fa fa-address-card-o"></i>Liste des Cartes
                </h1>
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>id carte</th>
                      <th>Montant Max Journalier</th>
                      <th>Solde</th>
                      <th>Statut</th>
                      <th>Employé associé</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                      <c:forEach items="${cartes}" var="carte">
                          <tr>
                              <td>${carte.getId()}</td>
                              <td>${carte.getMontantMaxJournalier()}</td>
                              <td>${carte.getSolde()}</td>
                              <td>${carte.getValidite()}</td>
                              <td>${carte.getEmploye().getPrenom()} ${carte.getEmploye().getNom()}</td>
                              <td><a href="#desactiverCarte?id=${carte.getId()}" class="btn btn-danger btn-sm fa-2" title="desactiver carte" onclick="Desactiver('${carte.getId()}',this.href)"> Desactiver </a> <a href="#activeCarte?id=${carte.getId()}" class="btn btn-success btn-sm fa-2" title="activer carte" onclick="Reactiver('${carte.getId()}',this.href)"> Activer </a> <a href="/newEmploye?id=${carte.getId()}" class="btn btn-warning btn-sm fa-2" title="associer un employé"> Associer </a> </td>
                          </tr>
                      </c:forEach>
                    </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </section>
      <footer class="main-footer">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-6">
              <p>Your company &copy; 2017-2019</p>
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
     <script type="text/javascript">
      function Desactiver(id, url) {
        if (confirm("Voulez vous vraiment desactiver la carte " + ${carte.getId()} + " de "+ ${carte.getEmploye().getPrenom()} ${carte.getEmploye().getNom()} +" ?")) {
          location.replace(url);
        }
      }
       function Reactiver(id, url) {
        if (confirm("Voulez vous vraiment reactiver la carte " + ${carte.getId()} + " de "+ ${carte.getEmploye().getPrenom()} ${carte.getEmploye().getNom()} +" ?")) {
          location.replace(url);
        }
      }
</script>
    <!-- Main File-->
    <script src="js/front.js"></script>
    </body>
</html>