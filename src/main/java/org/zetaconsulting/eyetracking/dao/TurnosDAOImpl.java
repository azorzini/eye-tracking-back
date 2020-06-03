package org.zetaconsulting.eyetracking.dao;

import org.springframework.stereotype.Service;
import org.zetaconsulting.eyetracking.model.Cliente;
import org.zetaconsulting.eyetracking.model.Turno;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class TurnosDAOImpl implements TurnosDAO {


    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Turno> retrieveTurnosByDate(Date date) {

        List<Turno> results = entityManager.createQuery("select t from Turno t where t.fechaTurno = :fechaTurno")
                .setParameter("fechaTurno", date).getResultList();
        return results;
    }

    @Override
    public void createTurno(Turno turno) {
        entityManager.persist(turno);
    }

    @Override
    public void deleteTurno(Long id) {
        Turno t = entityManager.find(Turno.class, id);
        entityManager.remove(t);
    }
}
