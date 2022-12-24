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


create sequence pedido_id_pedido_seq
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1;
CREATE TABLE tbl_pedido (
	id_pedido INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('pedido_id_pedido_seq'::regclass),
    fecha_pedido DATE,
    fecha_entrega DATE,
    cantidad_libras FLOAT,
    ruta VARCHAR,
    observasiones VARCHAR,
    fk_tbl_cliente_cedula VARCHAR
);




create sequence despacho_id_despacho_seq
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1;

CREATE TABLE tbl_despacho (
	id_despacho INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('despacho_id_despacho_seq'::regclass),
    fecha_despacho DATE,
    cantidad_libras FLOAT,
    numero_tinas INTEGER,
    ruta VARCHAR,
    observasiones VARCHAR,
    fk_tbl_cliente_cedula VARCHAR,
    fk_tbl_guardia_cedula VARCHAR
);





create sequence prestamos_id_prestamo_tinas_seq
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1;

CREATE TABLE tbl_prestamo_tinas (
    id_prestamo_tinas INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('prestamos_id_prestamo_tinas_seq'::regclass),
    numero_tinas INTEGER,
    fecha_prestamo DATE,
    observasiones VARCHAR,
    fk_tbl_cliente_cedula VARCHAR
);




create sequence insumos_id_insumos_seq
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1;
CREATE TABLE tbl_ingreso_insumos (
    id_insumos INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('insumos_id_insumos_seq'::regclass),
    fecha_ingreso DATE,
    fecha_salida DATE,
    cantidad_libras FLOAT,
    observasiones VARCHAR,
    fk_tbl_guardia_cedula VARCHAR
);



 
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


INSERT INTO public.tbl_prestamo_tinas(
	 numero_tinas, fecha_prestamo, observasiones, fk_tbl_cliente_cedula)
	VALUES (200, '2022-12-12','Ninguna','1723971626');

select * from tbl_prestamo_tinas;


INSERT INTO public.tbl_ingreso_insumos(
	 fecha_ingreso, fecha_salida, cantidad_libras, observasiones, fk_tbl_guardia_cedula)
	VALUES ('2022-12-12', '2023-01-02', 50, 'Ninguna', '1002003006');
	
	