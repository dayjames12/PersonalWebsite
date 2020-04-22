var express = require('express')
var cookieParser = require('cookie-parser')
var bodyParser = require('body-parser')
var hbs = require('express-handlebars')
var path = require('path')
var morgan = require('morgan')

var app = express()

app.use(morgan('dev'))
app.use(cookieParser())
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
var routes = require('./routes/routes.js')
app.use('/', routes)

//database
var mysql = require('mysql')
var connection = mysql.createConnection({
    host : 'RGB-AIR',
    user : 'root',
    password: 'Whiskey12!',
    database : 'dealership'
})

connection.connect(function(err) {
  if (err) {
    console.error('error connecting: ' + err.stack);
    return;
  }

  console.log('connected as id ' + connection.threadId);
});
connection.end()

// 404 error handling
app.use(function(req,res,next){
  if (req.accepts('html')){
    res.render('404', {title : 'Not Found', url: req.url})
    return
  }
})

// port
var server = require('http').createServer(app)
var port = 3000
server.listen(port, function(){
  console.log('listening on ' + port + '...')
})