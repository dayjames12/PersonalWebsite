const express = require('express'),
    router = express.Router()

router.get('/database', (req,res) => {
    res.render('651-database-project/database', {title: 'CSC651 Final Course Project'})
})



module.exports = router
