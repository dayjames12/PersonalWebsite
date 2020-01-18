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

var routes = require('./routes/routes.js')
app.use('/', routes)


var server = require('http').createServer(app)
server.listen(80, function(){
  console.log('listening...')
})

// app.listen(8000, function(){
//     console.log('listening on port 8000...')
// })