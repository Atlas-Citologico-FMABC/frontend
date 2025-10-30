const express = require('express');
const router = express.Router();
const professorController = require('../controllers/professorController');

// Login
router.post('/login', professorController.loginProfessor);

module.exports = router;
