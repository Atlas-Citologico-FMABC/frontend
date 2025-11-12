const Directory = require('../models/directory');

exports.getAllDirectories = async (req, res) => {
  try {
    const directories = await Directory.find().sort({ createdAt: -1 }).lean();
    res.json(directories);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};
