package org.zetaconsulting.eyetracking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zetaconsulting.eyetracking.dao.PacientesDAO;
import org.zetaconsulting.eyetracking.model.Pacientes;

import java.util.List;

@RestController
public class PacientesController {

    @Autowired
    private PacientesDAO pacientesDAO;

    @RequestMapping(value="/pacientes/{id}",produces="application/json",
            method=RequestMethod.GET)
    public Pacientes getPacienteById(@PathVariable("id") long id)
    {
        Pacientes pacientes = pacientesDAO.getPacienteById(id);
        return pacientes;
    }

    @RequestMapping(value="/pacientes",produces="application/json",
            method=RequestMethod.GET)
    public List<Pacientes> getAllPacientes()
    {
        List<Pacientes> pacientesList = pacientesDAO.getAllPacientes();
        return pacientesList;
    }

    @RequestMapping(value="/pacientes", method=RequestMethod.PUT,
            produces="application/json", consumes="application/json")
    public void updateStudent(@RequestBody Pacientes pacientes) {
        pacientesDAO.updatePaciente(pacientes);
    }

    @RequestMapping(value="/pacientes/{id}/delete",produces="application/json")
    public void deletePaciente(@PathVariable("id") long id) {
        pacientesDAO.deletePaciente(id);
    }

}
