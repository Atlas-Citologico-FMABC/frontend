const db = require('../db');
require('dotenv').config();

// Login do admin
exports.loginAdmin = (req, res) => {
  const { email, senha } = req.body;

  db.query(
    'SELECT * FROM Admin WHERE email=? AND senha=?',
    [email, senha],
    (err, results) => {
      if (err) return res.status(500).json({ error: err });
      if (results.length > 0){
        res.json({ message: 'Login bem-sucedido', admin: results[0] });
        console.log('admin login: ok');
      }
      else {
        res.status(401).json({ message: 'Credenciais inválidas' });
        console.log('admin login: deu errado');
      }

    }
  );
};

// Criar professor
exports.criarProfessor = (req, res) => {
  const { email, senha, nome } = req.body;
  db.query(
    `INSERT INTO Professor (email, senha, nome) VALUES (?, ?, ?)`,
    [email, senha, nome],
    (err) => {
      if (err) return res.status(500).json({ error: err });
      res.json({ message: 'Professor criado com sucesso!' });
    }
  );
};

// Listar todos os professores
exports.listarProfessores = (req, res) => {
  db.query('SELECT email, nome FROM Professor', (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
};

// Atualizar professor
exports.atualizarProfessor = (req, res) => {
  const { email } = req.params;
  const { nome, senha } = req.body;
  db.query(
    'UPDATE Professor SET nome=?, senha=? WHERE email=?',
    [nome, senha, email],
    (err) => {
      if (err) return res.status(500).json({ error: err });
      res.json({ message: 'Professor atualizado com sucesso!' });
    }
  );
};

// Deletar professor
exports.deletarProfessor = (req, res) => {
  const { email } = req.params;
  db.query('DELETE FROM Professor WHERE email=?', [email], (err) => {
    if (err) return res.status(500).json({ error: err });
    res.json({ message: 'Professor removido com sucesso!' });
  });
};
