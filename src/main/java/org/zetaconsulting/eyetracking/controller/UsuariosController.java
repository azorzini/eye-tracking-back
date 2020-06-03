package org.zetaconsulting.eyetracking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zetaconsulting.eyetracking.dao.UsuariosDAO;
import org.zetaconsulting.eyetracking.model.Usuarios;

import java.util.List;

@RestController
public class UsuariosController {

    @Autowired
    private UsuariosDAO usuariosDAO;

    @RequestMapping(value="/usuarios", method= RequestMethod.POST,
            produces="application/json", consumes="application/json")
    public void createUsuario(@RequestBody Usuarios usuario) {
        usuariosDAO.createUsuario(usuario);
    }

    @RequestMapping(value="/usuarios/{id}",produces="application/json",
            method=RequestMethod.GET)
    public Usuarios getUsuariosById(@PathVariable("id") long id) {
        Usuarios usuario = usuariosDAO.getUsuarioById(id);
        return usuario;
    }

    @RequestMapping(value="/usuarios",produces="application/json",
            method=RequestMethod.GET)
    public List<Usuarios> getAllUsuarios()
    {
        List<Usuarios> usuarios = usuariosDAO.getAllUsuarios();
        return usuarios;
    }

    @RequestMapping(value="/usuarios", method=RequestMethod.PUT,
            produces="application/json", consumes="application/json")
    public void updateUsuario(@RequestBody Usuarios usuario)
    {
        usuariosDAO.updateUsuario(usuario);
    }

    @RequestMapping(value="/usuarios/{id}",produces="application/json")
    public void deleteUsuario(@PathVariable("id") long id)
    {
        usuariosDAO.deleteUsuario(id);
    }

}

