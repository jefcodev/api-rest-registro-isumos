const { Router } = require("express");
const { getClientes, getGuardias} = require("../controller/insumos.controller");



const router= Router()

// Clientes
router.get("/clientes",getClientes)


//Guardias
router.get("/guardias",getGuardias)


module.exports=router