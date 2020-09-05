const express = require('express'),
    cookieParser = require('cookie-parser'),
    bodyParser = require('body-parser'),
    hbs = require('express-handlebars'),
    path = require('path'),
    morgan = require('morgan'),
    passport = require('passport'),
    session = require('express-session'),
    flash = require('connect-flash'),
    app = express()

// middleware
app.use(morgan('dev'))
app.use(cookieParser())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true }))

// path
app.use(express.static(__dirname + '/public'));

// view engine
app.engine('hbs', hbs({
    extname:'hbs',
    defaultLayout:'mainLayout',
    layoutsDir:__dirname + '/views/layouts/'
}));
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'hbs');

// routes
app.use(require('./routes/app'))
app.use(require('./controllers/databaseProject'))

// passport and session
require('./config/passport.js')(passport);

app.use(session({
    secret: 'biglittlesecret',
    resave: true,
    saveUninitialized: true
}))

app.use(passport.initialize())
app.use(passport.session())
app.use(flash())

require('./routes/database.js')(app, passport)


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

module.exports = bodyParser
