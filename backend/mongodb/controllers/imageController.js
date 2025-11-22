const Image = require('../models/image');

exports.getAllImages = async (req, res) => {
  try {
    const items = await Image.find().sort({ createdAt: -1 }).lean();
    res.json(items);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};
// exports.getImageByName = async (req, res) => {
//   try {
//       const name = req.params.imageFolderName;
//       const directory = await Image.findOne({ name }).lean();

//       if (!directory) {
//           return res.status(404).json({ message: 'Imagem não encontrada' });
//       }
//     } catch (e) {
//         res.status(500).json({ message: 'Erro ao buscar imagem', error: error.message });
//     }
// }


// PROFESSOR REQ

exports.createImage = async (req, res) => {
    try {
        const newImage = new Image(req.params);
        const savedImage = await newImage.save();
        res.status(201).json(savedImage);
    } catch (error) {
        // Erro de validação ou nome duplicado
        res.status(400).json({ message: 'Erro ao criar imagem', error: error.message });
    }
};
exports.updateImage = async (req, res) => {
    try {
        const updatedImage = await Image.findOne(
            req.params.title,
            req.params.description,
            req.params.imageFolderName,
            { new: true, runValidators: true } // Retorna o documento atualizado e executa validações
        );
        if (!updatedImage) {
            return res.status(404).json({ message: 'Imagem não encontrada para atualização' });
        }
        res.status(200).json(updatedImage);
    } catch (error) {
        res.status(400).json({ message: 'Erro ao atualizar imagem', error: error.message });
    }
};
exports.deleteImage = async (req, res) => {
    try {
        const deletedImage = await Image.findOne(req.params.imageFolderName);
        if (!deletedImage) {
            return res.status(404).json({ message: 'Imagem não encontrada para exclusão' });
        }
        // Nota: Em um sistema real, você também precisaria remover a referência desta imagem de todos os diretórios.
        res.status(200).json({ message: 'Imagem excluída com sucesso', deletedImage });
    } catch (error) {
        res.status(500).json({ message: 'Erro ao excluir imagem', error: error.message });
    }
};