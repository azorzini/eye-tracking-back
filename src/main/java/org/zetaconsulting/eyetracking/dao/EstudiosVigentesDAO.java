package org.zetaconsulting.eyetracking.dao;

import org.zetaconsulting.eyetracking.model.Cliente;
import org.zetaconsulting.eyetracking.model.EstudiosVigentes;

import java.util.List;

public interface EstudiosVigentesDAO {

    public void createEstudioVigente(EstudiosVigentes estudiosVigente);

    public EstudiosVigentes getEstudioVigenteById(Long id);

    public List<EstudiosVigentes> getAllEstudiosVigentes();

    public void updateEstudiosVigentes(EstudiosVigentes estudiosVigente);

    public void deleteEstudiosVigentes(Long id);

}
