package org.zetaconsulting.eyetracking.model;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "HISTORIA_CLINICA_HIC")
public class HistoriaClinica implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator = "HIC_SEQ")
    @SequenceGenerator(name = "HIC_SEQ", sequenceName = "HIC_SEQ", allocationSize = 1)
    private Long id;

    @Column(name = "ANTECEDENTES_PERSONALES")
    private String antecedentesPersonales;

    @Column(name = "ANTECEDENTES_FAMILIARES")
    private String antecedentesFamiliares;

    @OneToMany(cascade = CascadeType.ALL, fetch= FetchType.EAGER)
    @JoinColumn(name="HIC_ID", nullable=true, updatable = true)
    @Fetch(value = FetchMode.SELECT)
    private List<Orbita> orbitas = new LinkedList<Orbita>();

    @OneToMany(cascade = CascadeType.ALL, fetch= FetchType.EAGER)
    @JoinColumn(name="HIC_ID", nullable=true, updatable = true)
    @Fetch(value = FetchMode.SELECT)
    private List<Evoluciones> evoluciones = new LinkedList<Evoluciones>();

    @OneToMany(cascade = CascadeType.ALL, fetch= FetchType.EAGER)
    @JoinColumn(name="HIC_ID", nullable=true, updatable = true)
    @Fetch(value = FetchMode.SELECT)
    private List<Estudios> estudios = new LinkedList<Estudios>();

    public HistoriaClinica() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        HistoriaClinica that = (HistoriaClinica) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAntecedentesPersonales() {
        return antecedentesPersonales;
    }

    public void setAntecedentesPersonales(String antecedentesPersonales) {
        this.antecedentesPersonales = antecedentesPersonales;
    }

    public String getAntecedentesFamiliares() {
        return antecedentesFamiliares;
    }

    public void setAntecedentesFamiliares(String antecedentesFamiliares) {
        this.antecedentesFamiliares = antecedentesFamiliares;
    }

    public List<Orbita> getOrbitas() {
        return orbitas;
    }

    public void setOrbitas(List<Orbita> orbitas) {
        this.orbitas.clear();
        if(orbitas != null) {
            this.orbitas.addAll(orbitas);
        }
    }

    public List<Evoluciones> getEvoluciones() {
        return evoluciones;
    }

    public void setEvoluciones(List<Evoluciones> evoluciones) {
        this.evoluciones.clear();
        if(evoluciones != null) {
            this.evoluciones.addAll(evoluciones);
        }
    }

    public List<Estudios> getEstudios() {
        return estudios;
    }

    public void setEstudios(List<Estudios> estudios) {
        this.estudios.clear();
        if(estudios != null) {
            this.estudios.addAll(estudios);
        }
    }
}
