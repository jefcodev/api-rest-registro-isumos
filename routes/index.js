const { Router } = require("express");
const { getClientes, getGuardias, getPedidos, getUsuarios} = require("../controller/insumos.controller");



const router= Router()

// Usuario
router.get("/usuarios",getUsuarios)

// Clientes
router.get("/clientes",getClientes)


//Guardias
router.get("/guardias",getGuardias)

//Pedidos

router.get("/pedidos", getPedidos)
module.exports=router