const Directory = require('../models/directory');

exports.getAllDirectories = async (req, res) => {
    try {
        const directories = await Directory.find().sort({ createdAt: -1 }).lean();
        res.json(directories);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
};
// exports.getDirectory = async (req, res) => {
//   try {
//     const title = req.params.title;
//     const directory = await Directory.findOne({title}).lean();

//     if (!directory) {
//       return res.status(404).json({ message: 'Diretório não encontrado' });
//     }
//     res.json(directory);
//   } catch (e) {
//     res.status(500).json({ error: error.message });
//   }
// };


// PROFESSOR REQ

exports.createDirectory = async (req, res) => {
    try {
        const newDirectory = new Directory(req.body);
        const savedDirectory = await newDirectory.save();
        res.status(201).json(savedDirectory);
    } catch (error) {
        if (error.code === 11000) {
            return res.status(400).json({
                message: 'Já existe um diretório com esse title.'
            });
        }
        res.status(400).json({
            message: 'Erro ao criar diretório',
            error: error.message
        });
    }
};
exports.updateDirectory = async (req, res) => {
    try {
        const updatedDirectory = await Directory.findOneAndUpdate(
            { title: req.params.title },
            req.body,
            { new: true, runValidators: true }
        );
        if (!updatedDirectory) {
            return res.status(404).json({ message: 'Diretório não encontrado' });
        }
        res.status(200).json(updatedDirectory);
    } catch (error) {
        if (error.code === 11000) {
            return res.status(400).json({
                message: "Já existe um diretório com esse title."
            });
        }
        res.status(400).json({ message: 'Erro ao atualizar diretório', error: error.message });
    }
};
exports.deleteDirectory = async (req, res) => {
    try {
        const deletedDirectory = await Directory.findOneAndDelete(
            { title: req.params.title },
            req.body,
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