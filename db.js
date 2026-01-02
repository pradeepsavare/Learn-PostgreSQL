const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "school",
  password: "your passqord",
  port: 5432,
});

module.exports = pool;
