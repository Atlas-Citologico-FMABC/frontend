const Image = require('../models/image');

exports.getAllImages = async (req, res) => {
  try {
    const items = await Image.find().sort({ createdAt: -1 }).lean();
    res.json(items);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

exports.deleteImage = async (req, res) => {
    try {
        const deletedImage = await Image.findOneAndDelete(
            { imageFolderName: req.params.imageFolderName },
            req.body,
            { new: true, runValidators: true }
        );
        if (!deletedImage) {
            return res.status(404).json({ message: 'Imagem não encontrada para exclusão' });
        }
        res.status(200).json({ message: 'Imagem excluída com sucesso', deletedImage });
    } catch (error) {
        res.status(500).json({ message: 'Erro ao excluir imagem', error: error.message });
    }
};
