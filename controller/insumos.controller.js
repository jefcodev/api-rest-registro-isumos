const { db } = require("../cnn")


// Usuario

const getUsuarios = async (req, res) => {
    const response = await db.any('select * from tbl_usuario')
    res.json(response)
}


// Clientes

const getClientes = async (req, res) => {
    const response = await db.any('select * from tbl_cliente')
    res.json(response)
}

const postCreateClientes = async (req, res) => {
    const { cedula, nombre, apellido, ciudad, telefono } = req.body
    const response = await db.any(`INSERT INTO tbl_cliente (cedula, nombre, apellido, ciudad, telefono) 
    values($1,$2,$3,$4,$5)`, [cedula, nombre, apellido, ciudad, telefono])
    res.json({
        message: 'tbl_cliente creada correctamente',
        body: {
            cedula, nombre, apellido, ciudad, telefono
        }
    })
}

const putUpdateClientes = async (req, res) => {
    const { cedula, nombre, apellido, ciudad, telefono } = req.body
    const response = await db.any(`UPDATE tbl_cliente set nombre=$2, apellido=$3, ciudad=$4, telefono=$5 
    where cedula=$1`, [cedula, nombre, apellido, ciudad, telefono])
    res.json({
        message: 'Cliente actualizado correctamente',
        body: {
            cedula, nombre, apellido, ciudad, telefono
        }
    })
}

// Guardias
const getGuardias = async (req, res) => {
    const response = await db.any('select * from tbl_guardia')
    res.json(response)
}

const postCreateGuardias = async (req, res) => {
    const { cedula, nombre, apellido, telefono, observaciones } = req.body
    const response = await db.any(`INSERT INTO tbl_guardia (cedula, nombre, apellido, telefono, observaciones) 
    values($1,$2,$3,$4,$5)`, [cedula, nombre, apellido, telefono, observaciones])
    res.json({
        message: 'tbl_guardia creada correctamente',
        body: {
            cedula, nombre, apellido, telefono, observaciones
        }
    })
}

const putUpdateGuardias = async (req, res) => {
    const { cedula, nombre, apellido, telefono, observaciones } = req.body
    const response = await db.any(`UPDATE tbl_guardia set nombre=$2, apellido=$3, telefono=$4, observaciones=$5 
    where cedula=$1`, [cedula, nombre, apellido, telefono, observaciones])
    res.json({
        message: 'Cliente actualizado correctamente',
        body: {
            cedula, nombre, apellido, telefono, observaciones
        }
    })
}


// Pedidos

const getPedidos = async (req, res) => {

    const response = await db.any("SELECT pe.id_pedido, pe.fecha_pedido, pe.fecha_entrega, pe.cantidad_libras, pe.ruta, pe.observasiones,(cl.nombre || ' ' || cl.apellido) as client  FROM tbl_pedido pe INNER join tbl_cliente cl on cl.cedula=pe.fk_tbl_cliente_cedula")
    res.json(response)
}

const postCreatePedidos = async (req, res) => {
    const { fecha_pedido, fecha_entrega, cantidad_libras, ruta, observasiones, fk_tbl_cliente_cedula } = req.body
    const response = await db.any(`INSERT INTO tbl_pedido (fecha_pedido, fecha_entrega, cantidad_libras, ruta, observasiones, fk_tbl_cliente_cedula) 
    values($1,$2,$3,$4,$5, $6)`, [fecha_pedido, fecha_entrega, cantidad_libras, ruta, observasiones, fk_tbl_cliente_cedula])
    res.json({
        message: 'tbl_guardia creada correctamente',
        body: {
            fecha_pedido, fecha_entrega, cantidad_libras, ruta, observasiones, fk_tbl_cliente_cedula
        }
    })
}

const putUpdatePedidos = async (req, res) => {
    const { id_pedido, fecha_pedido, fecha_entrega, cantidad_libras, ruta, observasiones, fk_tbl_cliente_cedula } = req.body
    const response = await db.any(`UPDATE tbl_pedido set fecha_pedido=$2, fecha_entrega=$3, cantidad_libras=$4, ruta=$5, observasiones=$6, fk_tbl_cliente_cedula=$7
    where id_pedido=$1`, [id_pedido, fecha_pedido, fecha_entrega, cantidad_libras, ruta, observasiones, fk_tbl_cliente_cedula])
    res.json({
        message: 'Pedido actualizado correctamente',
        body: {
            id_pedido, fecha_pedido, fecha_entrega, cantidad_libras, ruta, observasiones, fk_tbl_cliente_cedula
        }
    })
}

// despachos
const getDespachos = async (req, res) => {
    const response = await db.any("select d.id_despacho, d.fecha_despacho, d.numero_tinas, d.cantidad_libras, d.ruta, d.observasiones, (cl.nombre || ' ' || cl.apellido) as cliente, (g.nombre  || ' ' || g.apellido) as guardia from tbl_despacho d inner join tbl_guardia g on d.fk_tbl_guardia_cedula = g.cedula inner join tbl_cliente cl on cl.cedula = d.fk_tbl_cliente_cedula")
    res.json(response)
}

const postCreateDespachos = async (req, res) => {
    const { fecha_despacho, cantidad_libras, numero_tinas, ruta, observasiones, fk_tbl_cliente_cedula, fk_tbl_guardia_cedula } = req.body
    const response = await db.any(`INSERT INTO tbl_despacho (fecha_despacho, cantidad_libras, numero_tinas,ruta,observasiones,fk_tbl_cliente_cedula,fk_tbl_guardia_cedula) 
    values($1,$2,$3,$4,$5,$6,$7)`, [fecha_despacho, cantidad_libras, numero_tinas, ruta, observasiones, fk_tbl_cliente_cedula, fk_tbl_guardia_cedula])
    res.json({
        message: 'tbl_despacho creada correctamente',
        body: {
            fecha_despacho, cantidad_libras, numero_tinas, ruta, observasiones, fk_tbl_cliente_cedula, fk_tbl_guardia_cedula
        }
    })
}
const putUpdateDespachos = async (req, res) => {
    const { id_despacho, fecha_despacho, cantidad_libras, numero_tinas, ruta, observasiones, fk_tbl_cliente_cedula, fk_tbl_guardia_cedula } = req.body
    const response = await db.any(`UPDATE tbl_despacho set fecha_despacho=$2, cantidad_libras=$3, numero_tinas=$4, ruta=$5, observasiones=$6, fk_tbl_cliente_cedula=$7, fk_tbl_guardia_cedula=$8
    where id_despacho=$1`, [id_despacho, fecha_despacho, cantidad_libras, numero_tinas, ruta, observasiones, fk_tbl_cliente_cedula, fk_tbl_guardia_cedula])
    res.json({
        message: 'Despacho actualizado correctamente',
        body: {
            id_despacho, fecha_despacho, cantidad_libras, numero_tinas, ruta, observasiones, fk_tbl_cliente_cedula, fk_tbl_guardia_cedula
        }
    })
}

// prestamo tinas
const getPrestamos = async (req, res) => {
    const response = await db.any("select pt.id_prestamo_tinas, pt.fecha_prestamo, pt.numero_tinas, pt.observasiones, pt.numero_acta, pt.fecha_entrega, (cl.nombre || ' ' || cl.apellido) as cliente from tbl_prestamo_tinas pt inner join tbl_cliente cl  on pt.fk_tbl_cliente_cedula = cl.cedula")
    res.json(response)
}
const postCreatePrestamos = async (req, res) => {
    const { numero_tinas, fecha_prestamo, observasiones, numero_acta, fecha_entrega, fk_tbl_cliente_cedula} = req.body
    const response = await db.any(`INSERT INTO tbl_prestamo_tinas (numero_tinas, fecha_prestamo, observasiones, numero_acta, fecha_entrega, fk_tbl_cliente_cedula) 
    values($1,$2,$3,$4,$5,$6)`, [numero_tinas, fecha_prestamo, observasiones, numero_acta, fecha_entrega, fk_tbl_cliente_cedula ])
    res.json({
        message: 'tbl_prestamo_tinas creada correctamente',
        body: {
            numero_tinas, fecha_prestamo, observasiones, fk_tbl_cliente_cedula
        }
    })
}

const putUpdatePrestamos = async (req, res) => {
    const { id_prestamo_tinas, numero_tinas, fecha_prestamo, observasiones, numero_acta, fecha_entrega,fk_tbl_cliente_cedula } = req.body
    const response = await db.any(`UPDATE tbl_prestamo_tinas set numero_tinas=$2, fecha_prestamo=$3, observasiones=$4, numero_acta=$5, fecha_entrega=$6, fk_tbl_cliente_cedula=$7
    where id_prestamo_tinas=$1`, [id_prestamo_tinas, numero_tinas, fecha_prestamo, observasiones, numero_acta, fecha_entrega, fk_tbl_cliente_cedula])
    res.json({
        message: 'Prestamo tinas actualizado correctamente',
        body: {
            id_prestamo_tinas, numero_tinas, fecha_prestamo, observasiones, fk_tbl_cliente_cedula
        }
    })
}

// ingreso insumos
const getInsumos = async (req, res) => {
    const response = await db.any("select i.id_insumos, i.fecha_ingreso, i.fecha_salida, i.cantidad_libras, i.observasiones, (gu.nombre || ' ' || gu.apellido) as guardia from tbl_ingreso_insumos i inner join tbl_guardia gu on i.fk_tbl_guardia_cedula = gu.cedula")
    res.json(response)
}

const postCreateInsumos = async (req, res) => {
    const { fecha_ingreso, fecha_salida, cantidad_libras, observasiones, fk_tbl_guardia_cedula } = req.body
    const response = await db.any(`INSERT INTO tbl_ingreso_insumos (fecha_ingreso, fecha_salida, cantidad_libras, observasiones, fk_tbl_guardia_cedula) 
    values($1,$2,$3,$4,$5)`, [fecha_ingreso, fecha_salida, cantidad_libras, observasiones, fk_tbl_guardia_cedula])
    res.json({
        message: 'tbl_ingreso_insumos creada correctamente',
        body: {
            fecha_ingreso, fecha_salida, cantidad_libras, observasiones, fk_tbl_guardia_cedula
        }
    })
}

const putUpdateInsumos = async (req, res) => {
    const { id_insumos, fecha_ingreso, fecha_salida, cantidad_libras, observasiones, fk_tbl_guardia_cedula } = req.body
    const response = await db.any(`UPDATE tbl_ingreso_insumos set fecha_ingreso=$2, fecha_salida=$3, cantidad_libras=$4, observasiones=$5, fk_tbl_guardia_cedula=$6
    where id_insumos=$1`, [id_insumos, fecha_ingreso, fecha_salida, cantidad_libras, observasiones, fk_tbl_guardia_cedula])
    res.json({
        message: 'Insumo actualizado correctamente',
        body: {
            id_insumos, fecha_ingreso, fecha_salida, cantidad_libras, observasiones, fk_tbl_guardia_cedula
        }
    })
}



/* Autoridades  */

const getAutoridades = async (req, res) => {
    const response = await db.any("select * from tbl_autoridades")
    res.json(response)
}

const postCreateAutoridades = async (req, res) => {
    const { nombre, apellido} = req.body
    const response = await db.any(`INSERT INTO tbl_autoridades (nombre, apellido) 
    values($1,$2)`, [nombre, apellido])
    res.json({
        message: 'tbl_autoridades creada correctamente',
        body: {
            nombre, apellido
        }
    })
}

const putUpdateAutoridades = async (req, res) => {
    const { id,nombre, apellido } = req.body
    const response = await db.any(`UPDATE tbl_autoridades set nombre=$2, apellido=$3 
    where id=$1`, [id, nombre, apellido])
    res.json({
        message: 'Autoridad actualizado correctamente',
        body: {
            id, nombre, apellido
        }
    })
}




/* Recilcados  */

const getReciclados = async (req, res) => {
    const response = await db.any("select r.id, r.fecha, r.numero_acta, r.cantidad, r.observacion, (a.nombre || ' ' || a.apellido) as autoridad from tbl_recicladas r inner join tbl_autoridades a on r.fk_tbl_autoridades_id = a.id")
    res.json(response)
}

const postCreateReciclados = async (req, res) => {
    const { fecha, numero_acta, cantidad, observacion, fk_tbl_autoridades_id, product_id} = req.body
    const response = await db.any(`INSERT INTO tbl_recicladas (fecha, numero_acta, cantidad, observacion, fk_tbl_autoridades_id, product_id) 
    values($1,$2 ,$3, $4, $5, 1)`, [fecha, numero_acta, cantidad, observacion, fk_tbl_autoridades_id, product_id])
    res.json({
        message: 'tbl_recicladas creada correctamente',
        body: {
            fecha, numero_acta
        }
    })
}

const putUpdateReciclados = async (req, res) => {
    const { id,fecha, numero_acta, cantidad, observacion, fk_tbl_autoridades_id } = req.body
    const response = await db.any(`UPDATE tbl_recicladas set fecha=$2, numero_acta=$3, cantidad=$4, observacion=$5, fk_tbl_autoridades_id=$6
    where id=$1`, [id,fecha, numero_acta, cantidad, observacion, fk_tbl_autoridades_id])
    res.json({
        message: 'Autoridad actualizado correctamente',
        body: {
            id,fecha, numero_acta
        }
    })
}


/* Devolución  */

const getDevolucion = async (req, res) => {
    const response = await db.any("select * from tbl_devolucion")
    res.json(response)
}

/* Tinas  */

const getTinas = async (req, res) => {
    const response = await db.any("select * from tbl_tinas")
    res.json(response)
}


/* Compras  */

const getCompras = async (req, res) => {
    const response = await db.any("select c.id_compras, c.fecha, c.numero_acta, c.cantidad, c.observacion, (a.nombre || ' ' || a.apellido) as autoridad from tbl_compras c inner join tbl_autoridades a on c.fk_tbl_autoridades_id = a.id")
    res.json(response)
}


module.exports = {
    getClientes,
    getGuardias,
    getPedidos,
    getUsuarios,
    getDespachos,
    getPrestamos,
    getInsumos,
    getAutoridades,
    getTinas,
    getCompras,
    getReciclados,
    getDevolucion,
    postCreateClientes,
    postCreateGuardias,
    postCreatePedidos,
    postCreateInsumos,
    postCreateDespachos,
    postCreatePrestamos,
    postCreateAutoridades,
    postCreateReciclados,
    putUpdateClientes,
    putUpdateGuardias,
    putUpdatePedidos,
    putUpdateDespachos,
    putUpdatePrestamos,
    putUpdateInsumos,
    putUpdateAutoridades,
    putUpdateReciclados
}