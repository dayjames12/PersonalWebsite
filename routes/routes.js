var express = require('express')
var router = express.Router()

router.get('/', function(req,res){
    res.render('home', {title: 'James Day'})
})

router.get('/about', function(req,res){
    res.render('about', {title: 'About'})
})

router.get('/projects', function(req,res){
    res.render('projects', {title: 'Projects'})
})

router.get('/database', function(req,res){
    res.render('database', {title: 'CSC651 Final Course Project'})
})

module.exports = router