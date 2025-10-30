const express = require('express');
const cors = require('cors');
require('dotenv').config({path: './.env'});

const app = express();
app.use(cors());
app.use(express.json());

// Rotas
const adminRoutes = require('./routes/adminRoutes');
app.use('/admin', adminRoutes);

const professorRoutes = require('./routes/professorRoutes');
app.use('/professor', professorRoutes);


app.get('/', (req, res) => {
  res.json({ message: 'API Node.js + MySQL + Flutter' });
});
app.listen(process.env.PORT || 3000, () =>
  console.log('Servidor rodando na porta 3000')
);
