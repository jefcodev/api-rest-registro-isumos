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
router.get("/clientes", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getClientes)
router.get("/clientesCount", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getClientesCount)
router.post("/clientes", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), postCreateClientes)
router.put("/clientes", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), putUpdateClientes)


//Autoridades


router.get("/autoridades", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getAutoridades)
router.post("/autoridades", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), postCreateAutoridades)
router.put("/autoridades", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), putUpdateAutoridades)


//Guardias
router.get("/guardias", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getGuardias)
router.post("/guardias", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), postCreateGuardias)
router.put("/guardias", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), putUpdateGuardias)


//Pedidos
router.get("/pedidos", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getPedidos)
router.get("/pedidosCount", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getPedidosCount)
router.post("/pedidos", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), postCreatePedidos)
router.put("/pedidos", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), putUpdatePedidos)


//Despachos 
router.get("/despachos", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getDespachos)
router.post("/despachos", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), postCreateDespachos)
router.put("/despachos", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), putUpdateDespachos)


// Prestamo tinas
router.get("/prestamos", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getPrestamos)
router.get("/prestamosCount", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getCountPrestamos)
router.get("/prestamoss", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getPrestamos2)

router.post("/prestamos", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), postCreatePrestamos)
router.put("/prestamos", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), putUpdatePrestamos)

// Ingreso Insumos 
router.get("/insumos", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getInsumos)
router.post("/insumos", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), postCreateInsumos)
router.put("/insumos", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), putUpdateInsumos)


//Tinas

router.get("/tinas", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getTinas)

// Compras

router.get("/compras", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getCompras)
router.post("/compras", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), postCreateCompras)
router.put("/compras", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), putUpdateCompras)

//Reciclados

router.get("/recicladas", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getReciclados)
router.post("/recicladas", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), postCreateReciclados)
router.put("/recicladas", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), putUpdateReciclados)

// Devoluciones

router.get("/devoluciones", checkAuth, checkRoleAuth(['Administrador']), getDevolucion)
router.post("/devoluciones", checkAuth, checkRoleAuth(['Administrador']), postCreateDevolucion)
router.put("/devoluciones", checkAuth, checkRoleAuth(['Administrador']), putUpdateDevolucion)

//Bitacoras

router.get("/bitacora", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getBitacora)
router.post("/bitacora", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), postCreateBitacora)
router.get("/bit", checkAuth, checkRoleAuth(['Administrador', 'Gerente']), getBitacorabyClientandAyudante)


module.exports = router

