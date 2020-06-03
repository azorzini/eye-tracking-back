package org.zetaconsulting.eyetracking.dao;

import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Service;
import org.zetaconsulting.eyetracking.model.Cliente;
import org.zetaconsulting.eyetracking.model.HistoriaClinica;
import org.zetaconsulting.eyetracking.model.Orbita;
import org.zetaconsulting.eyetracking.model.Pacientes;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ClienteDAOImpl implements ClienteDAO{

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void createCliente(Cliente cliente) {
        entityManager.persist(cliente);
        entityManager.flush();
        Pacientes p = new Pacientes();
        p.setDatosCliente(cliente);
        p.setFechaUltimaModificacion(new Date());

        HistoriaClinica hc = new HistoriaClinica();

        p.setHistoriaClinica(hc);
        entityManager.persist(p);
        entityManager.flush();

        Orbita izquierda = new Orbita();
        izquierda.setEsDerecho(false);
        izquierda.setHicId(hc.getId());
        Orbita derecha = new Orbita();
        derecha.setEsDerecho(true);
        derecha.setHicId(hc.getId());

        List<Orbita> orbitas = new ArrayList<Orbita>();
        orbitas.add(izquierda);
        orbitas.add(derecha);

        hc.setOrbitas(orbitas);

        entityManager.persist(hc);
        entityManager.flush();

    }

    @Override
    public Cliente getClienteById(Long id) {
        return entityManager.find(Cliente.class, id);
    }

    @Override
    public List<Cliente> getAllClientes() {
        return entityManager.createQuery("select cli from Cliente cli").getResultList();
    }

    @Override
    public Cliente updateCliente(Cliente cliente) {
        entityManager.merge(cliente);
        return cliente;
    }

    @Override
    public void deleteCliente(Long id) {
        Cliente c = entityManager.find(Cliente.class, id);
        entityManager.remove(c);
    }
}
