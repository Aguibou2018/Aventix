                        /*Interface Services Employe*/
package com.aventix.AventixApp.services;

/*---------------------------------IMPORTS------------------------------------*/

import java.util.List;
import com.aventix.AventixApp.modele.Employe;

/*--------------------------------FIN IMPORTS---------------------------------*/

public interface ServicesEmploye {
    
    public void referencerEmploye(Employe e);
    public void dereferencerEmploye(Employe e);
    public void miseAJourEmploye(Employe e);
    public List<Employe> findAllEmployes();
    public List<Employe> findEmployeByPrenom(String prenom);
    public List<Employe> findEmployeByNom(String nom);
    public List<Employe> findEmployeByIdEntreprise(Long idEntreprise);
    public Employe findEmployeByIdCarte(Long idCarte);
    public List<Employe> findEmployeByEmail(String email);
    public Employe findEmployeById(Long idEmploye);
}

                    /*Fin Interface Services Employe*/