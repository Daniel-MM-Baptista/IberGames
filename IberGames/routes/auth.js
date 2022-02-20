"use strict";

const express = require('express');
const passport = require("passport");
const LocalStrategy = require("passport-local");
const crypto = require("crypto");
const mysql = require("mysql2");
const options = require("../config/options.json");

const router = express.Router();

passport.use(new LocalStrategy(function verify(username, password, done) {
    let connection = mysql.createConnection(options.mysql);
    connection.connect();
    connection.query('SELECT Regist_pass FROM Registado WHERE Regist_name = ?', [username], function (err, row) {
        if (err) { return done(err); }
        if (!row) { return done(null, false, { message: 'Incorrect username or password.' }); }

        if(!(row.Regist_pass == password)){
            return done(null, false, { message: 'Incorrect username or password.' });
        }
        return done(null, row);
    });
}));

/*
A usar quando se der reset na bd e usar-se hashing

passport.use(new LocalStrategy(function verify(username, password, cb) {
    db.get('SELECT rowid AS id, * FROM users WHERE username = ?', [username], function (err, row) {
        if (err) { return cb(err); }
        if (!row) { return cb(null, false, { message: 'Incorrect username or password.' }); }

        crypto.pbkdf2(password, row.salt, 310000, 32, 'sha256', function (err, hashedPassword) {
            if (err) { return cb(err); }
            if (!crypto.timingSafeEqual(row.hashed_password, hashedPassword)) {
                return cb(null, false, { message: 'Incorrect username or password.' });
            }
            return cb(null, row);
        });
    });
}));
*/

router.get("/login", function (req, res, next) {
    res.render("login");
});

router.post('/login/password', passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/login'
  }));

module.exports = router;