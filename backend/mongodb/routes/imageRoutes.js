const express = require('express');
const imageController = require('../controllers/imageController');

const router = express.Router();

router.get('/images', imageController.getAllImages);
// router.get('/image/:name', imageController.getImageByName);

module.exports = router;
