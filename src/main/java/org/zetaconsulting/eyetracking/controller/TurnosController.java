package org.zetaconsulting.eyetracking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zetaconsulting.eyetracking.dao.TurnosDAO;
import org.zetaconsulting.eyetracking.model.Cliente;
import org.zetaconsulting.eyetracking.model.Turno;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@RestController
public class TurnosController {

    @Autowired
    TurnosDAO turnosDAO;

    @RequestMapping(value="/turnos",produces="application/json",
            method=RequestMethod.GET)
    public List<Turno> getTurnosByDate(@RequestParam("fechaTurno") Long fechaTurno) {

        System.out.println("fechaTurno: " + fechaTurno);
        Date fecha = new Date();
        fecha.setTime(fechaTurno);

        System.out.println(fecha);

        return turnosDAO.retrieveTurnosByDate(fecha);
    }

    @RequestMapping(value="/turnos", method= RequestMethod.POST,
            produces="application/json", consumes="application/json")
    public void createStudent(@RequestBody Turno turno)
    {
        turnosDAO.createTurno(turno);
    }

    @RequestMapping(value="/turnos/{id}",produces="application/json")
    public void deleteTurno(@PathVariable("id") long id)
    {
        turnosDAO.deleteTurno(id);
    }
}
