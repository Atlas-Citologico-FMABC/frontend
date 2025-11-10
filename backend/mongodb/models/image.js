const mongoose = require('mongoose');

const ImageSchema = new mongoose.Schema({
	imageFolderName: { type: String, required: true, trim: true, unique: true },
  title:           { type: String, required: true, trim: true },
  description:     { type: String, required: true, trim: true },
}, { timestamps: true });

module.exports = mongoose.model('Image', ImageSchema);
