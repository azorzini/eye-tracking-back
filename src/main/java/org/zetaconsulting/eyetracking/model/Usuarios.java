package org.zetaconsulting.eyetracking.model;

import org.hibernate.annotations.Type;

import javax.persistence.Id;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "USUARIOS_USR")
public class Usuarios implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator = "USR_SEQ")
    @SequenceGenerator(name = "USR_SEQ", sequenceName = "USR_SEQ", allocationSize = 1)
    private Long id;

    @Column(name="ES_ADMINISTRATIVO")
    @Type(type = "numeric_boolean")
    private Boolean esAdministrativo;

    @Column(name="ES_ADMINISTRADOR")
    @Type(type = "numeric_boolean")
    private Boolean esAdministrador;

    @Column(name="ES_OFTALMOLOGO")
    @Type(type = "numeric_boolean")
    private Boolean esOftalmologo;

    @Column(name = "NOMBRE_USUARIO")
    private String nombreUsuario;

    @Column(name = "EMAIL")
    private String email;

    @Column(name = "FECHA_CREACION")
    private Date fechaCreacion;

    @Column(name = "FECHA_ULTIMA_MODIFICACION")
    private Date fechaUltimaModificacion;

    public Usuarios(){

    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Usuarios usuarios = (Usuarios) o;
        return Objects.equals(id, usuarios.id);
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

    public Boolean getEsAdministrativo() {
        return esAdministrativo;
    }

    public void setEsAdministrativo(Boolean esAdministrativo) {
        this.esAdministrativo = esAdministrativo;
    }

    public Boolean getEsAdministrador() {
        return esAdministrador;
    }

    public void setEsAdministrador(Boolean esAdministrador) {
        this.esAdministrador = esAdministrador;
    }

    public Boolean getEsOftalmologo() {
        return esOftalmologo;
    }

    public void setEsOftalmologo(Boolean esOftalmologo) {
        this.esOftalmologo = esOftalmologo;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Date getFechaUltimaModificacion() {
        return fechaUltimaModificacion;
    }

    public void setFechaUltimaModificacion(Date fechaUltimaModificacion) {
        this.fechaUltimaModificacion = fechaUltimaModificacion;
    }
}
