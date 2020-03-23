/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aventix.AventixApp.controller;
 
import com.aventix.AventixApp.form.LoginForm;
import com.aventix.AventixApp.modele.Carte;
import com.aventix.AventixApp.modele.Commande;
import com.aventix.AventixApp.modele.Commercant;
import com.aventix.AventixApp.modele.Employe;
import com.aventix.AventixApp.modele.Entreprise;
import com.aventix.AventixApp.modele.ServiceFacturation;
import com.aventix.AventixApp.modele.Transa;
import com.aventix.AventixApp.services.ServicesImpl;
import com.aventix.AventixApp.session.SessionBeanCommercant;
import com.aventix.AventixApp.session.SessionBeanEmploye;
import com.aventix.AventixApp.session.SessionBeanEntreprise;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
 
@Controller
public class MainController {
    
    @Autowired
    private SessionBeanEmploye sessionBeanEmploye;
    @Autowired
    private SessionBeanEntreprise sessionBeanEntreprise;
    @Autowired
    private SessionBeanCommercant sessionBeanCommercant;
    
    ServicesImpl services = new ServicesImpl();
    
    //Home + genere donnees
    @RequestMapping(value = { "/" }, method = RequestMethod.GET)
    public String home(Model model) {
        
        //Les entreprises
        Entreprise entreprise1 = new Entreprise("SNCF", "lestrainsarriventparfoisalheure@sncf.fr", "sncf15", "Gare de Lyon - Paris", "0105070908");
        Entreprise entreprise2 = new Entreprise("Airbus", "lesavionspolluent@airbus.fr", "airbus15", "Aéroport Saint-Exupéry - Lyon", "0405070908");
        Entreprise entreprise3 = new Entreprise("TCL", "lesbuscestcool@tcl.fr", "tcl15", "Gare routière Part-Dieu - Lyon", "0406070908");
        services.referencerEntreprise(entreprise1);
        services.referencerEntreprise(entreprise2);
        services.referencerEntreprise(entreprise3);
        
        //Les commercants
        Commercant commercant1 = new Commercant("Paul", "paul@pain.fr", "paul15", "20 avenue des Brioches Dorées - Lyon", "0403050784", "1234 5678 9101 1121");
        Commercant commercant2 = new Commercant("Carloni", "carloni@pizza.fr", "carloni15", "17 allée des Pepperonis - Villeurbanne", "0407050784", "1734 5678 9101 1121");
        Commercant commercant3 = new Commercant("Kebabylone", "kebabylone@salade-tomate-oignons.fr", "kebabylone15", "2 rue des Maux de Bide - Lyon", "0407016784", "1734 8613 9101 1121");
        services.referencerCommercant(commercant1);
        services.referencerCommercant(commercant2);
        services.referencerCommercant(commercant3);
        
        //Les employés
        Employe employe1 =  new Employe("Vivian", "Wong", "Caluire-et-Cuire", "vivian.wong@insa-lyon.fr", entreprise2);
        Employe employe2 =  new Employe("Olivier", "Cinquin", "Villeurbanne", "olivier.cinquin@insa-lyon.fr", entreprise3);
        Employe employe3 =  new Employe("Pierre", "Chalmel", "Paris", "pierre.chalmel@insa-lyon.fr", entreprise1);
        services.referencerEmploye(employe1);
        services.referencerEmploye(employe2);
        services.referencerEmploye(employe3);
        
        //Les cartes
        Carte carte1 = new Carte(19);
        Carte carte2 = new Carte(12);
        Carte carte3 = new Carte(23);
        services.referencerCarte(carte1);
        services.referencerCarte(carte2);
        services.referencerCarte(carte3);
        employe1.affecterCarte(carte1);
        employe2.affecterCarte(carte3);
        employe3.affecterCarte(carte2);
        
        carte2.setValidite(false);
        services.miseAJourCarte(carte2);
        
        carte1.recharger(100);
        carte2.recharger(50);
        carte3.recharger(120);
        
        //Les transactions
        Transa transaction1 = new Transa(carte2.getId(), commercant3.getId(), 6);
        Transa transaction2 = new Transa(carte1.getId(), commercant1.getId(), 12);
        Transa transaction3 = new Transa(carte3.getId(), commercant2.getId(), 13);
        services.referencerTransa(transaction1);
        services.referencerTransa(transaction2);
        services.referencerTransa(transaction3);
        
        //Les commandes
        Commande commande1 = new Commande(entreprise1, 140, "A l'heure svp !");
        Commande commande2 = new Commande(entreprise2, 230, "En vitesse svp !");
        Commande commande3 = new Commande(entreprise3, 85, "Sans polluer svp !");
        services.referencerCommande(commande1);
        services.referencerCommande(commande2);
        services.referencerCommande(commande3);
        
        return "index";
    }
    
    @RequestMapping(value="/index", method = RequestMethod.GET)
    public String deconnexion(Model model) {
        return "index";
    }
    
    @RequestMapping(value="/indexEmploye", method = RequestMethod.GET)
    public String accueilEmploye(Model model) {	
        return "indexEmploye";
    }
    
    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String login(Model model, @RequestParam(value="statut") String statut ) {
    	
    	model.addAttribute("statut", statut); //permet d'envoyer des variables dans jsp
    	model.addAttribute("connexion", new LoginForm());
    	
        return "login";
    }
    
    @RequestMapping(value="/connexion", method = RequestMethod.POST)
    public String Connexion(Model model, @Valid LoginForm connexion, HttpSession session) {    	
        switch (connexion.getStatut()) {
            case "entreprise":
                List<Entreprise> entreprise = services.findEntrepriseByEmail(connexion.getEmail());
                if (!entreprise.get(0).getNomEntreprise().isEmpty()) {
                    if (entreprise.get(0).verifLogin(connexion.getEmail(), connexion.getPassword())) {
                        sessionBeanEntreprise.setEntreprise(entreprise.get(0));
                        session.setAttribute("sessionBean", sessionBeanEntreprise);
                        return "indexEntreprise";
                    }
                }
                break;
            case "employe":
                List<Employe> employe = services.findEmployeByEmail(connexion.getEmail());
                if (!employe.get(0).getNom().isEmpty()) {
                    if (employe.get(0).verifLogin(connexion.getEmail(), connexion.getPassword())) {
                        sessionBeanEmploye.setEmploye(employe.get(0));
                        session.setAttribute("sessionBean", sessionBeanEmploye);
                        return "indexEmploye";
                    }
                }
                break;
            case "commercant":
                List<Commercant> commercant = services.findCommercantByEmail(connexion.getEmail());
                if (!commercant.get(0).getNomCommercant().isEmpty()) {
                    if (commercant.get(0).verifLogin(connexion.getEmail(), connexion.getPassword())) {
                        sessionBeanCommercant.setCommercant(commercant.get(0));
                        session.setAttribute("sessionBean", sessionBeanCommercant);
                        int nbCompensation = commercant.get(0).nbCompensation();
                        float montantAPercevoir = commercant.get(0).montantAPercevoir();
                        int transactionsCompensees = commercant.get(0).nbCompensationEffectuees();
                        model.addAttribute("nbCompensation", nbCompensation);
                        model.addAttribute("montantAPercevoir", montantAPercevoir);
                        model.addAttribute("transactionsCompensees", transactionsCompensees);
                        return "indexCommercant";
                    }
                }
                break;
            default:
                return "index";
        }
        return "login";
    }
    
    @RequestMapping(value="/faq", method = RequestMethod.GET)
    public String faqEmploye(Model model) {	
        return "faq";
    }
    
    @RequestMapping(value="/contact", method = RequestMethod.GET)
    public String contactEmploye(Model model) {	
        return "contact";
    }
    
    @RequestMapping(value="/maps-employe", method = RequestMethod.GET)
    public String mapsEmploye(Model model) {	
        return "maps-employe";
    }
    
    @RequestMapping(value="/listeRestaurants", method = RequestMethod.GET)
    public String listeRestaurantsEmploye(Model model) {
        List<Commercant> commercants = services.findAllCommercants();
        model.addAttribute("commercants", commercants);
        return "listeRestaurants";
    }
    
    @RequestMapping(value="/listeTransactions", method = RequestMethod.GET)
    public String listeTransactionsEmploye(Model model) {
        List<Transa> transactions = services.findTransaByIdCarte(sessionBeanEmploye.getEmploye().getCarte().getId());
        model.addAttribute("transactions", transactions);
        return "listeTransactions";
    }

    @RequestMapping(value="/card-employe", method = RequestMethod.GET)
    public String carteEmploye(Model model) {
        String validite;
        if (services.findCarteByIdEmploye(sessionBeanEmploye.getEmploye().getId()).getValidite()) {
            validite = "Carte activée";
        }else{
            validite = "Carte désactivée";
        }
        model.addAttribute("validite", validite);
        return "card-employe";
    }
    
    @RequestMapping(value="/indexEntreprise", method = RequestMethod.GET)
    public String accueilEntreprise(Model model) {	
        return "indexEntreprise";
    }
    
    @RequestMapping(value="/faqEntreprise", method = RequestMethod.GET)
    public String faqEntreprise(Model model) {	
        return "faqEntreprise";
    }
    
    @RequestMapping(value="/contactEntreprise", method = RequestMethod.GET)
    public String contactEntreprise(Model model) {	
        return "contactEntreprise";
    }
    
    @RequestMapping(value="/listeCartes", method = RequestMethod.GET)
    public String listeCartesEntreprise(Model model) {
        List<Carte> cartes = services.findCarteByIdEntreprise(sessionBeanEntreprise.getEntreprise().getId());
        model.addAttribute("cartes", cartes);
        return "listeCartes";
    }
    
    @RequestMapping(value="/newEmploye", method = RequestMethod.GET)
    public String newEmployeEntreprise(Model model) {
        model.addAttribute("employe", new Employe());
        return "newEmploye";
    }
    
    @RequestMapping(value="/listeEmployes", method = RequestMethod.GET)
    public String listeEmployeEntreprise(Model model) {
        List<Employe> employes = services.findEmployeByIdEntreprise(sessionBeanEntreprise.getEntreprise().getId());
        model.addAttribute("employes", employes);
        return "listeEmployes";
    }
    
    @RequestMapping(value="/newCommande", method = RequestMethod.GET)
    public String newCommandeEntreprise(Model model) {	
        model.addAttribute("commande", new Commande());
        return "newCommande";
    }
    
    @RequestMapping(value="/listeCommandes", method = RequestMethod.GET)
    public String listeCommandeEntreprise(Model model) {
        List<Commande> commandes = services.findCommandeByIdEntreprise(sessionBeanEntreprise.getEntreprise().getId());
        model.addAttribute("commandes", commandes);
        return "listeCommandes";
    }
    
    @RequestMapping(value="/indexCommercant", method = RequestMethod.GET)
    public String accueilCommercant(Model model) {
        int nbCompensation = sessionBeanCommercant.getCommercant().nbCompensation();
        float montantAPercevoir = sessionBeanCommercant.getCommercant().montantAPercevoir();
        int transactionsCompensees = sessionBeanCommercant.getCommercant().nbCompensationEffectuees();
        model.addAttribute("montantAPercevoir", montantAPercevoir);
        model.addAttribute("nbCompensation", nbCompensation);
        model.addAttribute("transactionsCompensees", transactionsCompensees);
        return "indexCommercant";
    }
    
    @RequestMapping(value="/faqCommercant", method = RequestMethod.GET)
    public String faqCommercant(Model model) {	
        return "faqCommercant";
    }
    
    @RequestMapping(value="/contactCommercant", method = RequestMethod.GET)
    public String contactCommercant(Model model) {	
        return "contactCommercant";
    }
    
    @RequestMapping(value="/listeTransactionsCommercant", method = RequestMethod.GET)
    public String listeTransactionsCommercant(Model model) {
        List<Transa> transactions = services.findTransaByIdCommercant(sessionBeanCommercant.getCommercant().getId());
        model.addAttribute("transactions", transactions);
        return "listeTransactionsCommercant";
    }
    
    @RequestMapping(value="/newEmploye", method = RequestMethod.POST)
    public String newEmploye(Model model, @Valid Employe employe) throws MessagingException {    	
        Employe emp = new Employe(
            employe.getPrenom(),
            employe.getNom(),
            employe.getAdresse(),
            employe.getEmail(),
            this.sessionBeanEntreprise.getEntreprise()
        );
        services.referencerEmploye(emp);
        Carte carte = new Carte();
        services.referencerCarte(carte);
        emp.affecterCarte(carte);
        return "indexEntreprise";
    }
    
    @RequestMapping(value="/newCommande", method = RequestMethod.POST)
    public String newCommande(Model model, @Valid Commande commande) throws MessagingException {    	
        Commande com = new Commande(
            this.sessionBeanEntreprise.getEntreprise(),
            commande.getNbCartes(),
            commande.getCommentaires()
        );
        services.referencerCommande(com);
        ServiceFacturation sF = new ServiceFacturation();
        services.referencerServiceFacturation(sF);
        sF.envoyerFacture(com);
        return "indexEntreprise";
    }
    
    @RequestMapping(value="/modifierEmploye", method = RequestMethod.GET)
    public String modifierEmploye(Model model, @RequestParam(value="idEmploye") Long idEmploye ) {
        Employe employe = services.findEmployeById(idEmploye);
        model.addAttribute("idEmploye", idEmploye); //permet d'envoyer des variables dans jsp
        model.addAttribute("employe", employe);
        return "modifierEmploye";
    }
    
    @RequestMapping(value="/modifierEmploye", method = RequestMethod.POST)
    public String modifierEmploye(Model model, Model model2, @Valid Employe employe) {    	
        Employe emp = services.findEmployeByNom(employe.getNom()).get(0);
        emp.setPrenom(employe.getPrenom());
        emp.setNom(employe.getNom());
        emp.setAdresse(employe.getAdresse());
        emp.setEmail(employe.getEmail());
        services.miseAJourEmploye(emp);
        
        List<Employe> employes = services.findEmployeByIdEntreprise(sessionBeanEntreprise.getEntreprise().getId());
        model2.addAttribute("employes", employes);
        
        return this.listeEmployeEntreprise(model2);
    }
}