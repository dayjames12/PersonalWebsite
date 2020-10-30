const express = require('express'),
    router = express.Router()

// Home Page
router.get('/', (req,res) => {
    res.render('home', {title: 'James Day'})
})

// About Page
router.get('/about', (req,res) => {
    res.render('about', {title: 'About'})
})

// Projects Main Page
router.get('/projects', (req,res) => {
    res.render('projects', {title: 'Projects'})
})

// get project page
// router.get('/database', (req,res) => {
//     res.render('651-database-project/database', {title: 'CSC651 Final Course Project'})
// })

// Adding small dog api tutorial I did from LearnWebCode on youtube
router.get('/projects/dog', (req,res) => {
    res.render('Projects/dog.hbs', {title: 'Dogs'})
})

// Route for my CSC-413 Tank Game
router.get('/projects/tankGame', (req,res) => {
    res.render('Projects/tankGame.hbs', {title: 'Tank Game'})
})


module.exports = router
