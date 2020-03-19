<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Aventix inscription by SoftDesign</title>
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
    <div class="container-fluid px-3">
      <div class="row min-vh-100">
        <div class="col-md-5 col-lg-6 col-xl-4 px-lg-5 d-flex align-items-center">
          <div class="w-100 py-5">
            <div class="text-center"><img src="img/brand/Aventix_logo.jpg" alt="..." style="max-width: 6rem;" class="img-fluid mb-4">
              <h1 class="display-4 mb-3">S'inscrire</h1>
              <p> Inscription Entreprise</p>
              </div>
            <form:form action="/saveregistration" modelAttribute="employeur" class="form-validate" >
                    <div class="form-group row">
                      <label class="col-sm-4 form-control-label"> Societé</label>
                      <div class="col-sm-8">
                        <form:input path="nomEntreprise" type="text" required="required" data-msg="S'il vous plait entrer le nom de votre societé" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group row">       
                      <label class="col-sm-4 form-control-label">Email</label>
                      <div class="col-sm-8">
                        <form:input id="form2-email" path="email"  type="email" required="required" data-msg="S'il vous plait entrer votreemail" class="form-control"/>
                      </div>
                    </div>
                    <div class="form-group row">       
                      <label class="col-sm-4 form-control-label">Confirmez votre email</label>
                      <div class="col-sm-8">
                        <input id="form2-email2" name="form2-email2" type="email" required="required" data-msg="Please confirm your email" data-rule-equalto="#form2-email" data-msg-equalto="emails do not match" class="form-control"/>
                      </div>
                    </div>
                    <div class="form-group row">       
                      <label class="col-sm-4 form-control-label">Mot de passe</label>
                      <div class="col-sm-8">
                        <form:input id="form2-password" path="password" type="password" required="required" data-msg="S'il vous plait entrer votre mots de passe" data-rule-minlength="5" data-msg-minlength="Your password should have at least 5 characters." class="form-control" />
                      </div>
                    </div>
                    <div class="form-group row">       
                      <label class="col-sm-4 form-control-label">Confirmez votre mot de passe</label>
                      <div class="col-sm-8">
                        <input id="form2-password2" name="form2-password2" type="password" required="required" data-msg="Please confirm your password" data-rule-equalto="#form2-password" data-msg-equalto="Passwords do not match" class="form-control" />
                      </div>
                    </div>

                    <div class="form-group row">
                      <label class="col-sm-4 form-control-label">Adresse</label>
                      <div class="col-sm-8">
                        <form:input path="adresse" type="text" required="required" data-msg="S'il vous plait entrer votre adresse" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="col-sm-4 form-control-label">Telephone</label>
                      <div class="col-sm-8">
                        <form:input path="telephone" type="text" placeholder="(999) 999-9999" data-mask="(999) 999-9999" required="required" data-msg="S'il vous plait entrer votre telephone" class="form-control" />
                      </div>                    
                    </div>
               
              <div class="form-group terms-conditions mb-4">
              
                <input id="register-agree" name="registerAgree" type="checkbox" required="required" value="1" data-msg="Your agreement is required" class="form-control-custom">
                <label for="register-agree">J'accepte les termes et la politique </label>
              </div>
              <!-- Submit-->
              <button class="btn btn-lg btn-block btn-primary mb-3">S'incrire</button>
              <!-- Link-->
              <p class="text-center"><small class="text-muted text-center">Vous avez déjà un compte? <a href="/login?statut=entreprise">Se Connecter</a>.</small></p>
            </form:form>
          </div>
        </div>
        <div class="col-12 col-md-7 col-lg-6 col-xl-8 d-none d-lg-block">
          <!-- Image-->
          <div style="background-image: url(img/photos/victor-ene-1301123-unsplash.jpg);" class="bg-cover h-100 mr-n3"></div>
        </div>
      </div>
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