package org.zetaconsulting.eyetracking.dao;

import org.springframework.stereotype.Service;
import org.zetaconsulting.eyetracking.model.Cliente;
import org.zetaconsulting.eyetracking.model.KeyValue;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class KeyValueDAOImpl implements KeyValueDAO{

    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public void createKeyValue(KeyValue keyValue) {
        entityManager.persist(keyValue);
    }

    @Override
    public KeyValue getKeyValueById(Long id) {
        return entityManager.find(KeyValue.class, id);
    }

    @Override
    public List<KeyValue> getAllKeyValues() {
        return entityManager.createQuery("select kvl from KeyValue kvl").getResultList();
    }

    @Override
    public void updateKeyValue(KeyValue keyValue) {
        entityManager.merge(keyValue);
    }

    @Override
    public void deleteKeyValue(Long id) {
        KeyValue kvl = entityManager.find(KeyValue.class, id);
        entityManager.remove(kvl);
    }
}
