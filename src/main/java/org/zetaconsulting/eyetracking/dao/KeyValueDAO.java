package org.zetaconsulting.eyetracking.dao;

import org.zetaconsulting.eyetracking.model.KeyValue;

import java.util.List;

public interface KeyValueDAO {

    public void createKeyValue(KeyValue keyValue);

    public KeyValue getKeyValueById(Long id);

    public List<KeyValue> getAllKeyValues();

    public void updateKeyValue(KeyValue keyValue);

    public void deleteKeyValue(Long id);

}
