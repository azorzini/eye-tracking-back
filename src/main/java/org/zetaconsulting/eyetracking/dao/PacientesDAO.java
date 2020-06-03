package org.zetaconsulting.eyetracking.dao;

import org.zetaconsulting.eyetracking.model.Pacientes;

import java.util.List;

public interface PacientesDAO {

    public Pacientes getPacienteById(Long id);

    public List<Pacientes> getAllPacientes();

    public void updatePaciente(Pacientes pacientes);

    public void deletePaciente(Long id);
}
