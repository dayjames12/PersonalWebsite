const mysql = require("mysql"),
  dbconfig = require("../config/database.js");

//database
const connection = mysql.createConnection(dbconfig.connection);

connection.connect(function (error) {
  console.log("yes");
  if (error) throw error;
  console.log("nooo");
  console.log("MySQL connected...");
});

module.exports = connection;
