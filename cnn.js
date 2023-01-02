const pgPromise = require('pg-promise')
const config={
    host:'ec2-52-21-136-176.compute-1.amazonaws.com',
    port:'5432',
    database:'d93ndai2jchbq7',
    user:'ijpwdyyssauzwq',
    password:'d921ca747680a10df8cbe822494acb13c2f94711915500b20005b315c6f30309'

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