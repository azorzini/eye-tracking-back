package org.zetaconsulting.eyetracking.dao;

import org.zetaconsulting.eyetracking.model.Cliente;
import org.zetaconsulting.eyetracking.model.Usuarios;

import java.util.List;

public interface UsuariosDAO {

    public void createUsuario(Usuarios usuario);

    public Usuarios getUsuarioById(Long id);

    public List<Usuarios> getAllUsuarios();

    public void updateUsuario(Usuarios usuario);

    public void deleteUsuario(Long id);

}
