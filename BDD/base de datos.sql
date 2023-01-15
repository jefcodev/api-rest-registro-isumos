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
	
	

// Nuevas tablas //

    /* Lógico_1: */
create sequence id_autoridades_seq
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1;


CREATE TABLE tbl_autoridades (
    id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('id_autoridades_seq'::regclass),
    apellido VARCHAR,
    nombre VARCHAR
);

create sequence id_recicladas_seq
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1;

CREATE TABLE tbl_recicladas (
    id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('id_recicladas_seq'::regclass),
    fecha DATE,
    numero_acta VARCHAR,
    cantidad INTEGER,
    observacion VARCHAR,
    fk_tbl_autoridades_id INTEGER
);


create sequence id_devolucion_seq
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1;

CREATE TABLE tbl_devolucion (
    id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('id_devolucion_seq'::regclass),
    cantidad INTEGER,
    observacion VARCHAR,
    fecha DATE,
    fk_tbl_prestamo_tinas_id INTEGER
);
create sequence id_tinas_seq
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1;

CREATE TABLE tbl_tinas (
    id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('id_tinas_seq'::regclass),
    nombre VARCHAR,
    stock INTEGER
);

create sequence id_compras_seq
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1;
CREATE TABLE tbl_compras (
    id_compras INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('id_compras_seq'::regclass),
    fecha DATE,
    numero_acta VARCHAR,
    cantidad INTEGER,
    observacion VARCHAR,
    fk_tbl_autoridades_id INTEGER
);



alter table tbl_prestamo_tinas add numero_acta varchar(200);
alter table tbl_prestamo_tinas add fecha_entrega date;

 
ALTER TABLE tbl_recicladas ADD CONSTRAINT FK_tbl_recicladas_2
    FOREIGN KEY (fk_tbl_autoridades_id)
    REFERENCES tbl_autoridades (id)
    ON DELETE RESTRICT;
 
ALTER TABLE tbl_compras ADD CONSTRAINT FK_tbl_compras_2
    FOREIGN KEY (fk_tbl_autoridades_id)
    REFERENCES tbl_autoridades (id)
    ON DELETE RESTRICT;

ALTER TABLE tbl_devolucion ADD CONSTRAINT FK_tbl_devolucion_2
    FOREIGN KEY (fk_tbl_prestamo_tinas_id)
    REFERENCES tbl_prestamo_tinas (id_prestamo_tinas)
    ON DELETE RESTRICT;


insert into public.tbl_autoridades (nombre, apellido) values ('Andres', 'Ortega');
insert into public.tbl_autoridades (nombre, apellido) values ('Martín', 'Alvear');
insert into public.tbl_autoridades (nombre, apellido) values ('Jose', 'Quimbiamba');


/* Insert tinas recicladas */

insert into public.tbl_recicladas (fecha, numero_acta, cantidad, observacion, fk_tbl_autoridades_id) values ('2022-11-1', '123',100,'Ninguna',1);
insert into public.tbl_recicladas (fecha, numero_acta, cantidad, observacion, fk_tbl_autoridades_id) values ('2023-01-1', '124',80,'Ninguna',2);
insert into public.tbl_recicladas (fecha, numero_acta, cantidad, observacion, fk_tbl_autoridades_id) values ('2023-01-14', '125',20,'Ninguna',3);


/* Devolución */

insert into public.tbl_devolucion (fecha, cantidad, observacion, fk_tbl_prestamo_tinas_id) values ('2022-11-1', 20,'Ninguna',1);


/* Inicio de tinas */ 

insert into public.tbl_tinas (nombre, stock) values ('Tinas premium', 1000);