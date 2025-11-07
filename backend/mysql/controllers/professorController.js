const db = require('../db');

// Login do professor
exports.loginProfessor = (req, res) => {
  const { email, senha } = req.body;
  db.query(
    'SELECT * FROM Professor WHERE email=? AND senha=?',
    [email, senha],
    (err, results) => {
      if (err) return res.status(500).json({ error: err });
      if (results.length > 0) {
        res.json({ message: 'Login bem-sucedido!', professor: results[0] });
				console.log('professor login: ok');
			}
      else {
        res.status(401).json({ message: 'Credenciais inválidas' });
				console.log('professor login: deu errado');
			}
    }
  );
};
