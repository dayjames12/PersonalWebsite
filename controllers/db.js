const mysql = require('mysql')

//database
const db = mysql.createConnection({
    host : 'localhost',
    user : 'root',
    database : 'Dealership'
})

db.connect(function(error) {
	if (error) throw error
	console.log('MySQL connected...')
})



module.exports = db
