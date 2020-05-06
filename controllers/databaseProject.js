const express = require('express'),
    router = express.Router()
    db = require('./db')


// insert car test
router.post('/insertCar', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO car SET ?'
    let car = {
        license:req.body.license,
        miles:req.body.mile,
        carTypeID:req.body.carTypeID} 
    let query = db.query(sql, car, (err,res) => {
        if (err) throw err
        console.log(res)
        console.log('It worked!')
    })
    res.render('651-database-project/database', {title: 'CSC651 Final Course Project'})
})

router.get('/carList', (req,res,next) => {
    let sql = 'SELECT * FROM car'
    db.query(sql, (err, data, fields) => {
        if (err) throw err
        res.render('carList', { title: 'Car List', carData: data})
    })
})



module.exports = router
