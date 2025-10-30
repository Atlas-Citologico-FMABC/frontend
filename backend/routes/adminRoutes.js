const express = require('express');
const router = express.Router();
const adminController = require('../controllers/adminController');

// Login
router.post('/login', adminController.loginAdmin);

// CRUD de professores
router.post('/professores', adminController.criarProfessor); 
router.get('/professores', adminController.listarProfessores);
router.put('/professores/:email', adminController.atualizarProfessor);
router.delete('/professores/:email', adminController.deletarProfessor);

module.exports = router;
