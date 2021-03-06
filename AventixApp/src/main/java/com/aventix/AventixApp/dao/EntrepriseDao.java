                                /*Dao Entreprise*/

package com.aventix.AventixApp.dao;

/*----------------------------------IMPORTS-----------------------------------*/

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import com.aventix.AventixApp.modele.Entreprise;
import com.aventix.AventixApp.util.JpaUtil;

/*--------------------------------FIN IMPORTS---------------------------------*/

public class EntrepriseDao {
    
/*----------------------------GESTION ENTREPRISE------------------------------*/
    
    public void createEntreprise(Entreprise e){
        EntityManager em = JpaUtil.getEntityManager();
        em.persist(e);
    }
    
    public void updateEntreprise(Entreprise e){
        EntityManager em = JpaUtil.getEntityManager();
        em.merge(e);
    }
    
    public void deleteEntreprise(Entreprise e){
        EntityManager em = JpaUtil.getEntityManager();
        em.remove(em.merge(e));
    }
    
/*--------------------------FIN GESTION ENTREPRISES---------------------------*/
    
/*----------------------------FINDERS ENTREPRISES-----------------------------*/
    
    public List<Entreprise> findAllEntreprises(){
        EntityManager em = JpaUtil.getEntityManager();
        Query query = em.createQuery("select e from Entreprise as e");
        List<Entreprise> liste = query.getResultList();
        return liste;
    }
    
    public Entreprise findEntrepriseById(Long idEntreprise){
        EntityManager em = JpaUtil.getEntityManager();
        return em.find(Entreprise.class, idEntreprise);
    }
    
    public List<Entreprise> findEntrepriseByNom(String nomEntreprise){
        EntityManager em = JpaUtil.getEntityManager();
        Query query = em.createQuery("select e from Entreprise as e where e.nomEntreprise=:nomEntreprise").setParameter("nomEntreprise", nomEntreprise);
        List<Entreprise> liste = query.getResultList();
        return liste;
    }
    
    public List<Entreprise> findEntrepriseByEmail(String email){
        EntityManager em = JpaUtil.getEntityManager();
        Query query = em.createQuery("select e from Entreprise as e where e.email=:email").setParameter("email", email);
        List<Entreprise> liste = query.getResultList();
        return liste;
    }
    
/*--------------------------FIN FINDERS ENTREPRISES---------------------------*/
    
}

                            /*Fin Dao Entreprise*/