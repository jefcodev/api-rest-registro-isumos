const { Router } = require("express");
const { getClientes, getGuardias, getPedidos, getUsuarios, getDespachos, getPrestamos, getInsumos, postCreateClientes, postCreateGuardias, 
    postCreatePedidos, postCreateInsumos, postCreatePrestamos, postCreateDespachos} = require("../controller/insumos.controller");



const router= Router()

// Usuario
router.get("/usuarios",getUsuarios)


// Clientes
router.get("/clientes",getClientes)
router.post("/clientes", postCreateClientes)


//Guardias
router.get("/guardias",getGuardias)
router.post("/guardias", postCreateGuardias)


//Pedidos
router.get("/pedidos", getPedidos)
router.post("/pedidos", postCreatePedidos)
//Despachos 

router.get("/despachos", getDespachos)
router.post("/despachos", postCreateDespachos)

// Prestamo tinas
router.get("/tinas",getPrestamos)
router.post("/tinas",postCreatePrestamos)

// Ingreso Insumos 
router.get("/insumos", getInsumos)
router.post("/insumos", postCreateInsumos)

module.exports=router