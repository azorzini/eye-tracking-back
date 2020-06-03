package org.zetaconsulting.eyetracking.model;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "ORBITA_ORB")
public class Orbita implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator = "ORB_SEQ")
    @SequenceGenerator(name = "ORB_SEQ", sequenceName = "ORB_SEQ", allocationSize = 1)
    private Long id;

    @Column(name="HIC_ID")
    private Long hicId;

    @Column(name="ES_DERECHO")
    @Type(type = "numeric_boolean")
    private Boolean esDerecho;

    @Column(name="SISTEMA_LAGRIMAL")
    private String sistemaLagrimal;

    @Column(name="MUSCULOS_EXTRAOCULARES")
    private String musculosExtraoculares;

    @Column(name="VASOS")
    private String vasos;

    @Column(name="NERVIOS")
    private String nervios;

    @Column(name="PARPADOS")
    private String parpados;

    @Column(name="NERVIOS_OPTICOS")
    private String nerviosOpticos;

    @Column(name="CRISTALINO")
    private String cristalino;

    @Column(name="AGUDEZA_VISUAL")
    private String agudezaVisual;

    @Column(name="CARACTERISTICAS_GENERALES")
    private String caracteristicasGenerales;

    @Column(name="FECHA_REVISION")
    private Date fechaRevision;

    @Column(name="LONGITUD")
    private Double longitud;

    @Column(name="CONJUNTIVA")
    private String conjuntiva;

    @Column(name="PRESION_OCULAR")
    private String presionOcular;

    @Column(name="ANGULO_IRIDO_CORNEAL")
    @Type(type = "numeric_boolean")
    private Boolean anguloIridoCorneal;

    @Column(name="PUPILA")
    private String pupila;

    @Column(name="HUMOR_VITREO")
    private String humorVitreo;

    @Column(name="PAPILA")
    private String papila;

    @Column(name="RETINA_PERIFERICA")
    private String retinaPeriferica;

    @Column(name="RETINA_CENTRAL")
    private String retinaCentral;

    @Column(name="ESPESOR_CORNEAL")
    private Double espesorCorneal;

    @Column(name="CURVATURA")
    private Double curvatura;

    @Column(name="NUMERO_CELULAS")
    private Double numeroDeCelulas;

    @Column(name="CAPA_1_CARACTERISTICAS")
    private String capa1Caracteristicas;

    @Column(name="CAPA_2_CARACTERISTICAS")
    private String capa2Caracteristicas;

    @Column(name="CAPA_3_CARACTERISTICAS")
    private String capa3Caracteristicas;

    @Column(name="ESPESOR_RETINA")
    private Double espesorRetina;

    @Column(name="ESPESOR_FOVEAL")
    private Double espesorFoveal;

    public Orbita() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Orbita orbita = (Orbita) o;
        return Objects.equals(id, orbita.id);
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

    public Boolean getEsDerecho() {
        return esDerecho;
    }

    public void setEsDerecho(Boolean esDerecho) {
        this.esDerecho = esDerecho;
    }

    public String getSistemaLagrimal() {
        return sistemaLagrimal;
    }

    public void setSistemaLagrimal(String sistemaLagrimal) {
        this.sistemaLagrimal = sistemaLagrimal;
    }

    public String getMusculosExtraoculares() {
        return musculosExtraoculares;
    }

    public void setMusculosExtraoculares(String musculosExtraoculares) {
        this.musculosExtraoculares = musculosExtraoculares;
    }

    public String getVasos() {
        return vasos;
    }

    public void setVasos(String vasos) {
        this.vasos = vasos;
    }

    public String getNervios() {
        return nervios;
    }

    public void setNervios(String nervios) {
        this.nervios = nervios;
    }

    public String getParpados() {
        return parpados;
    }

    public void setParpados(String parpados) {
        this.parpados = parpados;
    }

    public String getNerviosOpticos() {
        return nerviosOpticos;
    }

    public void setNerviosOpticos(String nerviosOpticos) {
        this.nerviosOpticos = nerviosOpticos;
    }

    public String getCristalino() {
        return cristalino;
    }

    public void setCristalino(String cristalino) {
        this.cristalino = cristalino;
    }

    public String getAgudezaVisual() {
        return agudezaVisual;
    }

    public void setAgudezaVisual(String agudezaVisual) {
        this.agudezaVisual = agudezaVisual;
    }

    public String getCaracteristicasGenerales() {
        return caracteristicasGenerales;
    }

    public void setCaracteristicasGenerales(String caracteristicasGenerales) {
        this.caracteristicasGenerales = caracteristicasGenerales;
    }

    public Date getFechaRevision() {
        return fechaRevision;
    }

    public void setFechaRevision(Date fechaRevision) {
        this.fechaRevision = fechaRevision;
    }

    public Double getLongitud() {
        return longitud;
    }

    public void setLongitud(Double longitud) {
        this.longitud = longitud;
    }

    public String getConjuntiva() {
        return conjuntiva;
    }

    public void setConjuntiva(String conjuntiva) {
        this.conjuntiva = conjuntiva;
    }

    public String getPresionOcular() {
        return presionOcular;
    }

    public void setPresionOcular(String presionOcular) {
        this.presionOcular = presionOcular;
    }

    public Boolean getAnguloIridoCorneal() {
        return anguloIridoCorneal;
    }

    public void setAnguloIridoCorneal(Boolean anguloIridoCorneal) {
        this.anguloIridoCorneal = anguloIridoCorneal;
    }

    public String getPupila() {
        return pupila;
    }

    public void setPupila(String pupila) {
        this.pupila = pupila;
    }

    public String getHumorVitreo() {
        return humorVitreo;
    }

    public void setHumorVitreo(String humorVitreo) {
        this.humorVitreo = humorVitreo;
    }

    public String getPapila() {
        return papila;
    }

    public void setPapila(String papila) {
        this.papila = papila;
    }

    public String getRetinaPeriferica() {
        return retinaPeriferica;
    }

    public void setRetinaPeriferica(String retinaPeriferica) {
        this.retinaPeriferica = retinaPeriferica;
    }

    public String getRetinaCentral() {
        return retinaCentral;
    }

    public void setRetinaCentral(String retinaCentral) {
        this.retinaCentral = retinaCentral;
    }

    public Double getEspesorCorneal() {
        return espesorCorneal;
    }

    public void setEspesorCorneal(Double espesorCorneal) {
        this.espesorCorneal = espesorCorneal;
    }

    public Double getCurvatura() {
        return curvatura;
    }

    public void setCurvatura(Double curvatura) {
        this.curvatura = curvatura;
    }

    public Double getNumeroDeCelulas() {
        return numeroDeCelulas;
    }

    public void setNumeroDeCelulas(Double numeroDeCelulas) {
        this.numeroDeCelulas = numeroDeCelulas;
    }

    public String getCapa1Caracteristicas() {
        return capa1Caracteristicas;
    }

    public void setCapa1Caracteristicas(String capa1Caracteristicas) {
        this.capa1Caracteristicas = capa1Caracteristicas;
    }

    public String getCapa2Caracteristicas() {
        return capa2Caracteristicas;
    }

    public void setCapa2Caracteristicas(String capa2Caracteristicas) {
        this.capa2Caracteristicas = capa2Caracteristicas;
    }

    public String getCapa3Caracteristicas() {
        return capa3Caracteristicas;
    }

    public void setCapa3Caracteristicas(String capa3Caracteristicas) {
        this.capa3Caracteristicas = capa3Caracteristicas;
    }

    public Double getEspesorRetina() {
        return espesorRetina;
    }

    public void setEspesorRetina(Double espesorRetina) {
        this.espesorRetina = espesorRetina;
    }

    public Double getEspesorFoveal() {
        return espesorFoveal;
    }

    public void setEspesorFoveal(Double espesorFoveal) {
        this.espesorFoveal = espesorFoveal;
    }

    public Long getHicId() {
        return hicId;
    }

    public void setHicId(Long hicId) {
        this.hicId = hicId;
    }
}
