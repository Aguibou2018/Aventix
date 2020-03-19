                                /*Dao Commercant*/

package com.aventix.AventixApp.dao;

/*----------------------------------IMPORTS-----------------------------------*/

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import com.aventix.AventixApp.modele.Commercant;
import com.aventix.AventixApp.util.JpaUtil;

/*--------------------------------FIN IMPORTS---------------------------------*/

public class CommercantDao {
    
/*----------------------------GESTION COMMERCANTS-----------------------------*/
    
    public void createCommercant(Commercant c){
        EntityManager em = JpaUtil.getEntityManager();
        em.persist(c);
    }
    
    public void updateCommercant(Commercant c){
        EntityManager em = JpaUtil.getEntityManager();
        em.merge(c);
    }
    
    public void deleteCommercant(Commercant c){
        EntityManager em = JpaUtil.getEntityManager();
        em.remove(em.merge(c));
    }
    
/*--------------------------FIN GESTION COMMERCANTS---------------------------*/
    
/*----------------------------FINDERS COMMERCANTS-----------------------------*/
    
    public List<Commercant> findAllCommercants(){
        EntityManager em = JpaUtil.getEntityManager();
        Query query = em.createQuery("select c from Commercant as c");
        List<Commercant> liste = query.getResultList();
        return liste;
    }
    
    public Commercant findCommercantById(Long idCommercant){
        EntityManager em = JpaUtil.getEntityManager();
        return em.find(Commercant.class, idCommercant);
    }
    
    public List<Commercant> findCommercantByNom(String nomCommercant){
        EntityManager em = JpaUtil.getEntityManager();
        Query query = em.createQuery("select c from Commercant as c where c.nomCommercant=:nomCommercant").setParameter("nomCommercant", nomCommercant);
        List<Commercant> liste = query.getResultList();
        return liste;
    }
    
    public List<Commercant> findCommercantByEmail(String email){
        EntityManager em = JpaUtil.getEntityManager();
        Query query = em.createQuery("select c from Commercant as c where c.email=:email").setParameter("email", email);
        List<Commercant> liste = query.getResultList();
        return liste;
    }
    
/*--------------------------FIN FINDERS COMMERCANTS---------------------------*/
    
}

                            /*Fin Dao Commercant*/