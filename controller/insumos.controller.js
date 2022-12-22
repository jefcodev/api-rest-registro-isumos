const { db } = require("../cnn")


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





module.exports={
    getClientes,
    getGuardias
}