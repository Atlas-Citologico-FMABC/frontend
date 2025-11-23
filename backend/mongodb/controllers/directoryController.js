const Directory = require('../models/directory');

exports.getAllDirectories = async (req, res) => {
  try {
    const directories = await Directory.find().sort({ createdAt: -1 }).lean();
    res.json(directories);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

exports.deleteDirectory = async (req, res) => {
    try {
        const deletedDirectory = await Directory.findOneAndDelete(
						{ title: req.body.title },
            { new: true, runValidators: true }
        );
        if (!deletedDirectory) {
            return res.status(404).json({ message: 'Diretório não encontrado para exclusão' });
        }
        res.status(200).json({ message: 'Diretório excluído com sucesso', deletedDirectory });
    } catch (error) {
        res.status(500).json({ message: 'Erro ao excluir diretório', error: error.message });
    }
};
