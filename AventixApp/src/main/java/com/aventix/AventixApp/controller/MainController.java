/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aventix.AventixApp.controller;
 
import com.aventix.AventixApp.form.LoginForm;
import com.aventix.AventixApp.modele.Carte;
import com.aventix.AventixApp.modele.Commercant;
import com.aventix.AventixApp.modele.Employe;
import com.aventix.AventixApp.modele.Entreprise;
import com.aventix.AventixApp.modele.Transa;
import com.aventix.AventixApp.services.ServicesImpl;
import com.aventix.AventixApp.session.SessionBean;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
 
@Controller
public class MainController {
    
    @Autowired
    private SessionBean sessionBean;
    
    ServicesImpl services = new ServicesImpl();
 
    @RequestMapping(value = { "/" }, method = RequestMethod.GET)
    public String home(Model model) {
        
        Entreprise entreprise = new Entreprise("Sodebo", "sodebo@miam.fr", "guest15", "20 avenue Albert Einstein", "0405070908");
        services.referencerEntreprise(entreprise);
        
        Commercant c3 = new Commercant("Paul", "paul@pain.fr", "briochedoree", "20 avenue albert einstein", "0403050784", "1234 5678 9101 1121");
        services.referencerCommercant(c3);
        
        Employe e1 =  new Employe("Vivian", "Wong", "Villeurbanne", "vivian.wong@insa-lyon.fr");
        services.referencerEmploye(e1);
        Carte c1 = new Carte(19);
        services.referencerCarte(c1);
        e1.affecterCarte(c1);
        
        Employe e2 =  new Employe("Olivier", "Cinquin", "Villeurbanne", "olivier.cinquin@insa-lyon.fr", entreprise);
        services.referencerEmploye(e2);
        Carte c2 = new Carte(29);
        services.referencerCarte(c2);
        e2.affecterCarte(c2);
        System.out.println(services.findCarteById(c2.getId()).getValidite());
        c2.setValidite(false);
        services.miseAJourCarte(c2);
        System.out.println(services.findCarteById(c2.getId()).getValidite());
        Transa t1 = new Transa(c2.getId(), c3.getId(), 13);
        Transa t2 = new Transa(c1.getId(), c3.getId(), 11);
        services.referencerTransa(t1);
        services.referencerTransa(t2);
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
            case "employeur":
                List<Entreprise> entreprise = services.findEntrepriseByEmail(connexion.getEmail());
                if (!entreprise.get(0).getNomEntreprise().isEmpty()) {
                    if (entreprise.get(0).verifLogin(connexion.getEmail(), connexion.getPassword())) {
                        sessionBean.setEntreprise(entreprise.get(0));
                        session.setAttribute("sessionBean", sessionBean);
                        return "indexEmployeur";
                    }
                }
                break;
            case "employe":
                List<Employe> employe = services.findEmployeByEmail(connexion.getEmail());
                if (!employe.get(0).getNom().isEmpty()) {
                    if (employe.get(0).verifLogin(connexion.getEmail(), connexion.getPassword())) {
                        sessionBean.setEmploye(employe.get(0));
                        session.setAttribute("sessionBean", sessionBean);
                        return "indexEmploye";
                    }
                }
                break;
            case "commercant":
                List<Commercant> commercant = services.findCommercantByEmail(connexion.getEmail());
                if (!commercant.get(0).getNomCommercant().isEmpty()) {
                    if (commercant.get(0).verifLogin(connexion.getEmail(), connexion.getPassword())) {
                        sessionBean.setCommercant(commercant.get(0));
                        session.setAttribute("sessionBean", sessionBean);
                        return "indexCommercant";
                    }
                }
                break;
            default:
                return "index";
        }
        return null;
    }
    
    /*@RequestMapping(value = { "/indexEmploye" }, method = RequestMethod.GET)
    public String indexEmploye(Model model) {
        String nom = services.findEmployeById(e.getId()).getNom();
        String prenom = services.findEmployeById(e.getId()).getPrenom();
        String statut = services.findEmployeById(e.getId()).getClass().getName().replaceFirst("com.aventix.AventixApp.modele.", "");
 
        model.addAttribute("nom", nom);
        model.addAttribute("prenom", prenom);
        model.addAttribute("statut", statut);
        return "indexEmploye";
    }*/
}