const express = require('express'),
    router = express.Router({mergeParams:true}),
    mysql = require('mysql')
    dbconfig = require('../config/database.js'),
    connection = mysql.createConnection(dbconfig.connection)

connection.query('USE ' + dbconfig.database);


// ----------------------------SELECT ALL START----------------------------
router.get('/database/retrieve/:table', (req,res) => {
    let sql = `SELECT * FROM ${req.params.table}`
    
    console.log(sql)
    connection.query(sql, (err, data, fields) => {
        if (err) throw err
        res.send(data)
    })
})
// ----------------------------DELETE----------------------------
router.delete('/database/delete/:table/:name/:number', (req,res) =>{    
    let sql = `DELETE FROM ${req.params.table} WHERE ${req.params.name} = \'${req.params.number}\'`

    console.log(sql)
    connection.query(sql, (err, data, fields) =>{
        if (err) {
            var status = {'worked':'false','message':`${err.code}`}
            res.send(status)
            return console.log(err);
        }
        console.log(data);
        res.send(data)
    })
})


// ----------------------------UPDATE----------------------------
router.post('/database/update/:table', (req, res) =>{
    let sql = `UPDATE ${req.params.table} SET ? WHERE id = ?`

    console.log(sql);
    connection.query(sql, (err, data, fields) =>{
        if (err) {
            return console.log(err);
        }
        res.send(data)
    })
    
})

// res.render('651-database-project/database.hbs', {message: 'Worked!'})


// ----------------------------INSERT START----------------------------
// insert car
router.post('/insertCar', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO car SET ?'
    let data = {
        license: req.body.license,
        miles: req.body.mile,
        carTypeID: req.body.carTypeID
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})

// insert car features
router.post('/insertCarFeature', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO `car_features` SET ?'
    let data = {
        carTypeID: req.body.carTypeID,
        cost: req.body.cost,
        featureName: req.body.featureName,
        description: req.body.description
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert car type
router.post('/insertCarType', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO `car_type` SET ?'
    let data = {
        year: req.body.year,
        make: req.body.make,
        model: req.body.model,
        color: req.body.color
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert customer
router.post('/insertCustomer', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO customer SET ?'
    let data = {
        name: req.body.name,
        address: req.body.address,
        phone: req.body.phone
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert customer preference
router.post('/insertCustomerPreference', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO `customer_preference` SET ?'
    let data = {
        customerID: req.body.customerID,
        carFeatureID: req.body.carFeatureID,
        budget: req.body.budget
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert employee
router.post('/insertEmployee', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO employee SET ?'
    let data = {
        name: req.body.name,
        dob: req.body.dob,
        hours: req.body.hours
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert loaner cars
router.post('/insertLoanerCar', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO `loaner_cars` SET ?'
    let data = {
        carID: req.body.carID
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert mechanic
router.post('/insertMechanic', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO mechanic SET ?'
    let data = {
        employeeID: req.body.employeeID
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert parts
router.post('/insertParts', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO parts SET ?'
    let data = {
        cost: req.body.cost
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert parts employee
router.post('/insertPartsEmployee', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO `parts_employee` SET ?'
    let data = {
        employeeID: req.body.employeeID
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert parts used
router.post('/insertPartsUsed', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO `parts_used` SET ?'
    let data = {
        repairID: req.body.repairID,
        quantity: req.body.quantity,
        cost: req.body.cost,
        partID: req.body.partID
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert rentedCars
router.post('/insertRentedCars', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO `rented_cars` SET ?'
    let data = {
        loanerCarID: req.body.loanerCarID,
        customerID: req.body.customerID
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert repair
router.post('/insertRepair', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO repair SET ?'
    let data = {
        carID: req.body.carID,
        mechanicID: req.body.mechanicID,
        serviceManagerID: req.body.serviceManagerID,
        customerID: req.body.customerID,
        description: req.body.description,
        cost: req.body.cost
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert sales
router.post('/insertSales', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO sales SET ?'
    let data = {
        salesEmployeeID: req.body.salesEmployeeID,
        partsEmployeeID: req.body.partsEmployeeID,
        customerID: req.body.customerID,
        carID: req.body.carID,
        tradeInID: req.body.tradeInID,
        partID: req.body.partID
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert sales employee
router.post('/insertSalesEmployee', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO `sales_employee` SET ?'
    let data = {
        employeeID: req.body.employeeID
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert service manager
router.post('/insertServiceManager', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO `service_manager` SET ?'
    let data = {
        employeeID: req.body.employeeID
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// insert trade in
router.post('/insertTradeIn', (req,res) => {
    console.log(req.body)

    let sql = 'INSERT INTO `trade_in` SET ?'
    let data = {
        customerID: req.body.customerID,
        carID: req.body.carID,
        value: req.body.value
    } 
    let query = connection.query(sql, data, (err,res) => {
        if (err){
            return console.log(err);
        }
    })
    res.redirect('/database')
})
// ----------------------------INSERT END----------------------------

module.exports = router
