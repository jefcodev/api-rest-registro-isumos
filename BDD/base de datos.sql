/* Lógico_1: */



CREATE TABLE tbl_cliente (
    cedula VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    ciudad VARCHAR(50),
    telefono VARCHAR(50)
);


CREATE TABLE tbl_usuario (
    id_usuario INTEGER PRIMARY KEY,
    tipo_usuario VARCHAR,
    nombre_usuario VARCHAR,
    clave_usuario VARCHAR
);

CREATE TABLE tbl_guardia (
    cedula VARCHAR PRIMARY KEY,
    nombre VARCHAR,
    apellido VARCHAR,
    telefono VARCHAR,
    observaciones VARCHAR
);

CREATE SEQUENCE public.tbl_pedido_id_pedido_seq;

CREATE TABLE tbl_pedido (
	id_pedido INTEGER NOT NULL DEFAULT nextval('public.tbl_pedido_id_pedido_seq'),
    fecha_pedido DATE,
    fecha_entrega DATE,
    cantidad_libras FLOAT,
    ruta VARCHAR,
    observasiones VARCHAR,
    fk_tbl_cliente_cedula VARCHAR
);

ALTER SEQUENCE public.tbl_pedido_id_pedido_seq OWNED BY public.tbl_pedido.id_pedido;



CREATE SEQUENCE public.tbl_despacho_id_despacho_seq;


CREATE TABLE tbl_despacho (
	id_despacho INTEGER NOT NULL DEFAULT nextval('public.tbl_despacho_id_despacho_seq'),
    fecha_despacho DATE,
    cantidad_libras FLOAT,
    numero_tinas INTEGER,
    ruta VARCHAR,
    observasiones VARCHAR,
    fk_tbl_cliente_cedula VARCHAR,
    fk_tbl_guardia_cedula VARCHAR
);



ALTER SEQUENCE public.tbl_despacho_id_despacho_seq OWNED BY public.tbl_despacho.id_despacho;


CREATE SEQUENCE public.tbl_prestamo_tinas_id_prestamo_tinas_seq;

CREATE TABLE tbl_prestamo_tinas (
    id_prestamo_tinas INTEGER PRIMARY KEY,
    numero_tinas INTEGER,
    fecha_prestamo DATE,
    observasiones VARCHAR,
    fk_tbl_cliente_cedula VARCHAR
);

ALTER SEQUENCE public.tbl_prestamo_tinas_id_prestamo_tinas_seq OWNED BY public.tbl_prestamo_tinas.id_prestamo_tinas;



CREATE SEQUENCE public.tbl_ingreso_insumos_id_insumos_seq;

CREATE TABLE tbl_ingreso_insumos (
    id_insumos INTEGER PRIMARY KEY,
    fecha_ingreso DATE,
    fecha_salida DATE,
    cantidad_libras FLOAT,
    observasiones VARCHAR,
    fk_tbl_guardia_cedula VARCHAR
);
ALTER SEQUENCE public.tbl_ingreso_insumos_id_insumos_seq OWNED BY public.tbl_ingreso_insumos.id_insumos;


 
ALTER TABLE tbl_pedido ADD CONSTRAINT FK_tbl_pedido_2
    FOREIGN KEY (fk_tbl_cliente_cedula)
    REFERENCES tbl_cliente (cedula)
    ON DELETE RESTRICT;
 
ALTER TABLE tbl_despacho ADD CONSTRAINT FK_tbl_despacho_2
    FOREIGN KEY (fk_tbl_cliente_cedula)
    REFERENCES tbl_cliente (cedula)
    ON DELETE RESTRICT;
 
ALTER TABLE tbl_despacho ADD CONSTRAINT FK_tbl_despacho_3
    FOREIGN KEY (fk_tbl_guardia_cedula)
    REFERENCES tbl_guardia (cedula)
    ON DELETE RESTRICT;
 
ALTER TABLE tbl_prestamo_tinas ADD CONSTRAINT FK_tbl_prestamo_tinas_2
    FOREIGN KEY (fk_tbl_cliente_cedula)
    REFERENCES tbl_cliente (cedula)
    ON DELETE RESTRICT;
 
ALTER TABLE tbl_ingreso_insumos ADD CONSTRAINT FK_tbl_ingreso_insumos_2
    FOREIGN KEY (fk_tbl_guardia_cedula)
    REFERENCES tbl_guardia (cedula)
    ON DELETE RESTRICT;
	
	
	
INSERT INTO public.tbl_cliente(cedula, nombre, apellido, ciudad, telefono)
	VALUES ('1723971626', 'Jose', 'Alvear', 'Ibarra', '0987654321');
INSERT INTO public.tbl_cliente(cedula, nombre, apellido, ciudad, telefono)
	VALUES ('1002003001', 'Jose', 'Alvear', 'Ibarra', '0912345678');
INSERT INTO public.tbl_cliente(cedula, nombre, apellido, ciudad, telefono)
	VALUES ('0401275995', 'Maria', 'Ortega', 'Quito', '0963258741');
	
	select * from tbl_cliente;

INSERT INTO public.tbl_usuario(id_usuario, tipo_usuario, nombre_usuario, clave_usuario)
	VALUES (1, 'Administrador', 'admin', 'admin');
INSERT INTO public.tbl_usuario(id_usuario, tipo_usuario, nombre_usuario, clave_usuario)
	VALUES (2, 'Gerente', 'user', 'user');

select * from tbl_usuario;

INSERT INTO public.tbl_guardia(cedula, nombre, apellido, telefono, observaciones)
	VALUES ('1002003006', 'Ariel', 'Hernandez', '0986574123', 'Ninguna');
INSERT INTO public.tbl_guardia(cedula, nombre, apellido, telefono, observaciones)
	VALUES ('1002003007', 'Jose', 'Fernandez', '0986574003', 'Ninguna');
INSERT INTO public.tbl_guardia(cedula, nombre, apellido, telefono, observaciones)
	VALUES ('1002003008', 'Marco', 'Lopez', '0986574100', 'Ninguna');

select * from tbl_guardia;


INSERT INTO public.tbl_pedido(
	 fecha_pedido, fecha_entrega, cantidad_libras, ruta, observasiones, fk_tbl_cliente_cedula)
VALUES ('2020-12-12', '2021-01-10', 120, 'Ibarra','Ninguna', '1723971626');


select * from tbl_pedido;


insert into public.tbl_despacho (fecha_despacho, cantidad_libras, numero_tinas,ruta,observasiones,fk_tbl_cliente_cedula,fk_tbl_guardia_cedula)
values ('2020-12-12',120 ,50,'Quito','Ninguna','1723971626','1002003006');

select * from tbl_despacho;




	
	
	