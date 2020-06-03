package org.zetaconsulting.eyetracking.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.zetaconsulting.eyetracking.model.Turno;

import java.util.Date;
import java.util.List;

public interface TurnosRepository extends JpaRepository<Turno, Integer> {

    List<Turno> findAllByFechaTurno(Date fechaTurno);

/*    void createTurno(Turno turno);*/

}
