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

module.exports = router
