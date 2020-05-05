const express = require('express'),
    router = express.Router()
    db = require('./db')


// insert car test
router.get('/database/insertCar', (req,res) =>{
    let car = {license:'3489257', miles:'70000', carTypeID:'1'} 
    let sql = 'INSERT INTO car SET ?'
    let query = db.query(sql, car, (err,res) => {
        if (err) throw err
        console.log(res)
        console.log('It worked!')
    })
})

module.exports = router
