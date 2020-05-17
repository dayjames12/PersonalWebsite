module.exports = function(app, passport) {
    app.get('/database', isLoggedIn, function(req, res){
    res.render('651-database-project/database.hbs', {title: 'Database', user:req.user})
})

app.get('/database/login', function(req, res){
    res.render('651-database-project/login.hbs', {title: 'Log in', message:req.flash('loginMessage')})
})

app.post('/database/login', passport.authenticate('local-login', {
    successRedirect: '/database',
    failureRedirect: '/database/login',
    failureFlash: true
}),
function(req, res){
    if(req.body.remember){
        req.session.cookie.maxAge = 1000 * 60 * 3
    }else{
        req.session.cookie.expires = false
    }
    res.redirect('/database')
});

app.get('/database/register', function(req, res){
    res.render('651-database-project/register.hbs', {title: 'Create Account', message: req.flash('registerMessage')})
})

app.post('/database/register', passport.authenticate('local-register', {
    successRedirect: '/database/login',
    failureRedirect: '/database/register',
    failureFlash: true
}))

app.get('/database/users', isLoggedIn, function(req, res){
    res.render('651-database-project/users.hbs', {
        user:req.user
    })
})

app.get('/database/logout', function(req,res){
    req.logout()
    res.redirect('/database/login')
})
}

function isLoggedIn(req, res, next){
    if(req.isAuthenticated())
        return next()
    res.redirect('/database/login')
}



