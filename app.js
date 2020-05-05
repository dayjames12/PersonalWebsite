const express = require('express'),
    cookieParser = require('cookie-parser'),
    bodyParser = require('body-parser'),
    hbs = require('express-handlebars'),
    path = require('path'),
    morgan = require('morgan'),
    // mysql = require('mysql'),
    app = express()

// middleware
app.use(morgan('dev'))
app.use(cookieParser())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true }))

app.use(express.static(__dirname + '/public'));

app.engine('hbs', hbs({
    extname:'hbs',
    defaultLayout:'layout',
    layoutsDir:__dirname + '/views/layouts/'
}));
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'hbs');

//routes
app.use(require('./routes/app'))
app.use(require('./controllers/databaseProject'))

// //database
// const db = mysql.createConnection({
//     host : 'localhost',
//     user : 'root',
//     database : 'Dealership'
// })

// db.connect(function(error) {
// 	if (error) throw error
// 	console.log('MySQL connected...')
// })

// 404 error handling
app.use(function(req,res,next){
    if (req.accepts('html')){
        res.render('404', {title : 'Not Found', url: req.url})
        return
    }
})

// port
const server = require('http').createServer(app),
    port = 3000
server.listen(port, () => console.log(`Listening on ${port}...`))

module.exports = db
