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
import com.aventix.AventixApp.modele.Transa;
import com.aventix.AventixApp.services.ServicesImpl;
import com.aventix.AventixApp.session.SessionBeanCommercant;
import com.aventix.AventixApp.session.SessionBeanEmploye;
import com.aventix.AventixApp.session.SessionBeanEntreprise;
import java.util.List;
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
        
        Entreprise entreprise = new Entreprise("Sodebo", "sodebo@miam.fr", "guest15", "20 avenue Albert Einstein", "0405070908");
        services.referencerEntreprise(entreprise);
        
        Commercant c3 = new Commercant("Paul", "paul@pain.fr", "briochedoree", "20 avenue albert einstein", "0403050784", "1234 5678 9101 1121");
        services.referencerCommercant(c3);
        
        Employe e1 =  new Employe("Vivian", "Wong", "Villeurbanne", "vivian.wong@insa-lyon.fr", entreprise);
        services.referencerEmploye(e1);
        Carte c1 = new Carte(19);
        services.referencerCarte(c1);
        e1.affecterCarte(c1);
        
        Employe e2 =  new Employe("Olivier", "Cinquin", "Villeurbanne", "olivier.cinquin@insa-lyon.fr", entreprise);
        services.referencerEmploye(e2);
        Carte c2 = new Carte(29);
        services.referencerCarte(c2);
        e2.affecterCarte(c2);
        c2.setValidite(false);
        services.miseAJourCarte(c2);
        c1.recharger(100);
        c2.recharger(120);
        Transa t1 = new Transa(c2.getId(), c3.getId(), 13);
        Transa t2 = new Transa(c1.getId(), c3.getId(), 11);
        services.referencerTransa(t1);
        services.referencerTransa(t2);
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
    public String newEmploye(Model model, @Valid Employe employe) {    	
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
    public String newCommande(Model model, @Valid Commande commande) {    	
        Commande com = new Commande(
            this.sessionBeanEntreprise.getEntreprise(),
            commande.getNbCartes(),
            commande.getCommentaires()
        );
        services.referencerCommande(com);
        return "indexEntreprise";
    }
}