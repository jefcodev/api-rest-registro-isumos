/* Lógico_1: */

drop table tbl_compras;
drop table tbl_despacho;
drop table tbl_devolucion;
drop table tbl_ingreso_insumos;
drop table tbl_pedido;
drop table tbl_prestamo_tinas;
drop table tbl_recicladas;
drop table tbl_tinas;
drop table tbl_autoridades;
drop table tbl_cliente;
drop table tbl_guardia;
drop table tbl_usuario;


drop sequence pedido_id_pedido_seq;
drop sequence despacho_id_despacho_seq;
drop sequence prestamos_id_prestamo_tinas_seq;
drop sequence insumos_id_insumos_seq;
drop sequence id_autoridades_seq;
drop sequence id_recicladas_seq;
drop sequence id_devolucion_seq;
drop sequence id_tinas_seq;
drop sequence id_compras_seq;



CREATE TABLE tbl_cliente (
    cedula VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    ciudad VARCHAR(50),
    telefono VARCHAR(50)
);


select * from tbl_usuario;


INSERT INTO public.tbl_usuario(
	 tipo_usuario, nombre_usuario, clave_usuario)
	VALUES ('admin','admin','$2a$10$Hi26zZZyvtfOBbvr5YbQ/.63AwfeFhfo2fFrbUL0HcLwb3xNp6os6');

create sequence id_usuario_seq
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1;

CREATE TABLE tbl_usuario(
    id_usuario INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('id_usuario_seq'::regclass),
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


create sequence id_bitacora_seq
  start with 1
  increment by 1
  maxvalue 99999
  minvalue 1;

CREATE TABLE tbl_bitacora (
	id_bitacora INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('id_bitacora_seq'::regclass),
    fecha_actual DATE,
    movimiento VARCHAR,
	accion VARCHAR,
    cantidad INTEGER,
    ayudante VARCHAR,
    cliente VARCHAR,
    observacion VARCHAR,
    numero_acta VARCHAR,
    usuario VARCHAR
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

INSERT INTO public.tbl_compras(
	fecha, numero_acta, cantidad, observacion, fk_tbl_autoridades_id)
	VALUES ('2022-12-12','150', 100, 'Nimguma', 1);
    INSERT INTO public.tbl_compras(
	fecha, numero_acta, cantidad, observacion, fk_tbl_autoridades_id)
	VALUES ('2022-12-12','150', 100, 'Nimguma', 2);





/* Nueva Sentencia  */


alter table tbl_devolucion add product_id integer;
alter table tbl_recicladas add product_id integer;

alter table tbl_compras add product_id integer;

alter table tbl_prestamo_tinas add product_id integer;



ALTER TABLE tbl_compras ADD CONSTRAINT FK_tbl_compras_3
    FOREIGN KEY (product_id)
    REFERENCES tbl_tinas (id)
    ON DELETE RESTRICT;

/* Inicio trigger compras */

CREATE OR REPLACE FUNCTION update_stock() RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        UPDATE tbl_tinas SET stock = stock + NEW.cantidad WHERE id = NEW.product_id;
/* Realizamos un trigger al realizar un UPDATE nos realiza una actualización de la tabla products  */
    ELSIF (TG_OP = 'UPDATE') THEN
        UPDATE tbl_tinas SET stock = stock - OLD.cantidad + NEW.cantidad WHERE id = NEW.product_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

/* Creamos la funcion, y sentenciamos que se aplique despues de un INSERT o un UPDATE */
CREATE TRIGGER update_stock
AFTER INSERT OR UPDATE ON tbl_compras
FOR EACH ROW
EXECUTE FUNCTION update_stock();


select * from tbl_compras;

INSERT INTO public.tbl_compras(
	 fecha, numero_acta, cantidad, observacion, fk_tbl_autoridades_id, product_id)
	VALUES ( '2020-10-10', '123', 100, 'Ninguna', 1, 1);
	
UPDATE tbl_compras SET cantidad = 80 WHERE id_compras = 5 AND product_id =1;

select * from tbl_tinas;

/* Fin trigger compras */



ALTER TABLE tbl_prestamo_tinas ADD CONSTRAINT FK_tbl_prestamo_tinas_3
    FOREIGN KEY (product_id)
    REFERENCES tbl_tinas (id)
    ON DELETE RESTRICT;


/*Inicio trigger prestamo tinas */

CREATE OR REPLACE FUNCTION update_stock_prestamo() RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        UPDATE tbl_tinas SET stock = stock - NEW.numero_tinas WHERE id = NEW.product_id;
    ELSIF (TG_OP = 'UPDATE') THEN
        UPDATE tbl_tinas SET stock = stock + OLD.numero_tinas - NEW.numero_tinas WHERE id = NEW.product_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_stock_prestamo
AFTER INSERT OR UPDATE ON tbl_prestamo_tinas
FOR EACH ROW
EXECUTE FUNCTION update_stock_prestamo();

select * from tbl_prestamo_tinas;
select * from tbl_tinas;
select * from tbl_cliente;

INSERT INTO public.tbl_prestamo_tinas(
	 numero_tinas, fecha_prestamo, observasiones, fk_tbl_cliente_cedula, numero_acta, fecha_entrega, product_id)
	VALUES ( 40, '2022-10-10', 'Ninguna', '1723971626', '123','2022-10-12' , 1);
	
UPDATE tbl_prestamo_tinas SET numero_tinas = 20 WHERE id_prestamo_tinas = 7 AND product_id =1;

/* Fin trigger prestamo tinas */

/* Inicio trigger tabla recicladas  */
CREATE OR REPLACE FUNCTION update_stock_recicladas() RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        UPDATE tbl_tinas SET stock = stock - NEW.cantidad WHERE id = NEW.product_id;
    ELSIF (TG_OP = 'UPDATE') THEN
        UPDATE tbl_tinas SET stock = stock + OLD.cantidad - NEW.cantidad WHERE id = NEW.product_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_stock_recicladas
AFTER INSERT OR UPDATE ON tbl_recicladas
FOR EACH ROW
EXECUTE FUNCTION update_stock_recicladas();


select * from tbl_tinas;
select * from tbl_recicladas;

INSERT INTO public.tbl_recicladas( fecha, numero_acta, cantidad, observacion, fk_tbl_autoridades_id, product_id)
	VALUES ('2022-12-12', '125', 10, 'En mal estado', 1 ,1);

UPDATE tbl_recicladas SET cantidad = 20 WHERE id = 5 AND product_id =1;


/* Fin tablas recicladas */

/* Inicio de devolicon de tinas */


CREATE OR REPLACE FUNCTION update_stock_devolucion() RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        UPDATE tbl_tinas SET stock = stock + NEW.cantidad WHERE id = NEW.product_id;
		UPDATE tbl_prestamo_tinas SET numero_tinas= numero_tinas - NEW.cantidad WHERE id_prestamo_tinas = NEW.fk_tbl_prestamo_tinas_id;
    ELSIF (TG_OP = 'UPDATE') THEN
        UPDATE tbl_tinas SET stock = stock - OLD.cantidad + NEW.cantidad WHERE id = NEW.product_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_stock_devolucion
AFTER INSERT OR UPDATE ON tbl_devolucion
FOR EACH ROW
EXECUTE FUNCTION update_stock_devolucion();


select * from tbl_tinas;
select * from tbl_devolucion;
select * from tbl_prestamo_tinas;

INSERT INTO public.tbl_devolucion(
	cantidad, observacion, fecha, fk_tbl_prestamo_tinas_id, product_id)
	VALUES (30, 'Devuelve la mitad', '2022-12-12', 8,1);



UPDATE tbl_recicladas SET cantidad = 20 WHERE id = 5 AND product_id =1;

/* Fin de devolucion de tinas  */




/*Nuevos cambios */


select * from tbl_pedido;

alter table tbl_pedido add estado boolean;
alter table tbl_despacho add estado boolean;
alter table tbl_prestamo_tinas add estado boolean;

select * from tbl_despacho;

alter table tbl_despacho add id_pedido_fk integer;

ALTER TABLE tbl_despacho ADD CONSTRAINT id_pedido_fk_con
    FOREIGN KEY (id_pedido_fk)
    REFERENCES tbl_pedido (id_pedido)
    ON DELETE RESTRICT;


select * from tbl_prestamo_tinas;

alter table tbl_prestamo_tinas add id_despacho_fk integer;

ALTER TABLE tbl_prestamo_tinas ADD CONSTRAINT id_despacho_fk_con
    FOREIGN KEY (id_despacho_fk)
    REFERENCES tbl_despacho (id_despacho)
    ON DELETE RESTRICT;

alter table tbl_pedido add num_pollos integer;
alter table tbl_pedido add pendiente boolean;