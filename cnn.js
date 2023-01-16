const pgPromise = require('pg-promise')
const config={
    host:'localhost',
    port:'5432',
    database:'prueba_insumos',
    user:'postgres',
    password:'root'
    }
    
const pgp = pgPromise({})
const db = pgp(config)
exports.db=db

/* const { Client } = require('pg');

const client = new Client({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

client.connect();

client.query('SELECT table_schema,table_name FROM information_schema.tables;', (err, res) => {
  if (err) throw err;
  for (let row of res.rows) {
    console.log(JSON.stringify(row));
  }
  client.end();
}); */


/* Mensaje de prueba para revisar configuración de Heroku */