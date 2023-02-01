const { Router } = require("express");
const checkAuth = require("../middleware/auth")
const checkRoleAuth = require("../middleware/rol")
const { getClientes, getGuardias, getPedidos, getUsuarios, getDespachos, getPrestamos, getInsumos, postCreateClientes, postCreateGuardias,
    postCreatePedidos, postCreateInsumos, postCreatePrestamos, postCreateDespachos, putUpdateClientes, putUpdateGuardias, putUpdatePedidos, putUpdateDespachos,
    putUpdatePrestamos, putUpdateInsumos, getAutoridades, putUpdateAutoridades, postCreateAutoridades, getTinas, getDevolucion, getCompras, getReciclados,
    postCreateReciclados, getBitacorabyClientandAyudante, putUpdateReciclados, getPrestamos2, postCreateDevolucion, putUpdateDevolucion, postCreateCompras, putUpdateCompras, getClientesCount, getPedidosCount, getCountPrestamos, getBitacora, postCreateBitacora } = require("../controller/insumos.controller");




const router = Router()

router.get("/usuarios", getUsuarios)

// Clientes
router.get("/clientes", checkAuth, getClientes)
router.get("/clientesCount", checkAuth, getClientesCount)
router.post("/clientes", checkAuth, postCreateClientes)
router.put("/clientes", checkAuth, putUpdateClientes)


//Autoridades


router.get("/autoridades", checkAuth, getAutoridades)
router.post("/autoridades", checkAuth, postCreateAutoridades)
router.put("/autoridades", checkAuth, putUpdateAutoridades)


//Guardias
router.get("/guardias", checkAuth, getGuardias)
router.post("/guardias", checkAuth, postCreateGuardias)
router.put("/guardias", checkAuth, putUpdateGuardias)


//Pedidos
router.get("/pedidos", checkAuth, getPedidos)
router.get("/pedidosCount", checkAuth, getPedidosCount)
router.post("/pedidos", checkAuth, postCreatePedidos)
router.put("/pedidos", checkAuth, putUpdatePedidos)


//Despachos 
router.get("/despachos", checkAuth, getDespachos)
router.post("/despachos", checkAuth, postCreateDespachos)
router.put("/despachos", checkAuth, putUpdateDespachos)


// Prestamo tinas
router.get("/prestamos", checkAuth, getPrestamos)
router.get("/prestamosCount", checkAuth, getCountPrestamos)
router.get("/prestamoss", checkAuth, getPrestamos2)

router.post("/prestamos", checkAuth, postCreatePrestamos)
router.put("/prestamos", checkAuth, putUpdatePrestamos)

// Ingreso Insumos 
router.get("/insumos", checkAuth, getInsumos)
router.post("/insumos", checkAuth, postCreateInsumos)
router.put("/insumos", checkAuth, putUpdateInsumos)


//Tinas

router.get("/tinas", checkAuth, getTinas)

// Compras

router.get("/compras", checkAuth, getCompras)
router.post("/compras", checkAuth, postCreateCompras)
router.put("/compras", checkAuth, putUpdateCompras)

//Reciclados

router.get("/recicladas", checkAuth, getReciclados)
router.post("/recicladas", checkAuth, postCreateReciclados)
router.put("/recicladas", checkAuth, putUpdateReciclados)

// Devoluciones

router.get("/devoluciones", checkAuth, checkRoleAuth(['Administrador']), getDevolucion)
router.post("/devoluciones", checkAuth, checkRoleAuth(['Administrador']), postCreateDevolucion)
router.put("/devoluciones", checkAuth, checkRoleAuth(['Administrador']), putUpdateDevolucion)

//Bitacoras

router.get("/bitacora", checkAuth, getBitacora)
router.post("/bitacora", checkAuth, postCreateBitacora)
router.get("/bit", checkAuth, getBitacorabyClientandAyudante)


module.exports = router

