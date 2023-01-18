
alter table tbl_devolucion add product_id integer;
alter table tbl_recicladas add product_id integer;

alter table tbl_compras add product_id integer;

alter table tbl_prestamo_tinas add product_id integer;



ALTER TABLE tbl_compras ADD CONSTRAINT FK_tbl_compras_3
    FOREIGN KEY (product_id)
    REFERENCES tbl_tinas (id)
    ON DELETE RESTRICT;



CREATE OR REPLACE FUNCTION update_stock() RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        UPDATE tbl_tinas SET stock = stock + NEW.cantidad WHERE id = NEW.product_id;
    ELSIF (TG_OP = 'UPDATE') THEN
        UPDATE tbl_tinas SET stock = stock - OLD.cantidad + NEW.cantidad WHERE id = NEW.product_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER update_stock
AFTER INSERT OR UPDATE ON tbl_compras
FOR EACH ROW
EXECUTE FUNCTION update_stock();


ALTER TABLE tbl_prestamo_tinas ADD CONSTRAINT FK_tbl_prestamo_tinas_3
    FOREIGN KEY (product_id)
    REFERENCES tbl_tinas (id)
    ON DELETE RESTRICT;


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