const express = require('express');
const imageController = require('../controllers/imageController');

const router = express.Router();

router.get('/images', imageController.getAllImages);
router.delete('/images/:imageFolderName', imageController.deleteImage);

module.exports = router;
