const express = require('express');
const directoryController = require('../controllers/directoryController');

const router = express.Router();

router.get('/directories', directoryController.getAllDirectories);
router.put('/directories', directoryController.updateDirectory);
router.delete('/directories', directoryController.deleteDirectory);

module.exports = router;
