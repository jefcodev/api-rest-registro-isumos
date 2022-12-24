const { db } = require("../cnn")


// Usuario

const getUsuarios =async (req,res)=>{
    const response = await db.any('select * from tbl_usuario')
    res.json(response)
}


// Clientes

const getClientes =async (req,res)=>{
    const response = await db.any('select * from tbl_cliente')
    res.json(response)
}

const postCreateClientes =async (req,res)=>{
    const {cedula, nombre, apellido, ciudad, telefono}=req.body
    const response = await db.any(`INSERT INTO tbl_cliente (cedula, nombre, apellido, ciudad, telefono) 
    values($1,$2,$3,$4,$5)`,[cedula, nombre, apellido, ciudad, telefono])
    res.json({
        message:'tbl_cliente creada correctamente',
        body:{
            cedula, nombre, apellido, ciudad, telefono
        }
    })
}



// Guardias
const getGuardias =async (req,res)=>{
    const response = await db.any('select * from tbl_guardia')
    res.json(response)
}

const postCreateGuardias =async (req,res)=>{
    const {cedula, nombre, apellido, telefono, observaciones}=req.body
    const response = await db.any(`INSERT INTO tbl_guardia (cedula, nombre, apellido, telefono, observaciones) 
    values($1,$2,$3,$4,$5)`,[cedula, nombre, apellido, telefono, observaciones])
    res.json({
        message:'tbl_guardia creada correctamente',
        body:{
            cedula, nombre, apellido, telefono, observaciones
        }
    })
}

// Pedidos

const getPedidos = async(req,res)=>{
    const response = await db.any('select * from tbl_pedido')
    res.json(response)
}

const postCreatePedidos =async (req,res)=>{
    const {fecha_pedido, fecha_entrega, cantidad_libras, ruta, observasiones, fk_tbl_cliente_cedula}=req.body
    const response = await db.any(`INSERT INTO tbl_pedido (fecha_pedido, fecha_entrega, cantidad_libras, ruta, observasiones, fk_tbl_cliente_cedula) 
    values($1,$2,$3,$4,$5, $6)`,[fecha_pedido, fecha_entrega, cantidad_libras, ruta, observasiones, fk_tbl_cliente_cedula])
    res.json({
        message:'tbl_guardia creada correctamente',
        body:{
            fecha_pedido, fecha_entrega, cantidad_libras, ruta, observasiones, fk_tbl_cliente_cedula
        }
    })
}

// despachos
const getDespachos = async(req,res)=>{
    const response = await db.any('select * from tbl_despacho')
    res.json(response)
}

const postCreateDespachos =async (req,res)=>{
    const {fecha_despacho, cantidad_libras, numero_tinas,ruta,observasiones,fk_tbl_cliente_cedula,fk_tbl_guardia_cedula}=req.body
    const response = await db.any(`INSERT INTO tbl_despacho (fecha_despacho, cantidad_libras, numero_tinas,ruta,observasiones,fk_tbl_cliente_cedula,fk_tbl_guardia_cedula) 
    values($1,$2,$3,$4,$5,$6,$7)`,[fecha_despacho, cantidad_libras, numero_tinas,ruta,observasiones,fk_tbl_cliente_cedula,fk_tbl_guardia_cedula])
    res.json({
        message:'tbl_despacho creada correctamente',
        body:{
            fecha_despacho, cantidad_libras, numero_tinas,ruta,observasiones,fk_tbl_cliente_cedula,fk_tbl_guardia_cedula
        }
    })
}


// prestamo tinas
const getPrestamos = async(req,res)=>{
    const response = await db.any('select * from tbl_prestamo_tinas')
    res.json(response)
}
const postCreatePrestamos =async (req,res)=>{
    const {numero_tinas, fecha_prestamo, observasiones, fk_tbl_cliente_cedula}=req.body
    const response = await db.any(`INSERT INTO tbl_prestamo_tinas (numero_tinas, fecha_prestamo, observasiones, fk_tbl_cliente_cedula) 
    values($1,$2,$3,$4)`,[numero_tinas, fecha_prestamo, observasiones, fk_tbl_cliente_cedula])
    res.json({
        message:'tbl_prestamo_tinas creada correctamente',
        body:{
            numero_tinas, fecha_prestamo, observasiones, fk_tbl_cliente_cedula
        }
    })
}

// ingreso insumos
const getInsumos = async(req,res)=>{
    const response = await db.any('select * from tbl_ingreso_insumos')
    res.json(response)
}

const postCreateInsumos =async (req,res)=>{
    const {fecha_ingreso, fecha_salida, cantidad_libras, observasiones, fk_tbl_guardia_cedula}=req.body
    const response = await db.any(`INSERT INTO tbl_ingreso_insumos (fecha_ingreso, fecha_salida, cantidad_libras, observasiones, fk_tbl_guardia_cedula) 
    values($1,$2,$3,$4,$5)`,[fecha_ingreso, fecha_salida, cantidad_libras, observasiones, fk_tbl_guardia_cedula])
    res.json({
        message:'tbl_ingreso_insumos creada correctamente',
        body:{
            fecha_ingreso, fecha_salida, cantidad_libras, observasiones, fk_tbl_guardia_cedula
        }
    })
}


module.exports={
    getClientes,
    getGuardias,
    getPedidos,
    getUsuarios,
    getDespachos,
    getPrestamos,
    getInsumos,
    postCreateClientes,
    postCreateGuardias,
    postCreatePedidos,
    postCreateInsumos,
    postCreateDespachos,
    postCreatePrestamos
}