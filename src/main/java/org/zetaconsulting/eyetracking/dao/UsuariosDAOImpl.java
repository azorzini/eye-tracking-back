package org.zetaconsulting.eyetracking.dao;

import org.springframework.stereotype.Service;
import org.zetaconsulting.eyetracking.model.Cliente;
import org.zetaconsulting.eyetracking.model.Usuarios;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UsuariosDAOImpl implements UsuariosDAO{


    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public void createUsuario(Usuarios usuario) {
        entityManager.persist(usuario);
    }

    @Override
    public Usuarios getUsuarioById(Long id) {
        return entityManager.find(Usuarios.class, id);
    }

    @Override
    public List<Usuarios> getAllUsuarios() {
        return entityManager.createQuery("select usr from Usuarios usr").getResultList();
    }

    @Override
    public void updateUsuario(Usuarios usuario) {
        entityManager.merge(usuario);
    }

    @Override
    public void deleteUsuario(Long id) {
        Usuarios usr = entityManager.find(Usuarios.class, id);
        entityManager.remove(usr);
    }
}
