package org.zetaconsulting.eyetracking.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "EVOLUCIONES_EVO")
public class Evoluciones implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator = "EVO_SEQ")
    @SequenceGenerator(name = "EVO_SEQ", sequenceName = "EVO_SEQ", allocationSize = 1)
    private Long id;

    @Column(name="HIC_ID")
    private Long hicId;

    @Column(name = "DETALLE")
    private String detalle;

    @Column(name = "FECHA_CREACION")
    private Date fechaCreacion;

    public Evoluciones() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Evoluciones that = (Evoluciones) o;
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

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Long getHicId() {
        return hicId;
    }

    public void setHicId(Long hicId) {
        this.hicId = hicId;
    }
}
