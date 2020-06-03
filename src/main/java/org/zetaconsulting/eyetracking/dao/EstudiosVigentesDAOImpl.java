package org.zetaconsulting.eyetracking.dao;

import org.springframework.stereotype.Service;
import org.zetaconsulting.eyetracking.model.EstudiosVigentes;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class EstudiosVigentesDAOImpl implements EstudiosVigentesDAO{

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void createEstudioVigente(EstudiosVigentes estudiosVigente) {
        entityManager.persist(estudiosVigente);
    }

    @Override
    public EstudiosVigentes getEstudioVigenteById(Long id) {
        return entityManager.find(EstudiosVigentes.class, id);
    }

    @Override
    public List<EstudiosVigentes> getAllEstudiosVigentes() {
        return entityManager.createQuery("select esv from EstudiosVigentes esv").getResultList();
    }

    @Override
    public void updateEstudiosVigentes(EstudiosVigentes estudiosVigente) {
        entityManager.merge(estudiosVigente);
    }

    @Override
    public void deleteEstudiosVigentes(Long id) {
        EstudiosVigentes esv = entityManager.find(EstudiosVigentes.class, id);
        entityManager.remove(esv);
    }
}
