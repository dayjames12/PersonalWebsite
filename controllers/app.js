const express = require('express'),
    router = express.Router()


router.get('/', (req,res) => {
    res.render('home', {title: 'James Day'})
})

router.get('/about', (req,res) => {
    res.render('about', {title: 'About'})
})

router.get('/projects', (req,res) => {
    res.render('projects', {title: 'Projects'})
})

router.get('/database', (req,res) => {
    res.render('database', {title: 'CSC651 Final Course Project'})
})

module.exports = router
