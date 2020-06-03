-- In case user is not created
--      CREATE USER eyetracking IDENTIFIED BY eyetracking;
--      GRANT ALL PRIVILEGES TO eyetracking;

CREATE TABLE cliente_cli (
    id                          NUMBER NOT NULL,
    dni                         VARCHAR2(20 CHAR) NOT NULL,
    nombre                      VARCHAR2(50 CHAR) NOT NULL,
    apellido                    VARCHAR2(50 CHAR) NOT NULL,
    direccion                   VARCHAR2(100 CHAR) NOT NULL,
    codigo_postal               VARCHAR2(100 CHAR),
    email                       VARCHAR2(100 CHAR) NOT NULL,
    obra_social                 VARCHAR2(25 CHAR) NOT NULL,
    fecha_creacion              DATE,
    fecha_ultima_modificacion   DATE,
    telefono                    VARCHAR2(20 CHAR)
);

ALTER TABLE cliente_cli ADD CONSTRAINT clientes_cli_pk PRIMARY KEY ( id );

CREATE TABLE estudios_est (
    id                NUMBER NOT NULL,
    hic_id            NUMBER NOT NULL,
    tipo_de_estudio   VARCHAR2(100 CHAR) NOT NULL,
    costo             NUMBER NOT NULL,
    resultados        VARCHAR2(1000 CHAR),
    fecha_estudio     DATE
);

ALTER TABLE estudios_est ADD CONSTRAINT estudios_est_pk PRIMARY KEY ( id );

CREATE TABLE estudios_vigentes_esv (
    id                          NUMBER NOT NULL,
    nombre_estudio              VARCHAR2(100 CHAR),
    precio                      NUMBER,
    descripcion                 VARCHAR2(100 CHAR),
    fecha_creacion              DATE,
    fecha_ultima_modificacion   DATE
);

ALTER TABLE estudios_vigentes_esv ADD CONSTRAINT estudios_vigentes_esv_pk PRIMARY KEY ( id );

CREATE TABLE evoluciones_evo (
    id               NUMBER NOT NULL,
    hic_id           NUMBER NOT NULL,
    detalle          VARCHAR2(2000) NOT NULL,
    fecha_creacion   DATE NOT NULL
);

ALTER TABLE evoluciones_evo ADD CONSTRAINT evoluciones_evo_pk PRIMARY KEY ( id );

CREATE TABLE historia_clinica_hic (
    id                          NUMBER NOT NULL,
    antecedentes_personales     VARCHAR2(2000 CHAR),
    antecedentes_familiares     VARCHAR2(2000 CHAR),
    fecha_creacion              DATE,
    fecha_ultima_modificacion   DATE
);

ALTER TABLE historia_clinica_hic ADD CONSTRAINT historia_clinica_hic_pk PRIMARY KEY ( id );

CREATE TABLE key_value_kvl (
    id           NUMBER NOT NULL,
    key          VARCHAR2(50 CHAR),
    value        VARCHAR2(200 CHAR),
    group_name   VARCHAR2(50 CHAR),
    sort_order   NUMBER
);

ALTER TABLE key_value_kvl ADD CONSTRAINT key_value_kvl_pk PRIMARY KEY ( id );

CREATE TABLE orbita_orb (
    id                          NUMBER NOT NULL,
    hic_id                      NUMBER NOT NULL,
    es_derecho                  CHAR(1) NOT NULL,
    sistema_lagrimal            VARCHAR2(200 CHAR),
    musculos_extraoculares      VARCHAR2(200 CHAR),
    vasos                       VARCHAR2(200 CHAR),
    nervios                     VARCHAR2(200 CHAR),
    parpados                    VARCHAR2(200 CHAR),
    nervios_opticos             VARCHAR2(200 CHAR),
    cristalino                  VARCHAR2(200 CHAR),
    agudeza_visual              VARCHAR2(200 CHAR),
    caracteristicas_generales   VARCHAR2(200 CHAR),
    fecha_revision              DATE,
    longitud                    NUMBER,
    conjuntiva                  VARCHAR2(200 CHAR),
    presion_ocular              VARCHAR2(200 CHAR),
    angulo_irido_corneal        CHAR(1),
    pupila                      VARCHAR2(200 CHAR),
    humor_vitreo                VARCHAR2(200 CHAR),
    papila                      VARCHAR2(200 CHAR),
    retina_periferica           VARCHAR2(200 CHAR),
    retina_central              VARCHAR2(200 CHAR),
    espesor_corneal             NUMBER,
    curvatura                   NUMBER,
    numero_celulas              NUMBER,
    capa_1_caracteristicas      VARCHAR2(2000 CHAR),
    capa_2_caracteristicas      VARCHAR2(2000 CHAR),
    capa_3_caracteristicas      VARCHAR2(2000 CHAR),
    espesor_retina              NUMBER,
    espesor_foveal              NUMBER
);

ALTER TABLE orbita_orb ADD CONSTRAINT orbita_orb_pk PRIMARY KEY ( id );

CREATE TABLE pacientes_pac (
    id                          NUMBER NOT NULL,
    cli_id                      NUMBER NOT NULL,
    hic_id                      NUMBER NOT NULL,
    fecha_ultima_modificacion   DATE
);

ALTER TABLE pacientes_pac ADD CONSTRAINT pacientes_pac_pk PRIMARY KEY ( id );

ALTER TABLE pacientes_pac ADD CONSTRAINT pacientes_pac__un UNIQUE ( cli_id );

ALTER TABLE pacientes_pac ADD CONSTRAINT pacientes_pac__unv1 UNIQUE ( hic_id );

CREATE TABLE turnos_tur (
    id                 NUMBER NOT NULL,
    cli_id             NUMBER NOT NULL,
    duracion           NUMBER NOT NULL,
    tipo_de_turno      VARCHAR2(50 CHAR) NOT NULL,
    descripcion        VARCHAR2(120 CHAR),
    horario            DATE NOT NULL,
    fecha_asignacion   DATE,
    fecha_turno        DATE NOT NULL
);

ALTER TABLE turnos_tur ADD CONSTRAINT turnos_tur_pk PRIMARY KEY ( id );

CREATE TABLE usuarios_usr (
    id                          NUMBER NOT NULL,
    nombre_usuario              VARCHAR2(50 CHAR) NOT NULL,
    email                       VARCHAR2(100 CHAR) NOT NULL,
    es_administrativo           CHAR(1),
    es_administrador            CHAR(1),
    es_oftalmologo              CHAR(1),
    fecha_creacion              DATE,
    fecha_ultima_modificacion   DATE
);

ALTER TABLE usuarios_usr ADD CONSTRAINT usuarios_usr_pk PRIMARY KEY ( id );

ALTER TABLE estudios_est
    ADD CONSTRAINT est_hic_fk FOREIGN KEY ( hic_id )
        REFERENCES historia_clinica_hic ( id );

ALTER TABLE evoluciones_evo
    ADD CONSTRAINT evo_hic_fk FOREIGN KEY ( hic_id )
        REFERENCES historia_clinica_hic ( id );

ALTER TABLE orbita_orb
    ADD CONSTRAINT orb_hic_fk FOREIGN KEY ( hic_id )
        REFERENCES historia_clinica_hic ( id );

ALTER TABLE pacientes_pac
    ADD CONSTRAINT pac_cli_fk FOREIGN KEY ( cli_id )
        REFERENCES cliente_cli ( id );

ALTER TABLE pacientes_pac
    ADD CONSTRAINT pac_hic_fk FOREIGN KEY ( hic_id )
        REFERENCES historia_clinica_hic ( id );

ALTER TABLE turnos_tur
    ADD CONSTRAINT tur_cli_fk FOREIGN KEY ( cli_id )
        REFERENCES cliente_cli ( id );

CREATE SEQUENCE CLI_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE EST_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE ESV_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE EVO_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE HIC_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE KVL_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE ORB_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE PAC_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE TUR_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE USR_SEQ
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

-- Oracle SQL Developer Data Modeler Summary Report:
--
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             18
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
--
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
--
-- REDACTION POLICY                         0
--
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
--
-- ERRORS                                   0
-- WARNINGS                                 0

--inserts estudios

insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'consulta vestida',250,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'exoftalmologia',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'autorregratrometria',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'fondo de ojo',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'esquioscopia',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'tonotmetria',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'ganioscopia',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'exoftalmometria',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'extraccion cuerpo extraño en conjuntiva o cornea',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'oftalmoscopioa indirecta binocular',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'visuscopia',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'toma de muestra bacteriologa',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'test de Amsler',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'test de Lancaster',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Ishihora',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'examen de ojo seco',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'curva de presion presionOcular',450,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'ecografia',420,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'ecometria',300,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'OBI prematuros',450,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Test de Lotmar',150,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Test de sensibilidad de contraste',150,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'campo visual computarizado',650,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'IOL Master',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Microscopia expecular computarizada',500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'poquimetria',200,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'tomografia coherente optico (OCT) unilateral',1000,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'tomografia coherente optico (OCT) bilateral',1400,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'tomografia retiniana y del nervio optico (HRT)',1000,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'tomografia corneal computarizada unilateral',760,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'tomografia corneal compuratizada bilateral',880,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Avastin (droga incluida)',7400,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Corneliculoplastia',6000,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Catarata con implante lente intraocular',18000,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Chalazion quiste palpebral',2300,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Conjuntivoplastia',3200,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Crosslinking',14300,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Cx. Urgencia alta complejidad',21000,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Cx. Urgencia baja complejidad',7000,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Dacriocistorrinostomía',17800,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Desprendimiento de retina(excluye banda y riel de silicona)',21800,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Entrapion, Ectropion, Ptosis palpebral (Blefaroplastia)',7200,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Enucleación (excluye provision de protesis)',9000,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Trabeculoplastia con laser Argon',2700,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Transplante de endotelial de cornea',71000,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Transplante lamelar de cornea',62000,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Vias lagrimales (escicion por drenaje)',6000,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Vitrectomia mas desprendimiento de retina (excluye banda y riel) Simple',25000,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Vitrectomia mas desprendimiento de retina con endolaser',35500,to_date('30/10/2018','DD/MM/YYYY'));
insert into ESTUDIOS_VIGENTES_ESV (ID, NOMBRE_ESTUDIO, PRECIO, FECHA_CREACION) values (ESV_SEQ.NEXTVAL,'Yag Laser',3100,to_date('30/10/2018','DD/MM/YYYY'));

insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'OBRAS_SOCIALES','OSDE','OSDE',1);
insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'OBRAS_SOCIALES','Accord Salud','Accord Salud',1);
insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'OBRAS_SOCIALES','Sancor Salud','Sancor Salud',1);
insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'OBRAS_SOCIALES','Union Personal','Union Personal',1);
insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'OBRAS_SOCIALES','OSECAC','OSECAC',1);
insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'OBRAS_SOCIALES','Medifé','Medifé',1);
insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'OBRAS_SOCIALES','OSPE','OSPE Obra Social de Petroleros',1);
insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'OBRAS_SOCIALES','Medicus','Medicus',1);
insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'OBRAS_SOCIALES','Swiss Medical','Swiss Medical',1);
insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'OBRAS_SOCIALES','Galeno','Galeno',1);
insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'OBRAS_SOCIALES','Omint','Omint',1);

insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Homero','Simpson','75936187','hsimpson@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Marge','Simpson','33548121','msimpson@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Bart','Simpson','25115912','bsimpson@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Lisa','Simpson','63049309','lsimpson@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Maggie','Simpson','91920973','msimpson@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Abraham','Simpson','65788887','asimpson@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Charles','Montgomery Burns','56694064','cmontgomeryburns@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Waylon','Smithers','94647096','wsmithers@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Seymour','Skinner','50851793','sskinner@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Apu','Nahasapee mapetilon','07878800','anahasapee-mapetilon@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Otto','Mann','86494307','omann@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Maude','Flanders','07405373','mflanders@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Ned','Flanders','nflanders@gmail.com','29157184',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Todd','Flanders','76426685','tflanders@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Rod','Flanders','40168958','rflanders@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Lenny','Leonard','57227004','lleonard@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Carl','Carlson','72720845','ccarlson@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Barney','Gómez','64332939','bgómez@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Moe','Szyslak','40373979','mszyslak@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Patty','Bouvier','73678246','pbouvier@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Selma','Bouvier','49963103','sbouvier@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Krusty','el Payaso','36898064','kelpayaso@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Clancy','Gorgori','25790340','cgorgori@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Edna','Krabappel','10823526','ekrabappel@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Jeff','Albertson','41199330','jalbertson@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Nelson','Rufino','43332629','nrufino@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Martin','Prince','42873255','mprince@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Rafa','Gorgory','86845625','rgorgory@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Milhouse','Mussolini Van Houten','96650615','mmussolinivanhouten@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Herbert','Powell','52603542','hpowell@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Jacqueline','Bouvier','53556454','jbouvier@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Todd','Flanders','71200448','tflanders@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');
insert into CLIENTE_CLI (nombre, apellido, dni, email, id, direccion, obra_social) values ('Rod','Flanders','98331258','rflanders@gmail.com',CLI_SEQ.NEXTVAL,'calle falsa 123, springfield', 'osde');

insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'TIPOS_DE_TURNO','Control','20', 0);
insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'TIPOS_DE_TURNO','Consulta','15', 1);
insert into KEY_VALUE_KVL(ID,GROUP_NAME,KEY,VALUE,SORT_ORDER) values (KVL_SEQ.NEXTVAL,'TIPOS_DE_TURNO','Estudio','30', 2);

--first user is needed
insert into USUARIOS_USR(ID,nombre_usuario,email,es_administrador,es_administrativo,es_oftalmologo) values (USR_SEQ.NEXTVAL, 'admin', 'admin@admin.com', 1, 1, 1);