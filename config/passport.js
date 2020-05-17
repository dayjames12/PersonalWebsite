var LocalStrategy = require("passport-local").Strategy;

var mysql = require('mysql');
var bcrypt = require('bcrypt-nodejs');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);

connection.query('USE ' + dbconfig.database);

module.exports = function(passport) {
    passport.serializeUser(function(user, done){
        done(null, user.userID)
    })

    passport.deserializeUser(function(id, done){
        connection.query("SELECT * FROM users WHERE userID = ? ", [id], function(err, rows){
            if (err) {
                console.log(err);
                throw err
            }
            done(err, rows[0])
        });
    })

    passport.use(
        'local-register',
        new LocalStrategy({
            usernameField: 'username',
            passwordField: 'password',
            passReqToCallback: true
        },
        function(req, username, password, done){
            connection.query("SELECT * FROM users WHERE username = ?", [username], function(err,rows){
                if (err) {
                    return done(err)
                }
                if (rows.length){
                    return done(null, false, req.flash('registerMessage', "Username taken"))
                } else {
                    var newUser = {
                        username: username,
                        password: bcrypt.hashSync(password, null, null)
                    }
                }

                var insertQuery = "INSERT INTO users (username, password) values (?, ?)"

                connection.query(insertQuery, [newUser.username, newUser.password],
                    function(err, rows){
                        if (err) {
                            console.log(err);
                            throw err
                        }
                        newUser.userID = rows.insertId
                        return done(null, newUser)
                    }
                )
            })
        }
        )
    )

    passport.use(
        'local-login',
        new LocalStrategy({
            usernameField: 'username',
            passwordField: 'password',
            passReqToCallback: true
        },
        function(req, username, password, done){
            connection.query("SELECT * FROM users WHERE username = ?", [username], 
            function(err, rows){
                if (err) {
                    console.log(err)
                    return done(err)
                }
                if (!rows.length){
                    return done(null, false, req.flash('loginMessage', 'No user found with that username'))
                }
                if (!bcrypt.compareSync(password, rows[0].password)){
                    return done(null, false, req.flash('loginMessage', 'Wrong password'))
                }
                return done(null, rows[0])
            })
        }
        )
    )

}
