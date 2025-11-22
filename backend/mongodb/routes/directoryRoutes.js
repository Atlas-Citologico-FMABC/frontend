const express = require('express');
const directoryController = require('../controllers/directoryController');

const router = express.Router();

router.get('/directories', directoryController.getAllDirectories);
// router.get('/directory/:title', directoryController.getDirectory);
router.post('/directories', directoryController.createDirectory);
router.put('/directories/:title', directoryController.updateDirectory);
router.delete('/directories/:title', directoryController.deleteDirectory);

module.exports = router;