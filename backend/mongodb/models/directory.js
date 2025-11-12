const mongoose = require('mongoose');

const DirectorySchema = new mongoose.Schema({
  title:           { type: String, required: true, trim: true },
  description:     { type: String, required: true, trim: true },
	imageFolderNames: { type: [String] },
}, { timestamps: true });

module.exports = mongoose.model('Directory', DirectorySchema);
