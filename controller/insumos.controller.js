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



// Guardias
const getGuardias =async (req,res)=>{
    const response = await db.any('select * from tbl_guardia')
    res.json(response)
}

// Pedidos

const getPedidos = async(req,res)=>{
    const response = await db.any('select * from tbl_pedido')
    res.json(response)
}


module.exports={
    getClientes,
    getGuardias,
    getPedidos,
    getUsuarios
}