const pgPromise = require('pg-promise')
const config={
    host:'ec2-3-224-164-189.compute-1.amazonaws.com',
    port:'5432',
    database:'d847rgbjh0ddkj',
    user:'hjbrafgmsfforo',
    password:'f121cd5e892953c968a581eeb211ebc214c3e1a71886ec52e6cfd61a37e510df',
    ssl: {
        rejectUnauthorized: false
      }
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