package org.zetaconsulting.eyetracking.dao;

import org.springframework.stereotype.Service;
import org.zetaconsulting.eyetracking.model.Pacientes;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class PacientesDAOImpl implements PacientesDAO{

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Pacientes getPacienteById(Long id) {
        return entityManager.find(Pacientes.class, id);
    }

    @Override
    public List<Pacientes> getAllPacientes() {
        return entityManager.createQuery("select pac from Pacientes pac").getResultList();
    }

    @Override
    public void updatePaciente(Pacientes pacientes) {
        entityManager.merge(pacientes);
    }

    @Override
    public void deletePaciente(Long id) {
        Pacientes p = entityManager.find(Pacientes.class, id);
        entityManager.remove(p);
    }

}
