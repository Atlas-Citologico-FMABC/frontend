const db = require('../db');
require('dotenv').config();

// Login do admin
exports.loginAdmin = (req, res) => {
  const { email_admin, senha } = req.body;

  db.query(
    'SELECT * FROM Admin WHERE email_admin=? AND senha=?',
    [email_admin, senha],
    (err, results) => {
      if (err) return res.status(500).json({ error: err });
      if (results.length > 0){
        res.json({ message: 'Login bem-sucedido', admin: results[0] });
        console.log('login ok');
      }
      else {
        res.status(401).json({ message: 'Credenciais inválidas' });
        console.log('login deu errado');
      }

    }
  );
};

// Criar professor
exports.criarProfessor = (req, res) => {
  const { email, senha, nome, email_admin } = req.body;
  db.query(
    `INSERT INTO Professor (email, senha, nome, email_admin) VALUES (?, ?, ?, ${process.env.ADMIN_DB})`,
    [email, senha, nome, email_admin],
    (err) => {
      if (err) return res.status(500).json({ error: err });
      res.json({ message: 'Professor criado com sucesso!' });
    }
  );
};

// Listar todos os professores
exports.listarProfessores = (req, res) => {
  db.query('SELECT * FROM Professor', (err, results) => {
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
