const pgPromise = require('pg-promise')
const config={
    host:'localhost',
    port:'5432',
    database:'insumos',
    user:'postgres',
    password:'root'
}
const pgp = pgPromise({})
const db = pgp(config)
exports.db=db