package org.zetaconsulting.eyetracking.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "ESTUDIOS_EST")
public class Estudios implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator = "EST_SEQ")
    @SequenceGenerator(name = "EST_SEQ", sequenceName = "EST_SEQ", allocationSize = 1)
    private Long id;

    @Column(name = "TIPO_DE_ESTUDIO")
    private String tipoDeEstudio;

    @Column(name = "COSTO")
    private Double costo;

    @Column(name = "RESULTADOS")
    private String resultados;

    @Column(name = "FECHA_ESTUDIO")
    private Date fechaEstudio;

    @Column(name="HIC_ID")
    private Long hicId;

    public Estudios() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Estudios estudios = (Estudios) o;
        return Objects.equals(id, estudios.id);
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

    public String getTipoDeEstudio() {
        return tipoDeEstudio;
    }

    public void setTipoDeEstudio(String tipoDeEstudio) {
        this.tipoDeEstudio = tipoDeEstudio;
    }

    public Double getCosto() {
        return costo;
    }

    public void setCosto(Double costo) {
        this.costo = costo;
    }

    public String getResultados() {
        return resultados;
    }

    public void setResultados(String resultados) {
        this.resultados = resultados;
    }

    public Date getFechaEstudio() {
        return fechaEstudio;
    }

    public void setFechaEstudio(Date fechaEstudio) {
        this.fechaEstudio = fechaEstudio;
    }

    public Long getHicId() {
        return hicId;
    }

    public void setHicId(Long hicId) {
        this.hicId = hicId;
    }
}
