<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Aventix - Nouvelle commande</title>
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
          <div class="sidenav-header-logo"><a href="/indexEntreprise" class="brand-small text-center"> <strong>${sessionScope['scopedTarget.sessionBeanEntreprise'].entreprise.getNomEntreprise().charAt(0)}${sessionScope['scopedTarget.sessionBeanEntreprise'].entreprise.getNomEntreprise().charAt(1)}${sessionScope['scopedTarget.sessionBeanEntreprise'].entreprise.getNomEntreprise().charAt(2)}</strong></a></div>
        </div>
        <!-- Sidebar Navigation Menus-->
        <div class="main-menu">
          <h5 class="sidenav-heading">Menu</h5>
          <ul id="side-main-menu" class="side-menu list-unstyled">                  
            <li ><a href="/indexEntreprise"> <i class="icon-home"></i>Accueil</a></li>
            <li class="active"><a href="#commande" aria-expanded="true" data-toggle="collapse"> <i class="fa fa-shopping-cart"></i> Commande</a>
              <ul id="commande" class="collapse list-unstyled show ">
                <li class="active"><a href="/newCommande">Nouvelle commande</a></li>
                <li><a href="/listeCommandes">Liste des commandes</a></li>
              </ul>
            </li>
              <li><a href="#employe" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-user-circle-o"></i>Employé</a>
              <ul id="employe" class="collapse list-unstyled ">
                <li><a href="/newEmploye">Nouvel employé</a></li>
                <li><a href="/listeEmployes">Liste des employés</a></li>
              </ul>
            </li>
             <li><a href="/listeCartes"> <i class="fa fa-address-card-o"></i>Liste des cartes</a></li>
            <li><a href="/contactEntreprise"> <i class="fa fa-phone"></i>Contact</a> </li>
            <li><a href="/faqEntreprise"><i class="fa fa-question-circle"></i>FAQ</a></li>
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
                <li class="nav-item dropdown"><a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle"><img src="img/flags/16/FR.png" alt="French"><span class="d-none d-sm-inline-block">Français</span></a>
                  <ul aria-labelledby="languages" class="dropdown-menu">
                    <li><a rel="nofollow" href="#" class="dropdown-item"> <img src="img/flags/16/GB.png" alt="French" class="mr-2"><span>Français</span></a></li>
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
            <li class="breadcrumb-item"><a href="/indexEntreprise">Accueil</a></li>
            <li class="breadcrumb-item active"> Commande</li>
          </ul>
        </div>
      </div>
      <section class="dashboard-counts section-padding">
        <div class="container-fluid">
          <!-- Count item widget-->
            <div class="col-12">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="fa fa-shopping-cart"></i><div>
                <div class="name"><strong class="text-uppercase">Panier</strong><span> Nouvelle Commande</span>
                </div>
              </div>
            </div>
        </div>
      </section>
      <!-- Counts Section -->
      <section class="forms"> 
        <form:form action="/newCommande" modelAttribute="commande" class="form-validate">
        <div class="container-fluid">
          <div class="row">
            <div class="col-xl-10">
              <div class="card card-body p-5">
                <div class="row">
                  <div class="col text-center">
                    <!-- Logo--><img src="img/brand/Aventix_logo.jpg" alt="..." style="max-width: 6rem;" class="img-fluid mb-4">
                    <!-- Heading-->
                    <h2 class="mb-2">Commande de Cartes Aventix, Ltd.</h2></br>
                  </div>
                </div>
                <div class="row">
                  <div class="col-12">
                    <!-- Table-->
                    <div class="table-responsive">
                      <table class="table my-4">
                        <thead>
                          <tr>
                            <th class="px-0 bg-transparent border-top-0"><span class="h6"><i class="fa fa-address-card-o"></i></span></th>
                            <th class="px-0 bg-transparent border-top-0 text-right"></th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="px-0">Nombre de carte</td>
                            <td class="px-0 text-right"><form:input path="nbCartes" type="number" id="nbCartes" name="nbCartes"  min="10" required="required"/></td>
                          </tr>
                          <tr>
                            <td class="px-0">Prix Unitaire</td>
                            <td class="px-0 text-right" >20,00</td>
                          </tr>
                          <tr>
                            <td class="px-0">Commentaires</td>
                            <td class="px-0 text-right"><form:input path="commentaires" type="text" id="commentaires" name="commentaires"/></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <div class="row">
                  <div class="col text-center">
                    <p class="mb-0" >
                      <button type="submit" class="btn btn-primary mb-2 mb-sm-0">Commander</button>
                   </p>
                  </div>
                </div>
                   
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
       </form:form>
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

    <script>    
          
      /*function total() {
        console.log(document.getElementById("nombreCarte").value);
        var nbCarte=parseInt(document.getElementById("nombreCarte").value);
        var totalApaye= nbCarte*20;
        console.log(document.formAchat.totalApayer);
        document.formAchat.totalApayer=totalApayer;
        console.log(document.formAchat.totalApayer.value);
        '<span class="totalApayer" id="totalApayer" name="totalApayer">'totalApayer'</span>';

      }*/
      $(function(){

        var input = $('#onglet input[name="nombreCarte"]');
        var result=$('#onglet.totalApayer');

        input.on('keydown', function(event){
          var totalApayer =+ event.target.value * 20;
          result.html("Le resultat est :"+totalApayer);

        });
      });

    </script>
    <!-- Notifications-->
    <script src="vendor/messenger-hubspot/build/js/messenger.min.js">   </script>
    <script src="vendor/messenger-hubspot/build/js/messenger-theme-flat.js">       </script>
    <script src="js/home-premium.js"> </script>
    <!-- Main File-->
    <script src="js/front.js"></script>
  </body>
</html>