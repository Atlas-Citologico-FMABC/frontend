const Image = require('../models/image');

exports.getAllImages = async (req, res) => {
  try {
    const items = await Image.find().sort({ createdAt: -1 }).lean();
    res.json(items);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};
