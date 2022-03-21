const MYSQL = require('mysql'),
  STR_DATABASE = 'mahoutokoro_anime',
  POOL = MYSQL.createPool({
    connectionLimit: 10,
    host: 'localhost',
    port: '3306',
    user: 'mahoutokoro_admin',
    password: 'TXxXkmW0vSo)O19O',
    database: STR_DATABASE,
    dateStrings: true
  });

module.exports = POOL
