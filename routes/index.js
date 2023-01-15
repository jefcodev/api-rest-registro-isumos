const { Router } = require("express");
const { getClientes, getGuardias, getPedidos, getUsuarios, getDespachos, getPrestamos, getInsumos, postCreateClientes, postCreateGuardias, 
    postCreatePedidos, postCreateInsumos, postCreatePrestamos, postCreateDespachos, putUpdateClientes, putUpdateGuardias, putUpdatePedidos, putUpdateDespachos,
    putUpdatePrestamos, putUpdateInsumos, getAutoridades, putUpdateAutoridades, postCreateAutoridades, getTinas, getDevolucion, getCompras, getReciclados} = require("../controller/insumos.controller");



const router= Router()

// Usuario
router.get("/usuarios",getUsuarios)


// Clientes
router.get("/clientes",getClientes)
router.post("/clientes", postCreateClientes)
router.put("/clientes", putUpdateClientes)

//Autoridades

router.get("/autoridades",getAutoridades)
router.post("/autoridades", postCreateAutoridades)
router.put("/autoridades", putUpdateAutoridades)


//Guardias
router.get("/guardias",getGuardias)
router.post("/guardias", postCreateGuardias)
router.put("/guardias",putUpdateGuardias)


//Pedidos
router.get("/pedidos", getPedidos)
router.post("/pedidos", postCreatePedidos)
router.put("/pedidos",putUpdatePedidos)


//Despachos 
router.get("/despachos", getDespachos)
router.post("/despachos", postCreateDespachos)
router.put("/despachos", putUpdateDespachos)


// Prestamo tinas
router.get("/prestamos",getPrestamos)
router.post("/prestamos",postCreatePrestamos)
router.put("/prestamos", putUpdatePrestamos)

// Ingreso Insumos 
router.get("/insumos", getInsumos)
router.post("/insumos", postCreateInsumos)
router.put("/insumos", putUpdateInsumos)


//Tinas

router.get("/tinas", getTinas)

// Compras

router.get("/compras", getCompras)

//Reciclados

router.get("/recicladas",getReciclados)

// Devoluciones

router.get("/devoluciones", getDevolucion)

module.exports=router