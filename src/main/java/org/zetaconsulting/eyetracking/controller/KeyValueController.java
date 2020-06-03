package org.zetaconsulting.eyetracking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.zetaconsulting.eyetracking.dao.KeyValueDAO;
import org.zetaconsulting.eyetracking.model.KeyValue;

import java.util.List;

@RestController
public class KeyValueController {

    @Autowired
    private KeyValueDAO keyValueDAO;

    @RequestMapping(value="/keyvalue", method= RequestMethod.POST,
            produces="application/json", consumes="application/json")
    public void createKeyValue(@RequestBody KeyValue keyValue) {
        keyValueDAO.createKeyValue(keyValue);
    }

    @RequestMapping(value="/keyvalue/{id}",produces="application/json",
            method=RequestMethod.GET)
    public KeyValue getKeyValueById(@PathVariable("id") long id) {
        KeyValue keyValue = keyValueDAO.getKeyValueById(id);
        return keyValue;
    }

    @RequestMapping(value="/keyvalue",produces="application/json",
            method=RequestMethod.GET)
    public List<KeyValue> getAllKeyValues()
    {
        List<KeyValue> keyValues = keyValueDAO.getAllKeyValues();
        return keyValues;
    }

    @RequestMapping(value="/keyvalues", method=RequestMethod.PUT,
            produces="application/json", consumes="application/json")
    public void updateDateKeyValue(@RequestBody KeyValue keyValue)
    {
        keyValueDAO.updateKeyValue(keyValue);
    }

    @RequestMapping(value="/keyvalues/{id}",produces="application/json")
    public void deleteKeyValues(@PathVariable("id") long id)
    {
        keyValueDAO.deleteKeyValue(id);
    }

}
