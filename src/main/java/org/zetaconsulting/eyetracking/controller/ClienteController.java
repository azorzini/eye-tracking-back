package org.zetaconsulting.eyetracking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zetaconsulting.eyetracking.dao.ClienteDAO;
import org.zetaconsulting.eyetracking.model.Cliente;

import java.util.List;

@RestController
public class ClienteController {

    @Autowired
    private ClienteDAO clienteDAO;

    @RequestMapping(value="/clientes", method= RequestMethod.POST,
            produces="application/json", consumes="application/json")
    public void createStudent(@RequestBody Cliente cliente)
    {
        clienteDAO.createCliente(cliente);
    }

    @RequestMapping(value="/clientes/{id}",produces="application/json",
            method=RequestMethod.GET)
    public Cliente getStudentById(@PathVariable("id") long id)
    {
        Cliente cliente = clienteDAO.getClienteById(id);
        return cliente;
    }

    @RequestMapping(value="/clientes",produces="application/json",
            method=RequestMethod.GET)
    public List<Cliente> getAllStudents()
    {
        List<Cliente> clienteList = clienteDAO.getAllClientes();
        return clienteList;
    }

    @RequestMapping(value="/clientes", method=RequestMethod.PUT,
            produces="application/json", consumes="application/json")
    public Cliente updateStudent(@RequestBody Cliente cliente)
    {
        return clienteDAO.updateCliente(cliente);
    }


    @RequestMapping(value="/clientes/{id}/delete",produces="application/json")
    public void deleteCliente(@PathVariable("id") long id)
    {
        clienteDAO.deleteCliente(id);
    }


}
