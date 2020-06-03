package org.zetaconsulting.eyetracking.dao;

import org.zetaconsulting.eyetracking.model.Cliente;

import java.util.List;

public interface ClienteDAO {

    public void createCliente(Cliente cliente);

    public Cliente getClienteById(Long id);

    public List<Cliente> getAllClientes();

    public Cliente updateCliente(Cliente cliente);

    public void deleteCliente(Long id);

}
